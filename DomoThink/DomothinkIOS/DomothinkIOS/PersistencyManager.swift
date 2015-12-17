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
    
    override init() {
        let directive1 = Directive(title: "Allumage four", dateCreate: NSDate(), dateApply: NSDate(), isActive: true)
        let directive2 = Directive(title: "Eteindre les lumieres", dateCreate: NSDate(), dateApply: NSDate(), isActive: false)
        
        let device1 = Device(name: "Oven", isActive: false)
        let device2 = Device(name: "Garden Light", isActive: true)
        let device3 = Device(name: "TV", isActive: false)
        let device4 = Device(name: "Stereo", isActive: true)
        
        
        let plugin1 = Plugin(name: "Valentine Mood",
            descritpion: "vous voulez faire une surprise a votre femme ?",
            imgName: "images.jpeg",
            rate: 4.5,
            date: NSDate(),
            autor: "jean jack")
        let plugin2 = Plugin(name: "Musical Setup",
            descritpion: "Reglez votre musique comme bon vous semble",
            imgName: "images.jpeg",
            rate: 2,
            date: NSDate(),
            autor: "jack henry de la bergerie")
        let plugin3 = Plugin(name: "Film Setup",
            descritpion: "Selectionner un film a distance",
            imgName: "images.jpeg",
            rate: 1,
            date: NSDate(),
            autor: "steve jobs")
        let plugin4 = Plugin(name: "Working Ambiance",
            descritpion: "ambiance de chantier ? ce plugin est pour vous",
            imgName: "images.jpeg",
            rate: 3.3,
            date: NSDate(),
            autor: "edouard du marechal ferrand")
        
        directives = [directive1, directive2]
        devices = [device1, device2, device3, device4]
        plugins = [plugin1, plugin2, plugin3, plugin4]
    }
    
    
    /*
    **  Methods for directive
    */
    
    
    // getters on directives
    func getDirectives() -> [Directive] {
        return directives
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
    
    /*
    **  methods for device
    */
    
    
    // gettes on devices
    func getDevices() -> [Device] {
        return devices
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
        devices.removeAtIndex(index)
    }
    
    func setIsActiveDevice(device: Device, value: Bool) {
        device._isActive = value
    }
    
    
    /*
    **  Methods for plugin
    */
    
    
    func getPlugins() -> [Plugin] {
        return plugins
    }
    
    func getPluginsInstalled() -> [Plugin] {
        var pluginsInstalled: [Plugin]!
        var tmp: Int!
        tmp = 0
        pluginsInstalled = []
        while (tmp < plugins.count) {
            if (plugins[tmp]._installed == true) {
                pluginsInstalled.append(plugins[tmp])
            }
            tmp = tmp + 1
        }
        return pluginsInstalled
    }
    
    func getPluginsRated() -> [Plugin] {
        var pluginsRated: [Plugin]!
        var tmp: Int!
        tmp = 0
        pluginsRated = []
        while (tmp < plugins.count) {
            if (plugins[tmp]._rate >= 2.5) {
                pluginsRated.append(plugins[tmp])
            }
            tmp = tmp + 1
        }
        return pluginsRated
    }
    
    func addPlugin(plugin: Plugin, index: Int) {
        if (plugins.count >= index) {
            plugins.insert(plugin, atIndex: index)
        } else {
            plugins.append(plugin)
        }
    }
    
    func deletePluginAtIndex(index: Int) {
        plugins.removeAtIndex(index)
    }
    
    func adjustRate(plugin: Plugin, rate: Int) {
        plugin._vote.append(rate)
        var i: Int!
        var result: Int!
        result = 0
        while (i < plugin._vote.count) {
            result = result + plugin._vote[i]
            i = i + 1
        }
        plugin._rate = (Float)((Float)(result) / (Float)(plugin._vote.count))
    }
    
    func installPlugin(plugin: Plugin, value: Bool) {
        plugin._installed = value
    }
    
    func setIsActivePlugin(plugin: Plugin, value: Bool) {
        plugin._isActive = value
    }
    
}
