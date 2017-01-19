//
//  LibraryAPI.swift
//  Domothink
//
//  Created by Guillaume Wehrling on 22/10/2016.
//  Copyright © 2016 DomoThink. All rights reserved.
//

import UIKit
import Alamofire


/*
** changer dans toutes les requetes "let reponse" par autre chose
*/

extension String  {
    var md5: String! {
        let str = self.cStringUsingEncoding(NSUTF8StringEncoding)
        let strLen = CC_LONG(self.lengthOfBytesUsingEncoding(NSUTF8StringEncoding))
        let digestLen = Int(CC_MD5_DIGEST_LENGTH)
        let result = UnsafeMutablePointer<CUnsignedChar>.alloc(digestLen)
        
        CC_MD5(str!, strLen, result)
        
        let hash = NSMutableString()
        for i in 0..<digestLen {
            hash.appendFormat("%02x", result[i])
        }
        
        result.dealloc(digestLen)
        
        return String(format: hash as String)
    }
}

class LibraryAPI: NSObject {
    
    private let persistencyManager: PersistencyManager
    private let URL: String!
    private let URLStore: String!
    
    override init() {
        //URL = "http://86.70.224.226:8081/"
        URL = "http://86.70.224.180:4242/"
        URLStore = "http://api-domothink.timekube.net:8081/"
        
        persistencyManager = PersistencyManager()
        super.init()
    }
    
    func dateFormatter(date: String) -> String {
        let index: String.Index = date.startIndex.advancedBy(10)
        let finalDate = date.substringToIndex(index)
        return finalDate
    }
    
    func hourFormatter(date: NSDate) -> String {
        let timeFormat = NSDateFormatter()
        timeFormat.dateFormat = "H:m"
        let finalDate = timeFormat.stringFromDate(date)
        return finalDate
    }
    
    /*
    ** ******************************* Box status **********************************************
    */
    
    func getBoxStatus(completion: (result: NSDictionary)->()) {
        Alamofire.request(.GET,
            URL + "box/status",
            headers: ["login-token": persistencyManager.getUser().getToken()])
            .responseJSON { response in switch response.result {
            case .Success(let JSON):
                let jsonParsed = JSON as! NSDictionary
                completion(result: jsonParsed)
            case .Failure(let errorGet):
                let error: NSDictionary = ["error": errorGet.localizedDescription]
                completion(result: error)
            }
        }
        
    }

    
    /*
    ** ******************************* Update **********************************************
    */
    
    func getActualVersion(completion: (result: String)->()) {
        Alamofire.request(.GET,
            URL + "update",
            headers: ["login-token": persistencyManager.getUser().getToken()])
            .responseJSON { response in switch response.result {
            case .Success(let JSON):
                let jsonParsed = JSON as! NSDictionary
                completion(result: jsonParsed.objectForKey("version") as! String)
            case .Failure(_):
                completion(result: "error on actual version")
            }
        }

    }
    
    func getNewVersion(completion: (result: String)->()) {
        Alamofire.request(.GET,
            URLStore + "update",
            headers: ["login-token": persistencyManager.getUser().getToken()])
            .responseJSON { response in switch response.result {
            case .Success(let JSON):
                let jsonParsed = JSON as! NSDictionary
                completion(result: jsonParsed.objectForKey("version") as! String)
            case .Failure(_):
                completion(result: "error on actual version")
            }
        }
    }
    
    func updateBox(completion: (result: Bool)->()) {
        Alamofire.request(.POST,
            URL + "update",
            headers: ["login-token": persistencyManager.getUser().getToken()])
            .responseJSON { response in switch response.result {
            case .Success(_):
                completion(result: true)
            case .Failure(_):
                completion(result: false)
            }
        }
    }
    
    /*
    ** *******************************  Store **********************************************
    */

