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
    private var _actionId: Bool!
    private var _periodicityType: Int!
    private var _periodicityData: String!
    
    private var _recDay: String!
    private var _recHour: String!
    private var _recDayInt: Int!
    
    private var _days = ["lundi", "mardi", "mercredi", "jeudi", "vendredi", "samedi", "dimanche"]
    
    init(id: Int, name: String, creatorId: Int, deviceId: Int,
         actionId: Bool, periodicityType: Int, periodicityData: String) {
        
        super.init()
        self._id = id
        self._name = name
        self._creatorId = creatorId
        self._deviceId = deviceId
        self._actionId = actionId
        self._periodicityType = periodicityType
        self._periodicityData = periodicityData
        
        setRecurrence()
    }
    
    func setRecurrence() {
        if (self._periodicityType == 1) {
            self._recDay = "Maintenant"
            self._recHour = ""
        } else {
            var dictonary:NSDictionary?
            
            if let data = self._periodicityData.dataUsingEncoding(NSUTF8StringEncoding) {
                do {
                    dictonary =  try NSJSONSerialization.JSONObjectWithData(data, options: []) as? [String:AnyObject]
                } catch let error as NSError {
                    print(error)
                }
            }
            
            self._recDayInt = dictonary!["day"] as! Int
            self._recDay = _days[dictonary!["day"] as! Int - 1]
            self._recHour = dictonary!["hour"] as! String
        }
    }
    
    func getRecDay() -> String {
        return self._recDay
    }
    
    func getRecHour() -> String {
        return self._recHour
    }
    
    func getRecDayInt() -> Int {
        return self._recDayInt
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
        return _deviceId
    }
    
    func setDeviceId(deviceId: Int) {
        _deviceId = deviceId
    }
    
    func getActionId() -> Bool! {
        return _actionId
    }
    
    func setActionId(actionId: Bool) {
        _actionId = actionId
    }
    
    func getPerType() -> Int! {
        return _periodicityType
    }
    
    func setPerType(perType: Int) {
        _periodicityType = perType
    }
    
    func getPerData() -> String! {
        return _periodicityData
    }
    
    func setPerData(perData: String) {
        _periodicityData = perData
    }

}
