//
//  Plugin.swift
//  DomothinkIOS
//
//  Created by Guillaume Wehrling on 27/11/2015.
//  Copyright (c) 2015 DomoThink. All rights reserved.
//

import UIKit

class Plugin: NSObject {
    
    var _name: String!
    var _description: String!
    var _imgName: String!
    var _rate: Float!
    var _publishDate: NSDate!
    var _vote: [Int]!
    var _installed: Bool!
    var _isActive: Bool!
    var _autor: String!
    
    init(name: String, descritpion: String, imgName: String, rate: Float, date: NSDate, autor: String) {
        super.init()
        self._name = name
        self._description = descritpion
        self._imgName = imgName
        self._rate = rate
        self._publishDate = date
        self._installed = true
        self._isActive = false
        self._autor = autor
    }
}
