//
//  testSegue.swift
//  
//
//  Created by Guillaume Wehrling on 20/07/2016.
//
//

import UIKit

class testSegue: UIStoryboardSegue {
   
    override func perform() {
       
        let sourceVC = self.sourceViewController
        let destinationVC = self.destinationViewController
        
        var sendRequest = HttpRequest()
        let jsonObject: [String: String] = [
            "token": "token"
        ]
        
        let jsonResult:NSDictionary = sendRequest.postRequest("http://localhost:8080/api/user/logout", body: jsonObject)
        
        
        sourceVC.view!!.addSubview(destinationVC.view!!)
        destinationVC.view!!.transform = CGAffineTransformMakeScale(0.5, 0.5)
        UIView.animateWithDuration(0.5, delay: 0.0, options: .CurveEaseInOut, animations: { () -> Void in
            destinationVC.view!!.transform = CGAffineTransformMakeScale(1.0, 1.0)
            
            }) { (finished) -> Void in
                
                destinationVC.view!!.removeFromSuperview()
                let time = dispatch_time(DISPATCH_TIME_NOW, Int64(0.001 * Double(NSEC_PER_SEC)))
                
                dispatch_after(time, dispatch_get_main_queue(), { () -> Void in
                    
                    sourceVC.presentViewController(destinationVC as! UIViewController, animated: false, completion: nil)
                
                
                })
            }

        
        
    }
    
}
