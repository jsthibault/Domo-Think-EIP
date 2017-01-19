//
//  LoginViewController.swift
//  
//
//  Created by Guillaume Wehrling on 18/09/2016.
//
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var loginField: UITextField!
    @IBOutlet weak var passField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func unwindToLogin(segue: UIStoryboardSegue) {}
    
    @IBAction func unwindToLoginAfterRegister(segue: UIStoryboardSegue) {
        let alertController = UIAlertController(title:
            
            NSLocalizedString("INFO", comment: "information"), message:
            NSLocalizedString("MESSAGE_REGISTER_COMPLETE", comment: "after register"), preferredStyle: UIAlertControllerStyle.Alert)
        alertController.addAction(UIAlertAction(title: NSLocalizedString("RETURN", comment: "Dismiss"), style: UIAlertActionStyle.Default,handler: nil))
        
        self.presentViewController(alertController, animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func connectBtnPressed(sender: UIButton) {
        //self.performSegueWithIdentifier("ConnectSegue", sender: nil)
        if (loginField.text != "" && passField.text != "") {
            LibraryAPI.sharedInstance.connectUser(loginField.text!, pass: passField.text!) { (result) -> () in
                if (result == true) {
                    debugPrint(LibraryAPI.sharedInstance.getUser(), terminator: "")
                    self.performSegueWithIdentifier("ConnectSegue", sender: nil)
                } else {
                    let alertController = UIAlertController(title:
                    
                    NSLocalizedString("INFO", comment: "information"), message:
                    NSLocalizedString("MESSAGE_CONNECTION_FAILED", comment: "conn failed"), preferredStyle: UIAlertControllerStyle.Alert)
                    alertController.addAction(UIAlertAction(title: NSLocalizedString("RETURN", comment: "Dismiss"), style: UIAlertActionStyle.Default,handler: nil))
                
                    self.presentViewController(alertController, animated: true, completion: nil)
                }

            }
        } else {
            let alertController = UIAlertController(title:
                
                NSLocalizedString("INFO", comment: "information"), message:
                NSLocalizedString("MESSAGE_WRONGPASSLOG", comment: "conn failed"), preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: NSLocalizedString("RETURN", comment: "Dismiss"), style: UIAlertActionStyle.Default,handler: nil))
            
            self.presentViewController(alertController, animated: true, completion: nil)
        }
        
    }
    

}