    func getStore(completion: (result: [StorePlugin])->()) {
        Alamofire.request(.GET,
            URLStore + "store",
            headers: ["login-token": persistencyManager.getUser().getToken()])
            .responseJSON { response in switch response.result {
            case .Success(let JSON):
                
                let jsonParsed = JSON as! NSArray
                //debugPrint(JSON)
                print(jsonParsed)
                //savoir si la requete a marcher niveau API
                if (jsonParsed.count > 0 && response.response?.statusCode == 200) {
                    self.persistencyManager.removeAllStorePlugins()
                    for obj in jsonParsed {
                        var key = ""
                        if (obj.objectForKey("keyLoginHash") is NSNull) {
                            key = ""
                        } else {
                            key = obj.objectForKey("keyLoginHash") as! String
                        }
                        
                        
                        let storePlugin = StorePlugin(id: obj.objectForKey("idPlugin") as! Int, name: obj.objectForKey("name") as! String, repository: obj.objectForKey("repository") as! String, language: obj.objectForKey("language") as! String, date: self.dateFormatter(obj.objectForKey("date") as! String), keyLoginHash: (key), rate: obj.objectForKey("rate") as! Float)
                        
                        self.persistencyManager.addStorePlugin(storePlugin)
                    }
                    completion(result: self.persistencyManager.getStorePlugins())
                } else {
                    completion(result: self.persistencyManager.getStorePlugins())
                }
            case .Failure(let error):
                print("Request failed with error: \(error)")
                completion(result: self.persistencyManager.getStorePlugins())
                }
        }
    }
    
    func getStoreId(id: Int, completion: (result: [Plugin])->()) {
        Alamofire.request(.GET,
            URLStore + "store/" + String(id),
            headers: ["login-token": persistencyManager.getUser().getToken()])
            .responseJSON { response in switch response.result {
            case .Success(let JSON):
                
                let jsonParsed = JSON as! NSArray
                //debugPrint(JSON)
                
                //savoir si la requete a marcher niveau API
                if (response.response?.statusCode == 200) {
                    for obj in jsonParsed {
                        //debugPrint(obj.objectForKey("name"))
                        let plugin = Plugin(id: obj.objectForKey("idPlugin") as! Int, name: obj.objectForKey("name") as! String, status: obj.objectForKey("status") as! Bool)
                        
                        self.persistencyManager.addPlugin(plugin)
                    }
                    completion(result: self.persistencyManager.getPlugins())
                } else {
                    completion(result: self.persistencyManager.getPlugins())
                }
            case .Failure(let error):
                print("Request failed with error: \(error)")
                completion(result: self.persistencyManager.getPlugins())
                }
        }
    }
    
    func getStoreComments(id: Int, completion: (result: [StoreComment])->()) {
        Alamofire.request(.GET,
            URLStore + "store/" + String(id) + "/comments",
            headers: ["login-token": persistencyManager.getUser().getToken()])
            .responseJSON { response in switch response.result {
            case .Success(let JSON):
                
                let jsonParsed = JSON as! NSArray

                //savoir si la requete a marcher niveau API
                if (response.response?.statusCode == 200) {
                    self.persistencyManager.removeAllStoreComments()
                    for obj in jsonParsed {
                        let storeComment = StoreComment(id: obj.objectForKey("idComment") as! Int, author: obj.objectForKey("author") as! String, rate: obj.objectForKey("rate") as! Float, comment: obj.objectForKey("comment") as! String, keyLoginHash: obj.objectForKey("keyLoginHash") as! String)
                        
                        self.persistencyManager.addStoreComment(storeComment)
                    }
                    completion(result: self.persistencyManager.getStoreComments())
                } else {
                    completion(result: self.persistencyManager.getStoreComments())
                }
            case .Failure(let error):
                print("Request failed with error: \(error)")
                completion(result: self.persistencyManager.getStoreComments())
                }
        }
    }
    
    func addStoreComment(id: Int, author: String, rate: Float, comment: String, keyLoginHash: String, completion: (result: Bool)->()) {
        Alamofire.request(.POST,
            URLStore + "store/" + String(id) + "/comments",
            headers: ["login-token": persistencyManager.getUser().getToken()],
            parameters:  ["author": author, "rate": rate, "comment": comment, "date": String(NSDate), "storeplugins_idPlugin": id, "keyLoginHash": keyLoginHash])
            .responseJSON { response in switch response.result {
            case .Success(let JSON):
                if (response.response?.statusCode == 200) {
                    completion(result: true)
                } else {
                    print(JSON)
                    completion(result: false)
                }
            case .Failure(let error):
                print("Request failed with error: \(error)")
                completion(result: false)
                }
        }
    }
    
