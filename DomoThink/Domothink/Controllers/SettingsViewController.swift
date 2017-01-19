//
//  SettingsViewController.swift
//  
//
//  Created by Guillaume Wehrling on 07/10/2016.
//
//

import UIKit

class SettingsViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    @IBOutlet weak var menuBtn: UIBarButtonItem!
    
    
    @IBOutlet weak var themeChoice: UIPickerView!
    
    @IBOutlet weak var passField: UITextField!
    @IBOutlet weak var confPassField: UITextField!
    @IBOutlet weak var btnChangePass: UIButton!
    
    @IBOutlet weak var btnSup: UIButton!
    
    let pickerData = ["DomoThink"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if self.revealViewController() != nil {
            menuBtn.target = self.revealViewController()
            menuBtn.action = #selector(SWRevealViewController.revealToggle(_:))
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
        btnChangePass.layer.cornerRadius = 5
        btnSup.layer.cornerRadius = 5
        themeChoice.delegate = self
        themeChoice.dataSource = self
        
        btnChangePass.addTarget(self, action: #selector(SettingsViewController.changePass), forControlEvents: .TouchUpInside)
        
        btnSup.addTarget(self, action: #selector(SettingsViewController.deleteAccount), forControlEvents: .TouchUpInside)
        
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
        self.view.endEditing(true)
        return pickerData[row]
    }
    
    func changePass() {
        if (passField.text != "" && confPassField.text != "" && passField.text == confPassField.text) {
            
            LibraryAPI.sharedInstance.changePassUser(passField.text!, confPass: confPassField.text!) { (result) -> () in
                if (result == true) {
                    print("tout bien", terminator: "")
                    
                    let alertController = UIAlertController(title:
                        
                        NSLocalizedString("INFO", comment: "information"), message:
                        NSLocalizedString("MESSAGE_CHANGE_DONE", comment: "mdp changer"), preferredStyle: UIAlertControllerStyle.Alert)
                    alertController.addAction(UIAlertAction(title: NSLocalizedString("RETURN", comment: "Dismiss"), style: UIAlertActionStyle.Default,handler: nil))
                    
                    self.presentViewController(alertController, animated: true, completion: nil)
                    
                } else {
                    print("tout pas bien", terminator: "")
                    let alertController = UIAlertController(title:
                        
                        NSLocalizedString("INFO", comment: "information"), message:
                        NSLocalizedString("MESSAGE_CHANGE_FAIL", comment: "mdp non changer"), preferredStyle: UIAlertControllerStyle.Alert)
                    alertController.addAction(UIAlertAction(title: NSLocalizedString("RETURN", comment: "Dismiss"), style: UIAlertActionStyle.Default,handler: nil))
                    
                    self.presentViewController(alertController, animated: true, completion: nil)
                }
            }
            
        } else {
           let alertController = UIAlertController(title:
                
                NSLocalizedString("INFO", comment: "information"), message:
                NSLocalizedString("MESSAGE_CHANGE_WRONGCONF", comment: "mdp different"), preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: NSLocalizedString("RETURN", comment: "Dismiss"), style: UIAlertActionStyle.Default,handler: nil))
            
            self.presentViewController(alertController, animated: true, completion: nil)
        }
        
    }
    func deleteAccount() {
        LibraryAPI.sharedInstance.deleteUser() { (result) -> () in
            self.performSegueWithIdentifier("logoutAfterDel", sender: nil)
        }
    }

}
