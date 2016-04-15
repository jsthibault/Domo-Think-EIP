//
//  Device.swift
//  DomothinkIOS
//
//  Created by Guillaume Wehrling on 12/10/2015.
//  Copyright (c) 2015 DomoThink. All rights reserved.
//

import UIKit

class Device: NSObject {
    
    var _id: Int!
    var _name: String!
    var _isActive: Bool!
    var _description: String!
    
    init(id: Int, name: String, isActive: Bool, description: String) {
        super.init()
        self._id = id
        self._name = name
        self._isActive = isActive
        self._description = description
    }

   
}
