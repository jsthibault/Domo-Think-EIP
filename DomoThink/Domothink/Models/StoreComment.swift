//
//  StoreComment.swift
//  Domothink
//
//  Created by Guillaume Wehrling on 27/10/2016.
//  Copyright © 2016 DomoThink. All rights reserved.
//

import UIKit

class StoreComment: NSObject {
    private var _id: Int
    private var _author: String
    private var _rate: Float
    private var _comment: String
    private var _keyLoginHash: String
    
    init(id: Int, author: String, rate: Float, comment: String, keyLoginHash: String) {
        _id = id
        _author = author
        _rate = rate
        _comment = comment
        _keyLoginHash = keyLoginHash
    }
    
    func getId() -> Int {
        return _id
    }
    
    func getAuthor() -> String {
        return _author
    }
    
    func getRate() -> Float {
        return _rate
    }
    
    func getComment() -> String {
        return _comment
    }
    
    func getKeyLoginHash() -> String {
        return _keyLoginHash
    }
    
}
