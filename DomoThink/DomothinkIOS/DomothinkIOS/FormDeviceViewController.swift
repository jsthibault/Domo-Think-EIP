//
//  FormDeviceViewController.swift
//  
//
//  Created by Guillaume Wehrling on 11/05/2016.
//
//

import UIKit

class FormDeviceViewController: UIViewController {

    @IBOutlet weak var nameObject: UITextField!

    var device: Device!
    var updating: Bool!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if (device != nil) {
            nameObject.text = device._name
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "saveDeviceSegue" {
            if (device == nil || nameObject.text == "") {
                updating = false
                // create new directive with the value add by the user
                
                
                
                //device = Device(id: LibraryAPI.sharedInstance.gethighestIdDevice() + 1, name: nameObject.text, isActive: true, description: description.text)
                
                //add directive in data
                //LibraryAPI.sharedInstance.addDirective(addDirectiveObject, index: LibraryAPI.sharedInstance.countDirectives())
            }
            else {
                updating = true
                device._name = nameObject.text
            }
            
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