    func modifyStoreComment(id: Int, keyLoginHash: String, comment: String, completion: (result: Bool)->()) {
        Alamofire.request(.PUT,
            URLStore + "store/comments",
            headers: ["login-token": persistencyManager.getUser().getToken()],
            parameters:  ["idComment": id, "keyLoginHash": keyLoginHash, "comment": comment])
            .responseJSON { response in switch response.result {
            case .Success(_):
                if (response.response?.statusCode == 200) {
                    completion(result: true)
                } else {
                    completion(result: false)
                }
            case .Failure(let error):
                print("Request failed with error: \(error)")
                completion(result: false)
                }
        }
    }
    
    func deleteStoreComment(id: Int, keyLoginHash: String, completion: (result: Bool)->()) {
        Alamofire.request(.DELETE,
            URLStore + "store/comments/" + String(id),
            headers: ["login-token": persistencyManager.getUser().getToken()])
            .responseJSON { response in switch response.result {
            case .Success(_):
                if (response.response?.statusCode == 200) {
                    completion(result: true)
                } else {
                    completion(result: false)
                }
            case .Failure(let error):
                print("Request failed with error: \(error)")
                completion(result: false)
                }
        }
    }
    
    /*
    ** *******************************  Plugins **********************************************
    */
    
    func getPlugins(completion: (result: [Plugin])->()) {
        Alamofire.request(.GET,
            URL + "plugins",
            headers: ["login-token": persistencyManager.getUser().getToken()])
            .responseJSON { response in switch response.result {
            case .Success(let JSON):
                
                let jsonParsed = JSON as! NSArray
                //debugPrint(JSON)
                
                //savoir si la requete a marcher niveau API
                if (response.response?.statusCode == 200) {
                    self.persistencyManager.removeAllPlugins()
                    for obj in jsonParsed {
                        
                        print(obj)
                        
                        let plugin = Plugin(id: obj.objectForKey("idPlugin") as! Int, name: obj.objectForKey("name") as! String, status: obj.objectForKey("status") as! Bool)
                        
                        self.persistencyManager.addPlugin(plugin)
                    }
                    completion(result: self.persistencyManager.getPlugins())
                } else {
                    completion(result: self.persistencyManager.getPlugins())
                }
            case .Failure(let error):
                print("Request failed with error: \(error)")
                completion(result: self.persistencyManager.getPlugins())
                }
        }
    }
    
    //changer .responseJson
    func addPlugin(id: Int, name: String, status: Bool, repository: String, completion: (result: Bool)->()) {
        Alamofire.request(.POST,
            URL + "plugins/install",
            headers: ["login-token": persistencyManager.getUser().getToken()],
            parameters:  ["idPlugin": id, "name": name, "status": status, "repository": repository])
            .responseJSON { response in switch response.result {
            case .Success(_):
                //savoir si la requete a marcher niveau API
                if (response.response?.statusCode == 200) {
                    completion(result: true)
                } else {
                    completion(result: false)
                }
            case .Failure(let error):
                print("Request failed with error: \(error)")
                completion(result: false)
                }
        }
    }
    
    func deletePlugin(id: Int, completion: (result: Bool)->()) {
        Alamofire.request(.DELETE,
            URL + "plugins/uninstall/" + String(id),
            headers: ["login-token": persistencyManager.getUser().getToken()])
            .responseJSON { response in switch response.result {
            case .Success(_):
                //savoir si la requete a marcher niveau API
                if (response.response?.statusCode == 200) {
                    completion(result: true)
                } else {
                    completion(result: false)
                }
            case .Failure(let error):
                print("Request failed with error: \(error)")
                completion(result: false)
                }
        }
    }
    
    func switchOnOffPlugin(idPlugin: Int, completion: (result: Bool)->()) {
        Alamofire.request(.PUT,
            URL + "plugins/changeStatus",
            headers: ["login-token": persistencyManager.getUser().getToken()],
            parameters:  ["idPlugin": idPlugin])
            .responseJSON { response in switch response.result {
            case .Success(_):
                //savoir si la requete a marcher niveau API
                if (response.response?.statusCode == 200) {
                    completion(result: true)
                } else {
                    completion(result: false)
                }
            case .Failure(let error):
                print("Request failed with error: \(error)")
                completion(result: false)
                }
        }
    }
    
    
    /*
    ** *******************************  Directives **********************************************
    */
    
