//
//  BoxStatusViewController.swift
//  Domothink
//
//  Created by Guillaume Wehrling on 19/01/2017.
//  Copyright © 2017 DomoThink. All rights reserved.
//

import UIKit

class BoxStatusViewController: UIViewController {

    @IBOutlet weak var simulatorSwitch: UISwitch!
    @IBOutlet weak var zwaveSwitch: UISwitch!
    @IBOutlet weak var menuBtn: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if self.revealViewController() != nil {
            menuBtn.target = self.revealViewController()
            menuBtn
                .action = #selector(SWRevealViewController.revealToggle(_:))
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
            
        }
        
        LibraryAPI.sharedInstance.getBoxStatus() { (result) -> () in
            self.simulatorSwitch.setOn(result.objectForKey("simulator") as! Bool, animated: true)
            self.zwaveSwitch.setOn(result.objectForKey("zwave") as! Bool, animated: true)
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
