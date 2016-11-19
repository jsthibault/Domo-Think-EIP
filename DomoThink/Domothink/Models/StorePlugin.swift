//
//  StorePlugin.swift
//  Domothink
//
//  Created by Guillaume Wehrling on 27/10/2016.
//  Copyright © 2016 DomoThink. All rights reserved.
//

import UIKit

class StorePlugin: NSObject {
    private var _id: Int
    private var _name: String
    private var _repository: String
    private var _language: String
    private var _date: String
    private var _keyLoginHash: String
    private var _rate: Float
    
    init(id: Int, name: String, repository: String, language: String, date: String, keyLoginHash: String, rate: Float) {
        
        _id = id
        _name = name
        _repository = repository
        _language = language
        _date = date
        _keyLoginHash = keyLoginHash
        _rate = rate
    }
    
    func getId() -> Int {
        return _id
    }
    
    func getName() -> String {
        return _name
    }
    
    func getRepository() -> String {
        return _repository
    }
    
    func getLanguage() -> String {
        return _language
    }
    
    func getDate() -> String {
        return _date
    }
    
    func getKeyLoginHash() -> String {
        return _keyLoginHash
    }
    
    func getRate() -> Float {
        return _rate
    }
}