    func getDirectives(completion: (result: [Directive])->()) {
        Alamofire.request(.GET,
            URL + "directives",
            headers: ["login-token": persistencyManager.getUser().getToken()])
            .responseJSON { response in switch response.result {
            case .Success(let JSON):
                
                let jsonParsed = JSON as! NSArray
                print(jsonParsed)
                //debugPrint(JSON)
                
                //savoir si la requete a marcher niveau API
                if (response.response?.statusCode == 200) {
                    self.persistencyManager.removeAllDirectives()
                    for obj in jsonParsed {
                        //debugPrint(obj.objectForKey("name"))
                        let directive = Directive(id: obj.objectForKey("idDirective") as! Int, name: obj.objectForKey("name") as! String, creatorId: obj.objectForKey("creatorId") as! Int, deviceId: obj.objectForKey("deviceId") as! Int, actionId: obj.objectForKey("actionId") as! Bool, periodicityType: obj.objectForKey("periodicityType") as! Int, periodicityData: obj.objectForKey("periodicityData") as! String)
                        
                        self.persistencyManager.addDirective(directive)
                    }
                    completion(result: self.persistencyManager.getDirectives())
                } else {
                    completion(result: self.persistencyManager.getDirectives())
                }
            case .Failure(let error):
                print("Request failed with error: \(error)")
                completion(result: self.persistencyManager.getDirectives())
                }
        }
    }
    
    //changer .responseJson
    func addDirective(name: String, creatorId: Int, deviceId: Int, actionId: Int, periodicityType: Int, periodicityData: String, completion: (result: Bool)->()) {
        Alamofire.request(.POST,
            URL + "directives",
            headers: ["login-token": persistencyManager.getUser().getToken()],
            parameters:  ["name": name, "creatorId": creatorId, "deviceId": deviceId, "actionId": actionId, "periodicityType": periodicityType, "periodicityData": periodicityData])
            .responseJSON { response in switch response.result {
            case .Success(_):
                //savoir si la requete a marcher niveau API
                if (response.response?.statusCode == 200) {
                    completion(result: true)
                } else {
                    completion(result: false)
                }
            case .Failure(let error):
                print("Request failed with error: \(error)")
                completion(result: false)
                }
        }
    }
    
    //changer .responseJson
    func modifyDirective(directive: Directive, completion: (result: Bool)->()) {
        Alamofire.request(.PUT,
            URL + "directives",
            headers: ["login-token": persistencyManager.getUser().getToken()],
            parameters:  ["idDirective": directive.getId(), "name": directive.getName(),
                    "creatorId": directive.getCreatorId(), "deviceId": directive.getDeviceId(),
                    "actionId": directive.getActionId(), "periodicityType": directive.getPerType(),
                    "periodicityData": directive.getPerData()])
            .responseJSON { response in switch response.result {
            case .Success(_):
                //savoir si la requete a marcher niveau API
                if (response.response?.statusCode == 200) {
                    completion(result: true)
                } else {
                    completion(result: false)
                }
            case .Failure(let error):
                print("Request failed with error: \(error)")
                completion(result: false)
                }
        }
    }
    
    func deleteDirective(id: Int, completion: (result: Bool)->()) {
        Alamofire.request(.DELETE,
            URL + "directives/" + String(id),
            headers: ["login-token": persistencyManager.getUser().getToken()])
            .responseJSON { response in switch response.result {
            case .Success(_):
                //savoir si la requete a marcher niveau API
                if (response.response?.statusCode == 200) {
                    completion(result: true)
                } else {
                    completion(result: false)
                }
            case .Failure(let error):
                print("Request failed with error: \(error)")
                completion(result: false)
                }
        }
    }
    
    /*
    ** *******************************  Devices **********************************************
    */
    
