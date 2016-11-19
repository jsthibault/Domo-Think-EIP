//
//  User.swift
//  Domothink
//
//  Created by Guillaume Wehrling on 22/10/2016.
//  Copyright © 2016 DomoThink. All rights reserved.
//

import UIKit

class User: NSObject {
    private var _id: Int!
    private var _token: String!
    private var _login: String!
    private var _password: String!
    
    init(id: Int, token: String, login: String, pass: String) {
        super.init()
        self._id = id
        self._token = token
        self._login = login
        self._password = pass
    }
    
    func getId() -> Int! {
        return _id
    }
    
    func setId(id: Int) {
        _id = id
    }
    
    func getToken() -> String! {
        return _token
    }
    
    func setToken(token: String) {
        _token = token
    }
    
    func getLogin() -> String! {
        return _login
    }
    
    func setLogin(login: String) {
        _login = login
    }
    
    func getPass() -> String! {
        return _password
    }
    
    func setPass(pass: String) {
        _password = pass
    }
    
}
