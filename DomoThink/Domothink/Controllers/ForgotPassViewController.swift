//
//  ForgotPassViewController.swift
//  
//
//  Created by Guillaume Wehrling on 04/10/2016.
//
//

import UIKit

class ForgotPassViewController: UIViewController {

    @IBOutlet weak var emailField: UITextField!
    
    @IBOutlet weak var passField: UITextField!
    @IBOutlet weak var passConfField: UITextField!
    @IBOutlet weak var boxKey: UITextField!
    
    @IBOutlet weak var sendBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        sendBtn.addTarget(self, action: #selector(SettingsViewController.changePass), forControlEvents: .TouchUpInside)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func changePass() {
        if (emailField.text != "" && passField.text != "" && passConfField.text != "" && boxKey.text != "") {
            /*LibraryAPI.sharedInstance.forgotPassUser(emailField.text!, pass: passField.text!, confPass: passConfField.text!, boxKey: boxKey.text!) {
                (result) -> () in
                //ajouter requete http vers l'api
                let alertController = UIAlertController(title:
                    
                    NSLocalizedString("INFO", comment: "information"), message:
                    NSLocalizedString("MESSAGE_FORGOT_DONE", comment: "email envoyer"), preferredStyle: UIAlertControllerStyle.Alert)
                alertController.addAction(UIAlertAction(title: NSLocalizedString("RETURN", comment: "Dismiss"), style: UIAlertActionStyle.Default,handler: nil))
                
                self.presentViewController(alertController, animated: true, completion: nil)
            }*/
            let alertController = UIAlertController(title:
                
                NSLocalizedString("INFO", comment: "information"), message:
                NSLocalizedString("SERVICE_NOT_AVAIBLE", comment: "email envoyer"), preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: NSLocalizedString("RETURN", comment: "Dismiss"), style: UIAlertActionStyle.Default,handler: nil))
            
            self.presentViewController(alertController, animated: true, completion: nil)
        } else {
            let alertController = UIAlertController(title:
                
                NSLocalizedString("INFO", comment: "information"), message:
                NSLocalizedString("MESSAGE_REG_ELEM", comment: "field empty"), preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: NSLocalizedString("RETURN", comment: "Dismiss"), style: UIAlertActionStyle.Default,handler: nil))
            
            self.presentViewController(alertController, animated: true, completion: nil)
        }
    }
}
