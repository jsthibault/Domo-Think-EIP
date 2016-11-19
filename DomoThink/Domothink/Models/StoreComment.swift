//
//  StoreComment.swift
//  Domothink
//
//  Created by Guillaume Wehrling on 27/10/2016.
//  Copyright © 2016 DomoThink. All rights reserved.
//

import UIKit

class StoreComment: NSObject {
    private var _author: String
    private var _rate: Float
    private var _comment: String
    
    init(author: String, rate: Float, comment: String) {
        _author = author
        _rate = rate
        _comment = comment
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
    
}
