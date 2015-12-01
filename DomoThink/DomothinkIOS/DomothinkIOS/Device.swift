//
//  Device.swift
//  DomothinkIOS
//
//  Created by Guillaume Wehrling on 12/10/2015.
//  Copyright (c) 2015 DomoThink. All rights reserved.
//

import UIKit

class Device: NSObject {
    
    var _name: String!
    var _isActive: Bool!
    
    init(name: String, isActive: Bool) {
        super.init()
        self._name = name
        self._isActive = isActive
    }

   
}
