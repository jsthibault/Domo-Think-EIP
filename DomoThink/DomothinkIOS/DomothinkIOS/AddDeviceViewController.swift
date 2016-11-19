//
//  AddDeviceViewController.swift
//  
//
//  Created by Guillaume Wehrling on 06/06/2016.
//
//

import UIKit

class AddDeviceViewController: UIViewController {
    
    @IBOutlet weak var deviceName: UITextField!
    @IBOutlet weak var deviceDescription: UITextView!
    @IBOutlet weak var btnInstall: UIButton!
    var device: Device!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if (device != nil) {
            deviceName.text = device._name
            deviceDescription.text = device._description
        }
        
        btnInstall.layer.cornerRadius = 5
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
