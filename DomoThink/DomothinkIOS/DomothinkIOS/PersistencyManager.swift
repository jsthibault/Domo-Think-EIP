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
    
    override init() {
        let directive1 = Directive(title: "Allumage four", dateCreate: NSDate(), dateApply: NSDate(), isActive: true)
        let directive2 = Directive(title: "Eteindre les lumieres", dateCreate: NSDate(), dateApply: NSDate(), isActive: false)
        
        let device1 = Device(name: "Oven", isActive: false)
        let device2 = Device(name: "Garden Light", isActive: true)
        let device3 = Device(name: "TV", isActive: false)
        let device4 = Device(name: "Stereo", isActive: true)
        
        directives = [directive1, directive2]
        devices = [device1, device2, device3, device4]
    }
    
    // getters on directives
    func getDirectives() -> [Directive] {
        return directives
    }
    
    // gettes on devices
    func getDevices() -> [Device] {
        return devices
    }
    
    // count directives
    func countDirectives() -> Int {
        return directives.count
    }
    
    // count devices
    func countDevices() -> Int {
        return devices.count
    }

    
    // add a directive
    func addDirective(directive: Directive, index: Int) {
        if (directives.count >= index) {
            directives.insert(directive, atIndex: index)
        } else {
            directives.append(directive)
        }
    }
    
    // add a device
    func addDevice(device: Device, index: Int) {
        if (devices.count >= index) {
            devices.insert(device, atIndex: index)
        } else {
            devices.append(device)
        }
    }
    
    // delete a directive
    func deleteDirectiveAtIndex(index: Int) {
        directives.removeAtIndex(index)
    }
    
    // delete a device
    func deleteDeviceAtIndex(index: Int) {
        devices.removeAtIndex(index)
    }
    
    func setIsActive(directive: Directive, value: Bool) {
        directive._isActive = value
    }
    
}
