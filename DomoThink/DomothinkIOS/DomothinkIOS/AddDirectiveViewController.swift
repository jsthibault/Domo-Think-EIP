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
    
    var element1: String!
    var element2: String!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        buttonAdd.addTarget(self, action: "addDirective", forControlEvents: .TouchUpInside)
        // Do any additional setup after loading the view.
    }
    
    
    
    func addDirective() {
        
        
        /*var dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "hh:mm" //format style. Browse online to get a format that fits your needs.
        element1 = dateFormatter.stringFromDate(dateChoice.date)
        
        //element1 = "12:00"
        element2 = ordreText.text*/
        
        self.performSegueWithIdentifier("directiveSection", sender: self)
    }
    

    //a revoir ne marche pas 
    /*override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "directiveSection") {
            var svc = segue.destinationViewController as! DirectiveViewController
            
            svc.dataPassed = element2
            svc.dataPassed2 = element1
            
            //svc.dataPassed = sender
        }
    }*/
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
}
