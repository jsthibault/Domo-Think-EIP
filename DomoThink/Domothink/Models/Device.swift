//
//  Device.swift
//  Domothink
//
//  Created by Guillaume Wehrling on 23/10/2016.
//  Copyright © 2016 DomoThink. All rights reserved.
//

import UIKit

class Device: NSObject {
    
    private var _id: Int!
    private var _name: String!
    private var _desc: String!
    private var _status: Bool!
    
    //features
    private var _type: String!
    private var _imgName: String!
    private var _roomType: String!
    
    init(id: Int, name: String, desc: String, status: Bool) {
        super.init()
        self._id = id
        self._name = name
        self._desc = desc
        self._status = status
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
    
    func getDesc() -> String! {
        return _desc
    }
    
    func setDesc(desc: String) {
        _desc = desc
    }
    
    func getStatus() -> Bool! {
        return _status
    }
    
    func setStatus(status: Bool) {
        _status = status
    }
    
    /*
    ** features
    */

    func getType() -> String {
        return _type
    }
    
    func setType(type: String) {
        _type = type
    }
    
    func getImgName() -> String {
        return _imgName
    }
    
    func setImgName(imgName: String) {
        _imgName = imgName
    }
    
    func getRoomType() -> String {
        return _roomType
    }
    
    func setRoomType(RoomType: String) {
        _roomType = RoomType
    }
}
