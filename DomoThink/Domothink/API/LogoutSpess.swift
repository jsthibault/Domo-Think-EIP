//
//  LogoutSpess.swift
//  Domothink
//
//  Created by Guillaume Wehrling on 14/11/2016.
//  Copyright © 2016 DomoThink. All rights reserved.
//

import UIKit

class LogoutSpess: UIStoryboardSegue {

    override func perform() {
        
        let sourceVC = self.sourceViewController
        let destinationVC = self.destinationViewController
        
        LibraryAPI.sharedInstance.logoutUser() { (result) -> () in
            print("user is disconnected", terminator: "")
        }
        
        
        sourceVC.view!.addSubview(destinationVC.view!)
        destinationVC.view!.transform = CGAffineTransformMakeScale(0.5, 0.5)
        UIView.animateWithDuration(0.5, delay: 0.0, options: .CurveEaseInOut, animations: { () -> Void in
            destinationVC.view!.transform = CGAffineTransformMakeScale(1.0, 1.0)
            
        }) { (finished) -> Void in
            
            destinationVC.view!.removeFromSuperview()
            let time = dispatch_time(DISPATCH_TIME_NOW, Int64(0.001 * Double(NSEC_PER_SEC)))
            
            dispatch_after(time, dispatch_get_main_queue(), { () -> Void in
                
                sourceVC.presentViewController(destinationVC , animated: false, completion: nil)
                
                
            })
        }
        
        
        
    }

}
