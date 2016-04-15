//
//  Directive.swift
//  DomothinkIOS
//
//  Created by Guillaume Wehrling on 12/10/2015.
//  Copyright (c) 2015 DomoThink. All rights reserved.
//

import UIKit

class Directive: NSObject {
    
    var _id: Int!
    var _title: String!
    var _dateCreate: NSDate!
    var _dateApply: NSDate!
    var _isActive: Bool!
    
    init(id: Int, title: String, dateCreate: NSDate, dateApply: NSDate, isActive: Bool) {
        super.init()
        self._id = id
        self._title = title
        self._dateCreate = dateCreate
        self._dateApply = dateApply
        self._isActive = isActive
    }
    
    
   
}