    func scanDevices(completion: (result: [Device])->()) {
        Alamofire.request(.GET,
            URL + "devices/scan",
            headers: ["login-token": persistencyManager.getUser().getToken()])
            .responseJSON { response in switch response.result {
            case .Success(let JSON):
                
                let jsonParsed = JSON as! NSArray
                //debugPrint(JSON)
                
                //savoir si la requete a marcher niveau API
                if (response.response?.statusCode == 200) {
                    self.persistencyManager.removeAllDevicesScanned()
                    for obj in jsonParsed {
                        //debugPrint(obj.objectForKey("name"))
                        let device = Device(id: obj.objectForKey("idDevice") as! Int, name: obj.objectForKey("name") as! String, desc: obj.objectForKey("description") as! String, status: obj.objectForKey("status") as! Bool, protocole: obj.objectForKey("protocole") as! String)
                        
                        self.persistencyManager.addScannedDevice(device)
                    }
                    completion(result: self.persistencyManager.getDeviceScanned())
                } else {
                    completion(result: self.persistencyManager.getDeviceScanned())
                }
            case .Failure(let error):
                print("Request failed with error: \(error)")
                completion(result: self.persistencyManager.getDeviceScanned())
                }
        }
    }

    
    func getDevices(completion: (result: [Device])->()) {
        Alamofire.request(.GET,
            URL + "devices",
            headers: ["login-token": persistencyManager.getUser().getToken()])
            .responseJSON { response in switch response.result {
            case .Success(let JSON):
                
                let jsonParsed = JSON as! NSArray
                //debugPrint(JSON)
                
                //savoir si la requete a marcher niveau API
                if (response.response?.statusCode == 200) {
                    self.persistencyManager.removeAllDevices()
                    for obj in jsonParsed {
                        //debugPrint(obj.objectForKey("name"))
                        let descr: String!
                        if let desc = obj.objectForKey("description") as? String {
                            descr = desc
                        } else {
                            descr = "null"
                        }
                        
                        let device = Device(id: obj.objectForKey("idDevice") as! Int, name: obj.objectForKey("name") as! String, desc: descr, status: obj.objectForKey("status") as! Bool, protocole: obj.objectForKey("protocole") as! String)
                        
                        self.persistencyManager.addDevice(device)
                    }
                    self.persistencyManager.addDevice(Device(id: -1, name: "Ajouter !", desc: "Ajouter un objet", status: true, protocole: ""))
                    completion(result: self.persistencyManager.getDevices())
                } else {
                    completion(result: self.persistencyManager.getDevices())
                }
            case .Failure(let error):
                print("Request failed with error: \(error)")
                completion(result: self.persistencyManager.getDevices())
                }
        }
    }
    
    //changer .responseJson
    func addDevice(name: String, desc: String, status: Int, protocole: String, completion: (result: Bool)->()) {
        Alamofire.request(.POST,
            URL + "devices",
            headers: ["login-token": persistencyManager.getUser().getToken()],
            parameters:  ["name": name, "descritpion": desc, "status": status, "protocole": protocole])
            .responseJSON { response in switch response.result {
            case .Success(_):
                //savoir si la requete a marcher niveau API
                if (response.response?.statusCode == 200) {
                    completion(result: true)
                } else {
                    completion(result: false)
                }
            case .Failure(let error):
                print("Request failed with error: \(error)")
                completion(result: false)
                }
        }
    }
    
    //changer .responseJson
    func modifyDevice(device: Device, completion: (result: Bool)->()) {
        Alamofire.request(.PUT,
            URL + "devices",
            headers: ["login-token": persistencyManager.getUser().getToken()],
            parameters:  ["idDevice": device.getId(), "name": device.getName(), "descritpion": device.getDesc(), "status": device.getStatus()])
            .responseJSON { response in switch response.result {
            case .Success(_):
                //savoir si la requete a marcher niveau API
                if (response.response?.statusCode == 200) {
                    completion(result: true)
                } else {
                    completion(result: false)
                }
            case .Failure(let error):
                print("Request failed with error: \(error)")
                completion(result: false)
                }
        }
    }
    
    func deleteDevice(id: Int, completion: (result: Bool)->()) {
        Alamofire.request(.DELETE,
            URL + "devices/" + String(id),
            headers: ["login-token": persistencyManager.getUser().getToken()])
            .responseJSON { response in switch response.result {
            case .Success(_):
                //savoir si la requete a marcher niveau API
                if (response.response?.statusCode == 200) {
                    completion(result: true)
                } else {
                    completion(result: false)
                }
            case .Failure(let error):
                print("Request failed with error: \(error)")
                completion(result: false)
                }
        }
    }
    
    func switchOnOffDevice(idDevice: Int, completion: (result: Bool)->()) {
        Alamofire.request(.PUT,
            URL + "devices/changeStatus",
            headers: ["login-token": persistencyManager.getUser().getToken()],
            parameters:  ["idDevice": idDevice])
            .responseJSON { response in switch response.result {
            case .Success(_):
                //savoir si la requete a marcher niveau API
                if (response.response?.statusCode == 200) {
                    completion(result: true)
                } else {
                    completion(result: false)
                }
            case .Failure(let error):
                print("Request failed with error: \(error)")
                completion(result: false)
                }
        }
    }
    
    
    
