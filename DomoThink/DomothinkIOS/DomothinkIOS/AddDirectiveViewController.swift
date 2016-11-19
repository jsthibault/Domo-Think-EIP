//
//  AddDirectiveViewController.swift
//  DomothinkIOS
//
//  Created by Guillaume Wehrling on 24/10/2015.
//  Copyright (c) 2015 DomoThink. All rights reserved.
//

import UIKit

class AddDirectiveViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    @IBOutlet weak var ordreText: UITextField!
    @IBOutlet weak var dateChoice: UIDatePicker!

    @IBOutlet weak var objectPicker: UIPickerView!
    @IBOutlet weak var redondancePicker: UIPickerView!
    
    var directive: Directive!
    var updating: Bool!
    
    private var pickerDataO = [Device]()
    let pickerDataR = ["tout les jours","toutes les semaines","tout les ans"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if (directive != nil) {
        ordreText.text = directive._title
        dateChoice.date = directive._dateApply
        }
        pickerDataO = LibraryAPI.sharedInstance.getDevice() as [Device]
        
        //add target for the button
        
        objectPicker.delegate = self
        objectPicker.dataSource = self
        
        redondancePicker.delegate = self
        redondancePicker.dataSource = self
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView.tag == 0 {
            return pickerDataO.count
        } else {
            return pickerDataR.count
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView.tag == 0 {
            return pickerDataO[row]._name
        } else {
            return pickerDataR[row]
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "saveDirectiveSegue" {
            if (directive == nil) {
                updating = false
                // create new directive with the value add by the user
                
                
                
                directive = Directive(id: LibraryAPI.sharedInstance.gethighestId() + 1, title: ordreText.text, dateCreate: NSDate(), dateApply: dateChoice.date, isActive: true)
                
                //add directive in data
                //LibraryAPI.sharedInstance.addDirective(addDirectiveObject, index: LibraryAPI.sharedInstance.countDirectives())
            }
            else {
                
                println("je update")
                updating = true
                directive._title = ordreText.text
                directive._dateApply = dateChoice.date
                //LibraryAPI.sharedInstance.updateDirective(directive, id: directive._id)
            }

        }
    }
    
}
