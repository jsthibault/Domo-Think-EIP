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
        persistencyManager.clearTabDirectives()
        
        for directive in (directiveJson as NSArray) {
            var tmp = Directive(id: directive["id"]!!.integerValue, title: directive["name"] as! String, dateCreate: NSDate(), dateApply: NSDate(), isActive: true)
            persistencyManager.addDirective(tmp, index: tmp._id)
            table.append(tmp)
        }
        return table
    }
    
    func gethighestId() -> Int {
       return persistencyManager.getHighestID()
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
                "name": "test",
                "type": 4
            ]
        ]
        persistencyManager.addDirective(directive, index: index)
        request.postRequest("http://localhost:8080/api/directive", body: jsonObject)
    }
    
    func deleteDirective(id: Int, index: Int) {
        persistencyManager.deleteDirectiveAtIndex(index)
        request.deleteRequest("http://localhost:8080/api/directive/\(id)")
    }
    
    func setIsActive(directive: Directive, value: Bool) {
        persistencyManager.setIsActive(directive, value: value)
    }
    
    func countDirectives() -> Int {
        return persistencyManager.countDirectives()
    }
    
    func updateDirective(directive: Directive, id: Int) {
        
        let jsonObject: [String: AnyObject] = [
            "actionId": 55,
            "creatorId": 8,
            "id": directive._id,
            "name": directive._title,
            "objectId": 4,
            "periodicity": [
                "data": "plein de data ta vu",
                "name": "test",
                "type": 4
            ]
        ]
        
        persistencyManager.updateDirective(directive, id: id)
        request.putRequest("http://localhost:8080/api/directive/\(id)", body: jsonObject)
    }
    
    /*
    ** Device functions
    */
    
    func getDevice() -> [Device] {
        //return persistencyManager.getDevices()
        
        var deviceJson = request.getRequest("http://localhost:8080/api/device")
        println(deviceJson)
        var table = [Device]()
        persistencyManager.clearTabDevices()
        
        for device in (deviceJson as NSArray) {
            var activate: Bool!
            if (device["state"]!!.integerValue == 1) {
                activate = true
            }
            else {
                activate = false
            }
            var tmp = Device(id: device["id"]!!.integerValue, name: device["name"] as! String, isActive: activate, description: device["description"] as! String)
            persistencyManager.addDevice(tmp, index: tmp._id)
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
        
        
        let jsonObject: [String: AnyObject] = [
            "id": device._id,
            "name": device._name,
            "description": device._description,
            "state": false
        ]
        request.postRequest("http://localhost:8080/api/device", body: jsonObject)
    }
    
    func deleteDevice(id: Int, index: Int) {
        persistencyManager.deleteDeviceAtIndex(index)
        request.deleteRequest("http://localhost:8080/api/device/\(id)")
        /*if isOnline {
        httpClient.postRequest()
        }*/
    }
    
    func setIsActiveDevice(device: Device, value: Bool) {
        persistencyManager.setIsActiveDevice(device, value: value)
        let jsonObject: [String: AnyObject] = [
            "value" : value,
        ]
        request.putRequest("http://localhost:8080/api/device/activate/\(device._id)", body: jsonObject)
    }
    
    func gethighestIdDevice() -> Int {
        return persistencyManager.getHighestIdDevice()
    }
    
    func updateDevice(device: Device, id: Int) {
        
        let jsonObject: [String: AnyObject] = [
            "id": id,
            "name": device._name,
            "description": device._description, //verifier si besoin de l'update
            "state": device._isActive,
        ]
        
        persistencyManager.updateDevice(device, id: id)
        request.putRequest("http://localhost:8080/api/device/\(id)", body: jsonObject)
    }
    
    func countDevices() -> Int {
        return persistencyManager.countDevices()
    }
    

    /*
    ** Plugin functions
    */
    
    func getPlugins() -> [Plugin] {
        var pluginJson = request.getRequest("http://localhost:8080/api/plugin")
        println(pluginJson)
        var table = [Plugin]()
        persistencyManager.clearTabPlugins()
        
        var dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        for plugin in (pluginJson as NSArray) {
            var activate: Bool!
            if (plugin["isActive"]!!.integerValue == 1) {
                activate = true
            }
            else {
                activate = false
            }
            println(plugin)
            var date = dateFormatter.dateFromString(plugin["publishDate"] as! String)
            var tmp = Plugin(id: plugin["id"]!!.integerValue, name: plugin["name"] as! String, description: plugin["description"] as! String, imgName: plugin["imgName"] as! String, rate: plugin["rate"] as! Float, date: date!, isActive: activate, author: plugin["author"] as! String)
            persistencyManager.addPlugin(tmp, index: tmp._id)
            table.append(tmp)
        }
        return table
    }
    
    func deletePlugin(id: Int, index: Int) {
        persistencyManager.deletePluginAtIndex(index)
        request.deleteRequest("http://localhost:8080/api/plugin/\(id)")
    }
    
    func setIsActivePlugin(plugin: Plugin, value: Bool) {
        persistencyManager.setIsActivePlugin(plugin, value: value)
        let jsonObject: [String: AnyObject] = [
            "value" : value,
        ]
        request.putRequest("http://localhost:8080/api/plugin/activate/\(plugin._id)", body: jsonObject)
    }
    
    func getPluginStore() -> [Plugin] {
        return persistencyManager.getPluginStore()
    }
    
    func getPluginRated() -> [Plugin] {
        return persistencyManager.getPluginRated()
    }
    
    func getHighestIdPlugin() -> Int {
        return persistencyManager.getHighestIdPlugin()
    }
    
    func installPlugin(plugin: Plugin, value: Bool) {
        plugin._installed = value
        plugin._id = getHighestIdPlugin()
        
        
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        
        let jsonObject: [String: AnyObject] = [
            "id": plugin._id,
            "name" : plugin._name,
            "description" : plugin._description,
            "imgName" : plugin._imgName,
            "rate": plugin._rate,
            "publishDate": dateFormatter.stringFromDate(plugin._publishDate),
            "installed": plugin._installed,
            "isActive": plugin._isActive,
            "author": plugin._author
        ]
        request.postRequest("http://localhost:8080/api/plugin", body: jsonObject)
        persistencyManager.installPlugin(plugin, index: plugin._id)
    }
    
    /*
    ** Methods User
    */
    
    func getToken() -> String {
        return persistencyManager.getToken()
    }
    
    func setToken(tokenToSet: String) {
        persistencyManager.setToken(tokenToSet)
    }
    
    func getLogin() -> String {
        return persistencyManager.getLogin()
    }
    
    func setLogin(loginToSet: String) {
        persistencyManager.setLogin(loginToSet)
    }
    
    func getUserId() -> String {
        return persistencyManager.getUserId()
    }
    
    func setUserId(userIdToSet: String) {
        persistencyManager.setUserId(userIdToSet)
    }
    
    func getPassword() -> String {
        return persistencyManager.getPassword()
    }
    
    func setPassword(passToSet: String) {
        persistencyManager.setPassword(passToSet)
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
