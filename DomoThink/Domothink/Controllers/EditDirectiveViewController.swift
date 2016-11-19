//
//  EditDirectiveViewController.swift
//  Domothink
//
//  Created by Guillaume Wehrling on 12/11/2016.
//  Copyright © 2016 DomoThink. All rights reserved.
//

import UIKit

class EditDirectiveViewController: UIViewController, UIScrollViewDelegate, UIPickerViewDataSource, UIPickerViewDelegate  {

    
    @IBOutlet weak var ordreText: UITextField!
    @IBOutlet weak var dateChoice: UIDatePicker!
    
    @IBOutlet weak var objectPicker: UIPickerView!
    //@IBOutlet weak var redondancePicker: UIPickerView!
    
    var directive: Directive!
    private var devices = [Device]()
    var updating: Bool!
    private var deviceSelected: Device!
    
    let pickerDataR = ["une fois", "tout les jours","toutes les semaines","tout les ans"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
            LibraryAPI.sharedInstance.getDevices() { (result) -> () in
                self.devices = result
                self.objectPicker.reloadAllComponents()
            }
        
        
        if (directive != nil) {
            ordreText.text = directive.getName()
            
            /*let dateFormatter = NSDateFormatter()
            dateFormatter.dateFormat = ""
            let date = dateFormatter.dateFromString(directive.getPerData()["date"])
            
            dateChoice.date = directive.getPerData()["date"]*/
        }
        
        //add target for the button
        
        objectPicker.delegate = self
        objectPicker.dataSource = self
        
        //redondancePicker.delegate = self
       // redondancePicker.dataSource = self
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.devices.count
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return self.devices[row].getName()
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        deviceSelected = devices[row]
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "unwindSaveDir" {
            if (directive == nil) {
                let tmp = []
                LibraryAPI.sharedInstance.addDirective(ordreText.text!, creatorId: LibraryAPI.sharedInstance.getUser().getId(), deviceId: deviceSelected.getId(), actionId: 10, periodicityType: 1, periodicityData: tmp) { (result) -> () in
                    if (result == true) {
                        print("bien", terminator: "")
                    } else {
                        print("pas bien", terminator: "")
                    }
                }
                //post une directive
            } else {
                //put une directive
                LibraryAPI.sharedInstance.modifyDirective(directive) { (result) -> () in
                    if (result == true) {
                        print("bien", terminator: "")
                    } else {
                        print("pas bien", terminator: "")
                    }
                }
            }
        }
    }


}
