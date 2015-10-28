//
//  ProgressViewController.swift
//  DomothinkIOS
//
//  Created by Guillaume Wehrling on 17/10/2015.
//  Copyright (c) 2015 DomoThink. All rights reserved.
//

import UIKit

class ProgressViewController: UIViewController {

    
    @IBOutlet weak var progressView: UIProgressView!
    var timer: NSTimer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        timer = NSTimer.scheduledTimerWithTimeInterval(0.25, target: self, selector: "updateProgress", userInfo: nil, repeats: true)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func updateProgress() {
        if (progressView.progress == 1)
        {
            timer.invalidate()
            self.performSegueWithIdentifier("goToHome", sender: self)
        }
        progressView.progress += 0.1
        let progressValue = self.progressView?.progress
    //    progressLabel?.text = "\(progressValue! * 100) %"
    }

}
