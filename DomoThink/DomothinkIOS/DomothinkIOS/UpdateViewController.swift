//
//  ShowUpdateViewController.swift
//  DomothinkIOS
//
//  Created by Guillaume Wehrling on 28/10/2015.
//  Copyright (c) 2015 DomoThink. All rights reserved.
//

import UIKit

class UpdateViewController: UIViewController {

    @IBOutlet weak var descriptionUpdate: UITextView!
    @IBOutlet weak var updateButton: UIButton!
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var menuBtn: UIBarButtonItem!
    private var timer: NSTimer!
    private var indicator = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if self.revealViewController() != nil {
            menuBtn.target = self.revealViewController()
            menuBtn.action = "revealToggle:"
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
            
        }
        
        updateButton.layer.cornerRadius = 5

        progressView.hidden = true
        descriptionUpdate.hidden = true
        updateButton.hidden = true
        spinner.hidesWhenStopped = true
        
        infoLabel.text = NSLocalizedString("UPDATE_SEARCH", comment: "information")
        spinner.startAnimating()
        descriptionUpdate.text = NSLocalizedString("UPDATE_MESSAGE", comment: "information")
        timer = NSTimer.scheduledTimerWithTimeInterval(0.25, target: self, selector: "searching", userInfo: nil, repeats: true)
        updateButton.addTarget(self, action: "update", forControlEvents: .TouchUpInside)
        // Do any additional setup after loading the view.
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func searching() {
        if (indicator == 6) {
            spinner.stopAnimating()
            timer.invalidate()
            timer = nil
            infoLabel.text = NSLocalizedString("UPDATE_NEW", comment: "information")
            descriptionUpdate.hidden = false
            updateButton.hidden = false
        }
        indicator += 1
    }
    
    func update() {
        descriptionUpdate.hidden = true
        updateButton.hidden = true
        progressView.hidden = false
        infoLabel.text = NSLocalizedString("UPDATE_LOADING", comment: "information")
        timer = NSTimer.scheduledTimerWithTimeInterval(0.25, target: self, selector: "updateProgress", userInfo: nil, repeats: true)
    }
    
    func updateProgress() {
        if (progressView.progress == 1)
        {
            timer.invalidate()
            timer = nil
            progressView.progress = 0
            progressView.hidden = true
            infoLabel.text = NSLocalizedString("UPDATE_INSTALLED", comment: "information")
        }
        progressView.progress += 0.1
    }

}
