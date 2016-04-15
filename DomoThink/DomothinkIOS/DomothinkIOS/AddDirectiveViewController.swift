//
//  AddDirectiveViewController.swift
//  DomothinkIOS
//
//  Created by Guillaume Wehrling on 24/10/2015.
//  Copyright (c) 2015 DomoThink. All rights reserved.
//

import UIKit

class AddDirectiveViewController: UIViewController {

    @IBOutlet weak var ordreText: UITextField!
    @IBOutlet weak var dateChoice: UIDatePicker!

    
    var directive: Directive!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if (directive != nil) {
        ordreText.text = directive._title
        dateChoice.date = directive._dateApply
        }
        //add target for the button
}
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "saveDirectiveSegue" {
            if (directive == nil) {
                // create new directive with the value add by the user
                directive = Directive(id: LibraryAPI.sharedInstance.countDirectives(), title: ordreText.text, dateCreate: NSDate(), dateApply: dateChoice.date, isActive: true)
                
                //add directive in data
                //LibraryAPI.sharedInstance.addDirective(addDirectiveObject, index: LibraryAPI.sharedInstance.countDirectives())
            }
            else {
                println("je update")
                directive._title = ordreText.text
                directive._dateApply = dateChoice.date
                //LibraryAPI.sharedInstance.updateDirective(directive, id: directive._id)
            }

        }
    }
    
}
