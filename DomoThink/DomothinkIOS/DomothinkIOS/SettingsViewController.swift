//
//  SettingsViewController.swift
//  DomothinkIOS
//
//  Created by Guillaume Wehrling on 17/12/2015.
//  Copyright (c) 2015 DomoThink. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    @IBOutlet weak var themeChoice: UIPickerView!
    @IBOutlet weak var menuBtn: UIBarButtonItem!
    
    @IBOutlet weak var oldPassField: UITextField!
    @IBOutlet weak var passField: UITextField!
    @IBOutlet weak var confPassField: UITextField!
    @IBOutlet weak var btnChangePass: UIButton!
    
    @IBOutlet weak var btnSup: UIButton!
    
    let pickerData = ["Gris"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if self.revealViewController() != nil {
            menuBtn.target = self.revealViewController()
            menuBtn.action = "revealToggle:"
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
            
            
            
        }
        btnChangePass.layer.cornerRadius = 5
        btnSup.layer.cornerRadius = 5
        themeChoice.delegate = self
        themeChoice.dataSource = self
        
        btnChangePass.addTarget(self, action: "changePass", forControlEvents: .TouchUpInside)
        
        btnSup.addTarget(self, action: "deleteAccount", forControlEvents: .TouchUpInside)
        
        // Do any additional setup after loading the view.
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    
    func changePass() {
        if (passField.text != "" && confPassField.text != "" && passField.text == confPassField.text) {
            /*
            var sendRequest = HttpRequest()
            let jsonObject: [String: String] = [
                "username": LibraryAPI.sharedInstance.getLogin(),
                "userId": LibraryAPI.sharedInstance.getUserId(),
                "oldPassword": oldPassField.text,
                "newPassword": passField.text,
                "confirmPassword": confPassField.text
            ]
            
            var jsonResult:NSDictionary = sendRequest.postRequest("http://89.156.144.51:4242/user/change_password", body: jsonObject)
            
            if var val = jsonResult["error"] as? Int {
               println(val)
                
                let alertController = UIAlertController(title:
                    
                    NSLocalizedString("INFO", comment: "information"), message:
                    NSLocalizedString("MESSAGE_CHANGE_WRONG", comment: "ancien mdp pas bon"), preferredStyle: UIAlertControllerStyle.Alert)
                alertController.addAction(UIAlertAction(title: NSLocalizedString("RETURN", comment: "Dismiss"), style: UIAlertActionStyle.Default,handler: nil))
                
                self.presentViewController(alertController, animated: true, completion: nil)
            
            }
            else {
                let alertController = UIAlertController(title:
                    
                    NSLocalizedString("INFO", comment: "information"), message:
                    NSLocalizedString("MESSAGE_CHANGE_DONE", comment: "mdp changed"), preferredStyle: UIAlertControllerStyle.Alert)
                alertController.addAction(UIAlertAction(title: NSLocalizedString("RETURN", comment: "Dismiss"), style: UIAlertActionStyle.Default,handler: nil))
                
                self.presentViewController(alertController, animated: true, completion: nil)
                println("reussi")
                LibraryAPI.sharedInstance.setPassword(passField.text)
                oldPassField.text = ""
                passField.text = ""
                confPassField.text = ""
                
                
            }
            */
            let alertController = UIAlertController(title:
                
                NSLocalizedString("INFO", comment: "information"), message:
                NSLocalizedString("MESSAGE_CHANGE_DONE", comment: "elemant manquant"), preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: NSLocalizedString("RETURN", comment: "Dismiss"), style: UIAlertActionStyle.Default,handler: nil))
            
            self.presentViewController(alertController, animated: true, completion: nil)
            
            
        } else {
            let alertController = UIAlertController(title:
                
                NSLocalizedString("INFO", comment: "information"), message:
                NSLocalizedString("MESSAGE_CHANGE_WRONGCONF", comment: "mdp different"), preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: NSLocalizedString("RETURN", comment: "Dismiss"), style: UIAlertActionStyle.Default,handler: nil))
            
            self.presentViewController(alertController, animated: true, completion: nil)
        }
    
    }
    
    func deleteAccount() {
        /*var sendRequest = HttpRequest()
        var jsonObject: [String: String] = [
            "username": LibraryAPI.sharedInstance.getLogin(), "password": LibraryAPI.sharedInstance.getPassword(), "userId": LibraryAPI.sharedInstance.getUserId()
        ]
        
        
        var jsonResult:NSDictionary = sendRequest.postRequest("http://89.156.144.51:4242/user/remove_account", body: jsonObject)
        //let jsonResult:NSDictionary = sendRequest.postRequest("http://localhost:8080/api/user/connect/", body: jsonObject)
        if var val = jsonResult["error"] as? Int { //regarder le code d'erreur
            println(val)
        }
        else {
            println("reussi")
        }
        */
        let alertController = UIAlertController(title:
            
            NSLocalizedString("INFO", comment: "information"), message:
            NSLocalizedString("DELETE_ACCOUNT", comment: "elemant manquant"), preferredStyle: UIAlertControllerStyle.Alert)
        alertController.addAction(UIAlertAction(title: NSLocalizedString("RETURN", comment: "Dismiss"), style: UIAlertActionStyle.Default,handler: nil))
        
        self.presentViewController(alertController, animated: true, completion: nil)
    }
    
    /*func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        myLabel.text = pickerData[row]
    }*/
    
}
