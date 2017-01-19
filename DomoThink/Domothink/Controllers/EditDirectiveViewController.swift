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
    
    @IBOutlet weak var dayChoice: UIPickerView!
    @IBOutlet weak var objectPicker: UIPickerView!
    //@IBOutlet weak var redondancePicker: UIPickerView!
    
    var directive: Directive!
    private var devices = [Device]()
    var updating: Bool!
    private var deviceSelected: Device!
    private var daySelected: Int!
    
    private var directiveType = 1
    let dayPickerData = ["maintenant", "lundi", "mardi","mercredi","jeudi", "vendredi", "samedi", "dimanche"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        objectPicker.delegate = self
        objectPicker.dataSource = self
        objectPicker.tag = 0
        
        dayChoice.delegate = self
        dayChoice.dataSource = self
        dayChoice.tag = 1
        
        daySelected = 0
        
        LibraryAPI.sharedInstance.getDevices() { (result) -> () in
            self.devices = result
            self.devices.removeLast()
            self.objectPicker.reloadAllComponents()
            
            if (self.directive != nil) {
                var i = 0
                for elem in self.devices {
                    if (self.directive.getDeviceId() == elem.getId()) {
                        self.objectPicker.selectRow(i, inComponent: 0, animated: true)
                    }
                    i += 1
                }
            }
        }

        if (directive != nil) {
            ordreText.text = directive.getName()
            
            if (directive.getPerType() == 2) {
                let dateFormatter = NSDateFormatter()
                dateFormatter.dateFormat = "H:m"
                let s = dateFormatter.dateFromString(directive.getRecHour())
                dateChoice.date = s!
                dayChoice.selectRow(directive.getRecDayInt(), inComponent: 0, animated: true)
                daySelected = directive.getRecDayInt()
            } else {
                dayChoice.selectRow(0, inComponent: 0, animated: true)
                daySelected = 0
            }
            
        }
        
        //recuperer date et jour afin de mettre a jour la vue avec les bonne valeur
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if (pickerView.tag == 0) {
            return self.devices.count
        } else {
            return self.dayPickerData.count
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if (pickerView.tag == 0)
        {
            return self.devices[row].getName()
        } else {
            return self.dayPickerData[row]
        }
        
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if (pickerView.tag == 0) {
            deviceSelected = devices[row]
        } else {
            if (row > 0) {
                directiveType = 2
            } else {
                directiveType = 1
            }
            daySelected = row
        }
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "unwindSaveDir" {
            if (directive == nil) {
                
                let hour = LibraryAPI.sharedInstance.hourFormatter(dateChoice.date)
                
                let tmp = "{\"day\": \(daySelected), \"hour\": \"\(hour)\"}"
                
                var idDevice: Int!
                if (deviceSelected == nil) {
                    if (devices.count == 0) {
                        idDevice = -1
                    } else {
                        idDevice = devices[0].getId()
                    }
                } else {
                    idDevice = deviceSelected.getId()
                }
                LibraryAPI.sharedInstance.addDirective(ordreText.text!, creatorId: LibraryAPI.sharedInstance.getUser().getId(), deviceId: idDevice, actionId: 0, periodicityType: directiveType, periodicityData: tmp) { (result) -> () in
                    if (result == true) {
                        print("bien", terminator: "")
                    } else {
                        print("pas bien", terminator: "")
                    }
                }
                //post une directive
            } else {
                //put une directive
                directive.setName(ordreText.text!)
                
                let hour = LibraryAPI.sharedInstance.hourFormatter(dateChoice.date)
                if (daySelected == 0) {
                    directive.setPerType(1)
                } else {
                    directive.setPerType(2)
                    directive.setPerData("{\"day\": \(daySelected), \"hour\": \"\(hour)\"}")
                }
                
                
                
                var idDevice: Int!
                if (deviceSelected == nil) {
                    if (devices.count == 0) {
                        idDevice = -1
                    } else {
                        idDevice = devices[0].getId()
                    }
                } else {
                    idDevice = deviceSelected.getId()
                }
                directive.setDeviceId(idDevice)
                
                LibraryAPI.sharedInstance.modifyDirective(directive) { (result) -> () in
                    if (result == true) {
                        print("bien", terminator: "")
                    } else {
                        print("pas bien", terminator: "")
                    }
                }
            }
            usleep(5000)
        }
    }


}
