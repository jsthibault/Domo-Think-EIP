//
//  Plugin.swift
//  Domothink
//
//  Created by Guillaume Wehrling on 23/10/2016.
//  Copyright © 2016 DomoThink. All rights reserved.
//

import UIKit

class Plugin: NSObject {
    
    private var _id: Int!
    private var _name: String!
    private var _status: Bool!
    private var _repository: String!
    
    init(id: Int, name: String, status: Bool) {
        _id = id
        _name = name
        _status = status
        _repository = ""
    }
    
    func getId() -> Int {
        return _id
    }
    
    func getName() -> String {
        return _name
    }
    
    func getStatus() -> Bool {
        return _status
    }
    
    func getRepository() -> String {
        return _repository
    }

}
