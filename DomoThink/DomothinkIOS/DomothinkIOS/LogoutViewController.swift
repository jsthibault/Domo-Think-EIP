//
//  logoutViewController.swift
//
//
//  Created by Guillaume Wehrling on 01/06/2016.
//
//

import UIKit

class LogoutViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        var sendRequest = HttpRequest()
        let jsonObject: [String: String] = [
            "token": "token"
        ]
        
        let jsonResult:NSDictionary = sendRequest.postRequest("http://localhost:8080/api/user/logout", body: jsonObject)
        
        
        self.performSegueWithIdentifier("customSegue", sender: self)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
