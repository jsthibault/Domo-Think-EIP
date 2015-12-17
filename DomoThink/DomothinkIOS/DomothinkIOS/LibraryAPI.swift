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
    //private let httpClient: HTTPClient
    //private let isOnline: Bool
    
    
    override init() {
        persistencyManager = PersistencyManager()
        //httpClient = HTTPClient()
        //isOnline = false
        
        super.init()
    }
    
    /*
    ** Directive functions
    */
    
    func getDirectives() -> [Directive] {
        return persistencyManager.getDirectives()
    }
    
    func addDirective(directive: Directive, index: Int) {
        persistencyManager.addDirective(directive, index: index)
        /*if isOnline {
            httpClient.postRequest("/api/addAlbum", body: album.description)
        }*/
    }
    
    func deleteDirective(index: Int) {
        persistencyManager.deleteDirectiveAtIndex(index)
        /*if isOnline {
            httpClient.postRequest("/api/deleteAlbum", body: "\(index)")
        }*/
    }
    
    func setIsActive(directive: Directive, value: Bool) {
        persistencyManager.setIsActive(directive, value: value)
    }
    
    func countDirectives() -> Int {
        return persistencyManager.countDirectives()
    }
    
    /*
    ** Device functions
    */
    
    func getDevice() -> [Device] {
        return persistencyManager.getDevices()
    }
    
    func addDevice(device: Device, index: Int) {
        persistencyManager.addDevice(device, index: index)
        /*if isOnline {
        httpClient.postRequest("/api/addAlbum", body: album.description)
        }*/
    }
    
    func deleteDevice(index: Int) {
        persistencyManager.deleteDeviceAtIndex(index)
        /*if isOnline {
        httpClient.postRequest("/api/deleteAlbum", body: "\(index)")
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
        httpClient.postRequest("/api/addAlbum", body: album.description)
        }*/
    }
    
    func deletePlugin(index: Int) {
        persistencyManager.deleteDeviceAtIndex(index)
        /*if isOnline {
        httpClient.postRequest("/api/deleteAlbum", body: "\(index)")
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
