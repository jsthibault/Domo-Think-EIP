//
//  LibraryAPI.swift
//  DomothinkIOS
//
//  Created by Guillaume Wehrling on 27/11/2015.
//  Copyright (c) 2015 DomoThink. All rights reserved.
//

import UIKit

class LibraryAPI: NSObject {
    
    private let persistencyManager: PersistencyManager
    private let request: HttpRequest
    //private let httpClient: HTTPClient
    //private let isOnline: Bool
    
    
    override init() {
        persistencyManager = PersistencyManager()
        request = HttpRequest()
        //httpClient = HTTPClient()
        //isOnline = false
        
        super.init()
    }
    
    /*
    ** Directive functions
    */
    
    func getDirectives() -> [Directive] {
        var directiveJson = request.getRequest("http://localhost:8080/api/directive")
        println(directiveJson)
        var table = [Directive]()
        
        for directive in (directiveJson as NSArray) {
            var tmp = Directive(id: directive["id"]!!.integerValue, title: directive["name"] as! String, dateCreate: NSDate(), dateApply: NSDate(), isActive: true)
            table.append(tmp)
        }
        //id: Int, title: String, dateCreate: NSDate, dateApply: NSDate, isActive: Bool
        //return persistencyManager.getDirectives()
        return table
    }
    
    func addDirective(directive: Directive, index: Int) {
        //persistencyManager.addDirective(directive, index: index)
        
        let jsonObject: [String: AnyObject] = [
            "actionId": 55,
            "creatorId": 8,
            "id": directive._id,
            "name": directive._title,
            "objectId": 4,
            "periodicity": [
                "data": "plein de data ta vu",
                "name": "ma bite",
                "type": 4
            ]
        ]
        
        request.postRequest("http://localhost:8080/api/directive", body: jsonObject)
        /*if isOnline {
            httpClient.postRequest()
        }*/
    }
    
    func deleteDirective(index: Int) {
        persistencyManager.deleteDirectiveAtIndex(index)
        /*if isOnline {
            httpClient.postRequest()
        }*/
    }
    
    func setIsActive(directive: Directive, value: Bool) {
        persistencyManager.setIsActive(directive, value: value)
    }
    
    func countDirectives() -> Int {
        return persistencyManager.countDirectives()
    }
    
    func updateDirective(directive: Directive, id: Int) {
        persistencyManager.updateDirective(directive, id: id)
    }
    
    /*
    ** Device functions
    */
    
    func getDevice() -> [Device] {
        //return persistencyManager.getDevices()
        
        var deviceJson = request.getRequest("http://localhost:8080/api/device")
        println(deviceJson)
        var table = [Device]()
        
        for device in (deviceJson as NSArray) {
            var activate: Bool!
            if (device["activate"]!!.integerValue == 1) {
                activate = true
            }
            else {
                activate = false
            }
            var tmp = Device(id: device["id"]!!.integerValue, name: device["name"] as! String, isActive: activate, description: device["description"] as! String)
            table.append(tmp)
        }
        //id: Int, title: String, dateCreate: NSDate, dateApply: NSDate, isActive: Bool
        //return persistencyManager.getDirectives()
        return table
    }
    
    func addDevice(device: Device, index: Int) {
        persistencyManager.addDevice(device, index: index)
        /*if isOnline {
        httpClient.postRequest()
        }*/
    }
    
    func deleteDevice(index: Int) {
        persistencyManager.deleteDeviceAtIndex(index)
        /*if isOnline {
        httpClient.postRequest()
        }*/
    }
    
    func setIsActiveDevice(device: Device, value: Bool) {
        persistencyManager.setIsActiveDevice(device, value: value)
    }

    /*
    ** Plugin functions
    */
    
    func getPlugins() -> [Plugin] {
        return persistencyManager.getPlugins()
    }
    
    func getPluginsInstalled() -> [Plugin] {
        return persistencyManager.getPluginsInstalled()
    }
    
    func getPluginsRated() -> [Plugin] {
        return persistencyManager.getPluginsRated()
    }
    
    func addPlugin(device: Device, index: Int) {
        persistencyManager.addDevice(device, index: index)
        /*if isOnline {
        httpClient.postRequest()
        }*/
    }
    
    func deletePlugin(index: Int) {
        persistencyManager.deleteDeviceAtIndex(index)
        /*if isOnline {
        httpClient.postRequest()
        }*/
    }
    
    func adjustRate(plugin: Plugin, rate: Int) {
        persistencyManager.adjustRate(plugin, rate: rate)
    }
    
    func installPlugin(plugin: Plugin, value: Bool) {
        persistencyManager.installPlugin(plugin, value: value)
    }
    
    func setIsActivePlugin(plugin: Plugin, value: Bool) {
        persistencyManager.setIsActivePlugin(plugin, value: value)
    }
    
    //1
    class var sharedInstance: LibraryAPI {
        //2
        struct Singleton {
            //3
            static let instance = LibraryAPI()
        }
        //4
        return Singleton.instance
    }
    
    
   
}
