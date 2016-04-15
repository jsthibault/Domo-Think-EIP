//
//  ViewController.swift
//  DomothinkIOS
//
//  Created by Guillaume Wehrling on 08/10/2015.
//  Copyright (c) 2015 DomoThink. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var logText: UITextField!
    @IBOutlet weak var passText: UITextField!
    @IBOutlet weak var connectButton: UIButton!
    @IBOutlet weak var infoConnexion: UILabel!

    @IBOutlet weak var testRequest: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        connectButton.addTarget(self, action: "login", forControlEvents: .TouchUpInside)
        
        testRequest.addTarget(self, action: "requete", forControlEvents: .TouchUpInside)
        
        logText.delegate = self
        passText.delegate = self
        infoConnexion.hidden = true
        testRequest.hidden = true
        
        //self.performSegueWithIdentifier("toHome", sender: self)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        logText.resignFirstResponder()
        passText.resignFirstResponder()
        return true;
    }
    
    func requete() {
        println("je commence la requete")
        //let urlPath: String = "http://localhost:8080/api/directive"
        //var sendRequest = HttpRequest()
        
        LibraryAPI.sharedInstance.getDevice()
        
        /*let jsonObject: NSMutableArray = [
            "actionId": 55,
            "creatorId": 8,
            "id": 5,
            "name": "Directive 4",
            "objectId": 4,
            "periodicity": [
                "data": "plein de data ta vu",
                "name": "ma bite",
                "type": 4
            ]
        ]*/
        let jsonString: String = "{'actionId': 55,'creatorId': 8,'id': 5,'name': 'Directive 4','objectId': 4,'periodicity': ['data': 'plein de data ta vu','name': 'ma bite','type': 4]}"
        let jsonObject: [String: AnyObject] = [
            "actionId": 55,
            "creatorId": 8,
            "id": 5,
            "name": "Directive 4",
            "objectId": 4,
            "periodicity": [
                "data": "plein de data ta vu",
                "name": "ma bite",
                "type": 4
            ]
        ]
        
        //let valid = NSJSONSerialization.isValidJSONObject(jsonObject)
        
        
        //sendRequest.postRequest(jsonObject)
        
       // var sendRequest2 = HttpRequest(urlPath: urlPath)
        //sendRequest2.deleteRequest()
        /*var url: NSURL = NSURL(string: urlPath)!
        var request1: NSURLRequest = NSURLRequest(URL: url)
        let queue:NSOperationQueue = NSOperationQueue()
        NSURLConnection.sendAsynchronousRequest(request1, queue: queue, completionHandler:{ (response: NSURLResponse!, data: NSData!, error: NSError!) -> Void in
            var err: NSError
            var jsonResult: NSMutableArray = (NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: nil) as! NSMutableArray)
            println("test")
            println("reponse : \(jsonResult)")
        })*/
    }
    
    func login() {
        
        if (logText.text != "" && passText.text != "") //voir pour mettre d'autre conditions nombre de parametre etc
        {
            println(logText.text)
            println(passText.text)
            
            var sendRequest = HttpRequest()
            let jsonObject: [String: String] = [
                "username": logText.text, "password": passText.text
            ]
            
            var jsonObj = ["username": logText.text, "password": passText.text]
            var jsonObjArray:NSArray = [jsonObj]
            let jsonArray = ["data":jsonObjArray]

            let jsonResult:NSDictionary = sendRequest.postRequest("http://localhost:8080/api/user/auth", body: jsonObject)
            if let val = jsonResult["error"] as? String {
                infoConnexion.text = val
                infoConnexion.hidden = false
                // now val is not nil and the Optional has been unwrapped, so use it
            }
            else {
                self.performSegueWithIdentifier("connectSegue", sender: self)
            }
            
            //println(response)
            //self.performSegueWithIdentifier("connectSegue", sender: self)
        }
        //requete vers l'api/domobox password et login
        
    }


}

