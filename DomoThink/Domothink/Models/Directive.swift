//
//  Directive.swift
//  Domothink
//
//  Created by Guillaume Wehrling on 23/10/2016.
//  Copyright © 2016 DomoThink. All rights reserved.
//

import UIKit

class Directive: NSObject {

    private var _id: Int!
    private var _name: String!
    private var _creatorId: Int!
    private var _deviceId: Int!
    private var _actionId: Int!
    private var _periodicityType: Int!
    private var _periodicityData: AnyObject!
    
    init(id: Int, name: String, creatorId: Int, deviceId: Int,
         actionId: Int, periodicityType: Int, periodicityData: AnyObject) {
        
        super.init()
        self._id = id
        self._name = name
        self._creatorId = creatorId
        self._deviceId = deviceId
        self._actionId = actionId
        self._periodicityType = periodicityType
        self._periodicityData = periodicityData
    }
    
    func getId() -> Int! {
        return _id
    }
    
    func setId(id: Int) {
        _id = id
    }
    
    func getName() -> String! {
        return _name
    }
    
    func setName(name: String) {
        _name = name
    }
    
    func getCreatorId() -> Int! {
        return _creatorId
    }
    
    func setCreatorId(creatorId: Int) {
        _creatorId = creatorId
    }
    
    func getDeviceId() -> Int! {
        return _creatorId
    }
    
    func setDeviceId(deviceId: Int) {
        _deviceId = deviceId
    }
    
    func getActionId() -> Int! {
        return _actionId
    }
    
    func setActionId(actionId: Int) {
        _actionId = actionId
    }
    
    func getPerType() -> Int! {
        return _periodicityType
    }
    
    func setPerType(perType: Int) {
        _periodicityType = perType
    }
    
    func getPerData() -> AnyObject! {
        return _periodicityData
    }
    
    func setPerData(perData: AnyObject) {
        _periodicityData = perData
    }

}
