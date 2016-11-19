//
//  ForgotPassViewController.swift
//  
//
//  Created by Guillaume Wehrling on 01/06/2016.
//
//

import UIKit

class ForgotPassViewController: UIViewController {

    @IBOutlet weak var emailField: UITextField!

    @IBOutlet weak var textforgot: UITextView!
    @IBOutlet weak var btnValidation: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        btnValidation.addTarget(self, action: "changePass", forControlEvents: .TouchUpInside)
        btnValidation.layer.cornerRadius = 5
        
        textforgot.text = NSLocalizedString("MESSAGE_EXPLICATIF", comment: "information")
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func changePass() {
        if (emailField.text != "") //voir pour mettre d'autre conditions nombre de parametre etc
        {
                
                var sendRequest = HttpRequest()
                let jsonObject: [String: String] = [
                    "email": emailField.text
                ]
                
                sendRequest.postRequest("http://localhost:8080/api/user/forgotten_password", body: jsonObject)
            
            let alertController = UIAlertController(title:
                
                NSLocalizedString("INFO", comment: "information"), message:
                NSLocalizedString("MESSAGE_EMAILSEND", comment: "Fill the field Email"), preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: NSLocalizedString("RETURN", comment: "Dismiss"), style: UIAlertActionStyle.Default,handler: nil))
            
            self.presentViewController(alertController, animated: true, completion: nil)
            
                //self.performSegueWithIdentifier("afterforgotPass", sender: self)
        }
        else {
            let alertController = UIAlertController(title:
                
                NSLocalizedString("INFO", comment: "information"), message:
                NSLocalizedString("MESSAGE", comment: "Fill the field Email"), preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: NSLocalizedString("RETURN", comment: "Dismiss"), style: UIAlertActionStyle.Default,handler: nil))
            
            self.presentViewController(alertController, animated: true, completion: nil)
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
