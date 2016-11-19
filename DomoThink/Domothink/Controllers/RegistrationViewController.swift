//
//  RegistrationViewController.swift
//  
//
//  Created by Guillaume Wehrling on 04/10/2016.
//
//

import UIKit

class RegistrationViewController: UIViewController {

    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passField: UITextField!
    @IBOutlet weak var confPassField: UITextField!
    @IBOutlet weak var boxKeyField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onPressRegister(sender: AnyObject) {
        LibraryAPI.sharedInstance.registrationUser(emailField.text!, pass: passField.text!, confPass: confPassField.text!, boxKey: boxKeyField.text!) { (result) -> () in
            print("la reponse est : " + result.description, terminator: "")
        }
    }
}
