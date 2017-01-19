//
//  EditDeviceViewController.swift
//  Domothink
//
//  Created by Guillaume Wehrling on 19/01/2017.
//  Copyright © 2017 DomoThink. All rights reserved.
//

import UIKit

class EditDeviceViewController: UIViewController {

    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var descField: UITextView!
    
    var device: Device!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if (device != nil) {
            nameField.text = device.getName()
            descField.text = device.getDesc()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "saveUnwindID") {
            
            print("jy pass")
            device.setDesc(descField.text)
            device.setName(nameField.text!)
            LibraryAPI.sharedInstance.modifyDevice(device) { (result) ->() in
                if (result) {
                    print("yesss")
                }
            }
        }
    }

}
