//
//  LibraryAPI.swift
//  DomothinkIOS
//
//  Created by Guillaume Wehrling on 27/11/2015.
//  Copyright (c) 2015 DomoThink. All rights reserved.
//

import UIKit

class LibraryAPI: NSObject {
    
    private let persistencyManager: PersistencyManager
    //private let httpClient: HTTPClient
    //private let isOnline: Bool
    
    
    override init() {
        persistencyManager = PersistencyManager()
        //httpClient = HTTPClient()
        //isOnline = false
        
        super.init()
    }
    
    func getDirectives() -> [Directive] {
        return persistencyManager.getDirectives()
    }
    
    func countDirectives() -> Int {
        return persistencyManager.countDirectives()
    }
    
    func addDirective(directive: Directive, index: Int) {
        persistencyManager.addDirective(directive, index: index)
        /*if isOnline {
            httpClient.postRequest("/api/addAlbum", body: album.description)
        }*/
    }
    
    func deleteDirective(index: Int) {
        persistencyManager.deleteDirectiveAtIndex(index)
        /*if isOnline {
            httpClient.postRequest("/api/deleteAlbum", body: "\(index)")
        }*/
    }
    
    func setIsActive(directive: Directive, value: Bool) {
        persistencyManager.setIsActive(directive, value: value)
    }
    
    //1
    class var sharedInstance: LibraryAPI {
        //2
        struct Singleton {
            //3
            static let instance = LibraryAPI()
        }
        //4
        return Singleton.instance
    }
    
    
   
}
