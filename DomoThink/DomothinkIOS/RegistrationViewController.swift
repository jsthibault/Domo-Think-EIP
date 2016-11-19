//
//  RegistrationViewController.swift
//  
//
//  Created by Guillaume Wehrling on 31/05/2016.
//
//

import UIKit

class RegistrationViewController: UIViewController {

    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passField: UITextField!
    @IBOutlet weak var confPassField: UITextField!
    @IBOutlet weak var boxCode: UITextField!
    
    @IBOutlet weak var btnReg: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        btnReg.addTarget(self, action: "registration", forControlEvents: .TouchUpInside)
        btnReg.layer.cornerRadius = 5
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func registration() {
        if (emailField.text != "" && passField.text != "" && confPassField.text != "" && boxCode.text != "") //voir pour mettre d'autre conditions nombre de parametre etc
        {
            if (passField.text == confPassField.text) {
                
                var sendRequest = HttpRequest()
                let jsonObject: [String: String] = [
                    "username": emailField.text, "password": passField.text, "confirmPassword": confPassField.text, "boxKey" : boxCode.text
                ]
                
                let jsonResult:NSDictionary = sendRequest.postRequest("http://localhost:8080/api/user/create_account", body: jsonObject)
                /*if let val = jsonResult["error"] as? String {
                    infoConnexion.text = val
                    infoConnexion.hidden = false
                */
                
                
                /*if var val = jsonResult["error"] as? Int { //regarder le code d'erreur
                    println(val)
                    let alertController = UIAlertController(title:
                        
                        NSLocalizedString("INFO", comment: "information"), message:
                        NSLocalizedString("MESSAGE_REG_LOG", comment: "login"), preferredStyle: UIAlertControllerStyle.Alert)
                    alertController.addAction(UIAlertAction(title: NSLocalizedString("RETURN", comment: "Dismiss"), style: UIAlertActionStyle.Default,handler: nil))
                     self.presentViewController(alertController, animated: true, completion: nil)
                }
                else {
                    self.performSegueWithIdentifier("afterRegistration", sender: self)
                    
                }*/
                self.performSegueWithIdentifier("afterRegistration", sender: self)
                
                
            } else {
                
                let alertController = UIAlertController(title:
                    
                    NSLocalizedString("INFO", comment: "information"), message:
                    NSLocalizedString("MESSAGE_REG_MDP", comment: "MDP"), preferredStyle: UIAlertControllerStyle.Alert)
                alertController.addAction(UIAlertAction(title: NSLocalizedString("RETURN", comment: "Dismiss"), style: UIAlertActionStyle.Default,handler: nil))
                 self.presentViewController(alertController, animated: true, completion: nil)
                
            }
            
            
            //println(response)
            //self.performSegueWithIdentifier("connectSegue", sender: self)
        } else {
            let alertController = UIAlertController(title:
                
                NSLocalizedString("INFO", comment: "information"), message:
                NSLocalizedString("MESSAGE_REG_ELEM", comment: "elemant manquant"), preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: NSLocalizedString("RETURN", comment: "Dismiss"), style: UIAlertActionStyle.Default,handler: nil))
             self.presentViewController(alertController, animated: true, completion: nil)
        }
    }


}
