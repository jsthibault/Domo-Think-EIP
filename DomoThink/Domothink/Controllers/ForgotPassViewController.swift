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
        
        //ajouter requete http vers l'api
        let alertController = UIAlertController(title:
            
            NSLocalizedString("INFO", comment: "information"), message:
            NSLocalizedString("MESSAGE_FORGOT_DONE", comment: "email envoyer"), preferredStyle: UIAlertControllerStyle.Alert)
        alertController.addAction(UIAlertAction(title: NSLocalizedString("RETURN", comment: "Dismiss"), style: UIAlertActionStyle.Default,handler: nil))
        
        self.presentViewController(alertController, animated: true, completion: nil)
    }
    


}
