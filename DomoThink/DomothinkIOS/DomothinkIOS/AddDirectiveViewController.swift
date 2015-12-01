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
    @IBOutlet weak var buttonAdd: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //add target for the button
        buttonAdd.addTarget(self, action: "addDirective", forControlEvents: .TouchUpInside)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func addDirective() {
        
        // create new directive with the value add by the user
        let addDirectiveObject = Directive(title: ordreText.text, dateCreate: NSDate(), dateApply: dateChoice.date, isActive: true)
        
        //add directive in data
        LibraryAPI.sharedInstance.addDirective(addDirectiveObject, index: LibraryAPI.sharedInstance.countDirectives())
        
        //go back to the last view
        self.performSegueWithIdentifier("directiveSection", sender: self)
    }
}
