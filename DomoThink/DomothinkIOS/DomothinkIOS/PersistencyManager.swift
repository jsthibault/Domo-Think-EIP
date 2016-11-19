//
//  PersistencyManager.swift
//  DomothinkIOS
//
//  Created by Guillaume Wehrling on 27/11/2015.
//  Copyright (c) 2015 DomoThink. All rights reserved.
//

import UIKit

class PersistencyManager: NSObject {
    private var directives = [Directive]()
    private var devices = [Device]()
    private var plugins = [Plugin]()
    private var pluginStore = [Plugin]()
    
    private var token: String!
    private var login: String!
    private var userId: String!
    private var password: String!
    
    override init() {
        let directive1 = Directive(id: 0, title: "Allumage four", dateCreate: NSDate(), dateApply: NSDate(), isActive: true)
        let directive2 = Directive(id: 1, title: "Eteindre les lumieres", dateCreate: NSDate(), dateApply: NSDate(), isActive: false)
        
        let device1 = Device(id: 1, name: "Oven", isActive: false, description: "four ma gueul")
        let device2 = Device(id: 2, name: "Garden Light", isActive: true, description: "light ma gueule")
        let device3 = Device(id: 3, name: "TV", isActive: false, description: "TV ma gueul")
        let device4 = Device(id: 4, name: "Stereo", isActive: true, description: "Stereo ma gueul")
        
        
        let plugin1 = Plugin(id: 1, name: "Valentine Mood",
            description: "vous voulez faire une surprise a votre femme ?",
            imgName: "images.jpeg",
            rate: 4.5,
            date: NSDate(),
            isActive: false,
            author: "jean jack"
            )
        let plugin2 = Plugin(id: 2, name: "Musical Setup",
            description: "Reglez votre musique comme bon vous semble",
            imgName: "images.jpeg",
            rate: 2,
            date: NSDate(),
            isActive: false,
            author: "jack henry de la bergerie")
        let plugin3 = Plugin(id: 3, name: "Film Setup",
            description: "Selectionner un film a distance",
            imgName: "images.jpeg",
            rate: 1,
            date: NSDate(),
            isActive: false,
            author: "steve jobs")
        let plugin4 = Plugin(id: 4, name: "Working Ambiance",
            description: "ambiance de chantier ? ce plugin est pour vous",
            imgName: "images.jpeg",
            rate: 3.3,
            date: NSDate(),
            isActive: false,
            author: "edouard du marechal ferrand")
        
        //directives = [directive1, directive2]
        //devices = [device1, device2, device3, device4]
        plugin1._installed = false
        plugin2._installed = false
        plugin3._installed = false
        plugin4._installed = false
        pluginStore = [plugin1, plugin2, plugin3, plugin4]
    }
    
    
    /*
    **  Methods for directive
    */
    
    
    // getters on directives
    func getDirectives() -> [Directive] {
        return directives
    }
    
    func clearTabDirectives() {
        directives = [];
    }
    
    func getHighestID() -> Int {
        var tmp: Int!
        tmp = -1
        for (var i = 0; i < directives.count; i = i + 1) {
            if (directives[i]._id > tmp) {
                tmp = directives[i]._id
            }
        }
        return tmp
    }
    
    // add a directive
    func addDirective(directive: Directive, index: Int) {
        if (directives.count >= index) {
            directives.insert(directive, atIndex: index)
        } else {
            directives.append(directive)
        }
    }

    // delete a directive
    func deleteDirectiveAtIndex(index: Int) {
        directives.removeAtIndex(index)
    }

    
    func setIsActive(directive: Directive, value: Bool) {
        directive._isActive = value
    }
    
    func countDirectives() -> Int {
        return directives.count
    }
    
    func updateDirective(directive: Directive, id: Int) {
        for (var i = 0; i < directives.count; i++) {
            if (id == directives[i]._id) {
                directives[i]._title = directive._title
                directives[i]._dateCreate = directive._dateCreate
                directives[i]._dateApply = directive._dateApply
                directives[i]._isActive = directive._isActive
            }
        }
    }
    
    /*
    **  methods for device
    */
    
    
    // gettes on devices
    func getDevices() -> [Device] {
        return devices
    }
    
    func clearTabDevices() {
        devices = [];
    }
    
    // add a device
    func addDevice(device: Device, index: Int) {
        if (devices.count >= index) {
            devices.insert(device, atIndex: index)
        } else {
            devices.append(device)
        }
    }
    
    // delete a device
    func deleteDeviceAtIndex(index: Int) {
        println(devices)
        println(index)
        devices.removeAtIndex(index)
    }
    
    func setIsActiveDevice(device: Device, value: Bool) {
        device._isActive = value
    }
    
    func getHighestIdDevice() -> Int {
        var tmp: Int!
        tmp = -1
        for (var i = 0; i < devices.count; i = i + 1) {
            if (devices[i]._id > tmp) {
                tmp = devices[i]._id
            }
        }
        return tmp
    }
    
    func updateDevice(device: Device, id: Int) {
        for (var i = 0; i < devices.count; i++) {
            if (id == devices[i]._id) {
                devices[i]._name = device._name
                //devices[i]._description = device._description
                //devices[i]._dateApply = device._dateApply
                //devices[i]._isActive = device._isActive
            }
        }
    }
    
    func countDevices() -> Int {
        return devices.count
    }
    
    /*
    **  Methods for plugin
    */
    
    func getPlugins() -> [Plugin] {
        return plugins
    }
    
    func clearTabPlugins() {
        plugins = [];
    }
    
    func addPlugin(plugin: Plugin, index: Int) {
        if (plugins.count >= index) {
            plugins.insert(plugin, atIndex: index)
        } else {
            plugins.append(plugin)
        }
    }
    
    func deletePluginAtIndex(index: Int) {
        var tmpPlugin = plugins[index]
        for (var i = 0; i < pluginStore.count; i++) {
            if (tmpPlugin._name == pluginStore[i]._name ) {
                pluginStore[i]._installed = false
            }
        }
        plugins.removeAtIndex(index)
    }
    
    func setIsActivePlugin(plugin: Plugin, value: Bool) {
        plugin._isActive = value
    }
    
    func getPluginStore() -> [Plugin] {
        return pluginStore
    }
    
    func getPluginRated() -> [Plugin] {
        
        var tmp = [Plugin]()
        for (var i = 0; i < pluginStore.count; i++) {
            if (pluginStore[i]._rate > 2) {
                tmp.append(pluginStore[i])
            }
        }
        return tmp
    }
    
    func getHighestIdPlugin() -> Int {
        var tmp: Int!
        tmp = -1
        for (var i = 0; i < plugins.count; i = i + 1) {
            if (plugins[i]._id > tmp) {
                tmp = plugins[i]._id
            }
        }
        return tmp + 1
    }
    
    func installPlugin(plugin: Plugin, index: Int) {
        addPlugin(plugin, index: index)
        for (var i = 0; i < plugins.count; i++) {
            if (plugin._name == plugins[i]._name) {
                plugins[i]._installed = true
            }
        }
    }
    
    /*
    ** Methods User
    */
    
    func getToken() -> String {
        return token
    }
    
    func setToken(tokenToSet: String) {
        token = tokenToSet
    }
    
    func getLogin() -> String {
        return login
    }
    
    func setLogin(loginToSet: String) {
        login = loginToSet
    }
    
    func getUserId() -> String {
        return userId
    }
    
    func setUserId(userIdToSet: String) {
        userId = userIdToSet
    }
    
    func getPassword() -> String {
        return password
    }
    
    func setPassword(passToSet: String) {
        password = passToSet
    }
}