    /*
    ** *******************************  User **********************************************
    */
    
    func getUser() -> User {
        return persistencyManager.getUser();
    }
    
    //connect User : Fonction callBack *completion: (result: Bool->())*
    func connectUser(login: String, pass: String, completion: (result: Bool)->()) {
        Alamofire.request(.POST,
            URL + "login",
            parameters: ["login": login, "password": pass])
            .responseJSON { response in switch response.result {
                case .Success(let JSON):
                    let jsonParsed = JSON as! NSDictionary
                    //savoir si la requete a marcher niveau API: changerla recup json par la recup du statu code
                    if (response.response?.statusCode == 200) {
                        self.persistencyManager.setUser(User(id: jsonParsed.objectForKey("userId")! as! Int, token: jsonParsed.objectForKey("token")! as! String, login: login, pass: pass))
                        completion(result: true)
                    } else {
                        completion(result: false)
                    }
                case .Failure(let error):
                    print("Request failed with error: \(error)")
                    completion(result: false)
                }
            }
    }
    
    //logout User : Fonction callBack *completion: (result: Bool->())*
    func logoutUser(completion: (result: Bool)->()) {
        Alamofire.request(.POST,
            URL + "logout",
            parameters: ["token": persistencyManager.getUser().getToken()])
            .responseJSON { response in switch response.result {
            case .Success(_):
                if (response.response?.statusCode == 200) {
                    completion(result: true)
                } else {
                    completion(result: false)
                }
            case .Failure(let error):
                print("Request failed with error: \(error)")
                completion(result: false)
                }
        }
    }
    
    //registration user : Fonction callBack *completion: (result: Bool->())*
    func registrationUser(email: String, pass: String, confPass: String, boxKey: String, completion: (result: Bool)->()) {
        Alamofire.request(.POST,
            URL + "create_account",
            parameters: ["login": email, "password": pass, "confirmPassword": confPass, "boxKey": boxKey])
            .responseJSON { response in switch response.result {
            case .Success(_):
                if (response.response?.statusCode == 200) {
                    completion(result: true)
                } else {
                    completion(result: false)
                }
            case .Failure(let error):
                print("Request failed with error: \(error)")
                completion(result: false)
                }
        }
    }
    
    func changePassUser(pass: String, confPass: String, completion: (result: Bool)->()) {
        
        Alamofire.request(.POST,
            URL + "user/change_password",
            headers: ["login-token": persistencyManager.getUser().getToken()],
            parameters: ["userId": persistencyManager.getUser().getId(), "oldPassword": persistencyManager.getUser().getPass(), "newPassword": pass, "confirmPassword": confPass])
            .responseJSON { response in switch response.result {
            case .Success(_):
                if (response.response?.statusCode == 200) {
                    completion(result: true)
                } else {
                    completion(result: false)
                }
            case .Failure(let error):
                print("Request failed with error: \(error)")
                completion(result: false)
                }
        }
    }
    
    func forgotPassUser(email: String, pass: String, confPass: String, boxKey: String, completion: (result: Bool)->()) {
        
        Alamofire.request(.POST,
            URL + "forgotten_password",
            parameters: ["email": email, "password": pass, "confirmPassword": confPass, "boxKey": boxKey])
            .responseJSON { response in switch response.result {
            case .Success(let JSON):
                let jsonparsed = JSON as! NSDictionary
                print(jsonparsed)
                if (response.response?.statusCode == 200) {
                    completion(result: true)
                } else {
                    completion(result: false)
                }
            case .Failure(let error):
                print("Request failed with error: \(error)")
                completion(result: false)
                }
        }
    }
    
    func deleteUser(completion: (result: Bool)->()) {
        
        Alamofire.request(.POST,
            URL + "user/delete",
            headers: ["login-token": persistencyManager.getUser().getToken()],
            parameters: ["userId": persistencyManager.getUser().getId(), "password": persistencyManager.getUser().getPass(), "login": persistencyManager.getUser().getLogin()])
            .responseJSON { response in switch response.result {
            case .Success(_):
                if (response.response?.statusCode == 200) {
                    completion(result: true)
                } else {
                    completion(result: false)
                }
            case .Failure(let error):
                print("Request failed with error: \(error)")
                completion(result: false)
                }
        }
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
