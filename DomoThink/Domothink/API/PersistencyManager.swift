//
//  PersistencyManager.swift
//  Domothink
//
//  Created by Guillaume Wehrling on 22/10/2016.
//  Copyright © 2016 DomoThink. All rights reserved.
//

import UIKit

class PersistencyManager: NSObject {
    
    private var _user: User!
    private var _devices: [Device]!
    private var _plugins: [Plugin]!
    private var _directives: [Directive]!
    private var _storePlugins: [StorePlugin]!
    private var _storeComments: [StoreComment]!
    
    override init() {
        _devices = [Device]()
        _plugins = [Plugin]()
        _directives = [Directive]()
        _storePlugins = [StorePlugin]()
        _storeComments = [StoreComment]()
    }
    
    /*
    ** User
    */

    
    func getUser() -> User {
        return _user
    }
    
    func setUser(user: User) {
        _user = user
    }
    
    /*
    ** Devices
    */
    
    func getDevices() -> [Device] {
        return _devices
    }
    
    func addDevice(device: Device) {
        _devices.append(device)
    }
    
    func removeAllDevices() {
        _devices.removeAll()
    }
    
    /*
     ** Plugins
     */
    
    func getPlugins() -> [Plugin] {
        return _plugins
    }
    
    func addPlugin(plugin: Plugin) {
        _plugins.append(plugin)
    }
    
    func removeAllPlugins() {
        _plugins.removeAll()
    }
    
    /*
     ** StorePlugins
     */
    
    func getStorePlugins() -> [StorePlugin] {
        return _storePlugins
    }
    
    func addStorePlugin(storePlugin: StorePlugin) {
        _storePlugins.append(storePlugin)
    }
    
    func removeAllStorePlugins() {
        _storePlugins.removeAll()
    }
    
    /*
     ** StoreComments
     */
    
    func getStoreComments() -> [StoreComment] {
        return _storeComments
    }
    
    func addStoreComment(storeComment: StoreComment) {
        _storeComments.append(storeComment)
    }
    
    func removeAllStoreComments() {
        _storeComments.removeAll()
    }
    
    /*
     ** Directives
     */
    
    func getDirectives() -> [Directive] {
        return _directives
    }
    
    func addDirective(directive: Directive) {
        _directives.append(directive)
    }
    
    func removeAllDirectives() {
        _directives.removeAll()
    }
    
}
