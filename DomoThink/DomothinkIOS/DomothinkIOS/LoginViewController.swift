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

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        connectButton.addTarget(self, action: "login", forControlEvents: .TouchUpInside)
        logText.delegate = self
        passText.delegate = self
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
            self.performSegueWithIdentifier("connectSegue", sender: self)
        }
        //requete vers l'api/domobox password et login
        
    }


}

