//
//  Plugin.swift
//  DomothinkIOS
//
//  Created by Guillaume Wehrling on 27/11/2015.
//  Copyright (c) 2015 DomoThink. All rights reserved.
//

import UIKit

class Plugin: NSObject {
    
    var _id: Int!
    var _name: String!
    var _description: String!
    var _imgName: String!
    var _rate: Float!
    var _publishDate: NSDate!
    var _isActive: Bool!
    var _author: String!
    var _installed: Bool!
    
    init(id: Int, name: String, description: String, imgName: String, rate: Float, date: NSDate, isActive: Bool, author: String) {
        super.init()
        self._id = id
        self._name = name
        self._description = description
        self._imgName = imgName
        self._rate = rate
        self._publishDate = date
        self._isActive = isActive
        self._author = author
        self._installed = true
    }
}
