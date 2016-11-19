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
    
    @IBOutlet weak var signupButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        connectButton.addTarget(self, action: "login", forControlEvents: .TouchUpInside)
        connectButton.layer.cornerRadius = 5
        signupButton.layer.cornerRadius = 5
        
        logText.delegate = self
        passText.delegate = self
        infoConnexion.hidden = true
        
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
    
    func login() {
        
        if (logText.text != "" && passText.text != "") //voir pour mettre d'autre conditions nombre de parametre etc
        {
            println(logText.text)
            println(passText.text)
            
            var sendRequest = HttpRequest()
            var jsonObject: [String: String] = [
                "login": logText.text, "password": passText.text
            ]
           
            //self.performSegueWithIdentifier("connectSegue", sender: self)
            //var jsonResult:NSDictionary = sendRequest.postRequest("http://89.156.144.51:4242/user/auth", body: jsonObject)
            //var jsonResult:NSDictionary = sendRequest.postRequest("http://89.156.144.51:4242/user/auth", body: jsonObject)
            let jsonResult:NSDictionary = sendRequest.postRequest("http://localhost:8080/api/user/connect/", body: jsonObject)
            if var val = jsonResult["error"] as? Int { //regarder le code d'erreur
                infoConnexion.text = NSLocalizedString("MESSAGE_WRONGPASSLOG", comment: "information")
                infoConnexion.hidden = false
            }
            else {
                LibraryAPI.sharedInstance.setLogin(logText.text)
                LibraryAPI.sharedInstance.setPassword(passText.text)
                LibraryAPI.sharedInstance.setToken((jsonResult["token"] as? String)!)
                //LibraryAPI.sharedInstance.setUserId((jsonResult["userId"] as? String)!)
                self.performSegueWithIdentifier("connectSegue", sender: self)
            } // retour userID et token 
            
            //println(response)
            //self.performSegueWithIdentifier("connectSegue", sender: self)
        } else {
            infoConnexion.text = NSLocalizedString("MESSAGE_REG_ELEM", comment: "information")
            infoConnexion.hidden = false
        }
        //requete vers l'api/domobox password et login
        
    }
    
    @IBAction func cancelToLoginViewController(segue:UIStoryboardSegue) {
    }

}

