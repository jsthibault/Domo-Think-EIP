//
//  UpdateViewController.swift
//  
//
//  Created by Guillaume Wehrling on 07/10/2016.
//
//

import UIKit

class UpdateViewController: UIViewController {

    @IBOutlet weak var menuBtn: UIBarButtonItem!
    
    @IBOutlet weak var descriptionUpdate: UITextView!
    @IBOutlet weak var updateButton: UIButton!
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    @IBOutlet weak var infoLabel: UILabel!
    private var timer: NSTimer!
    private var indicator = 0
    private var isUpdate = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if self.revealViewController() != nil {
            menuBtn.target = self.revealViewController()
            menuBtn.action = #selector(SWRevealViewController.revealToggle(_:))
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
            
        }
        
        LibraryAPI.sharedInstance.getActualVersion() { (actualVersion) -> () in
            LibraryAPI.sharedInstance.getNewVersion() { (newVersion) -> () in
                if (actualVersion == newVersion) {
                    self.isUpdate = true
                } else {
                    self.isUpdate = false
                }
            }
        }
        
        updateButton.layer.cornerRadius = 5
        
        progressView.hidden = true
        descriptionUpdate.hidden = true
        updateButton.hidden = true
        spinner.hidesWhenStopped = true
        
        infoLabel.text = NSLocalizedString("UPDATE_SEARCH", comment: "information")
        spinner.startAnimating()
        descriptionUpdate.text = NSLocalizedString("UPDATE_MESSAGE", comment: "information")
        timer = NSTimer.scheduledTimerWithTimeInterval(0.25, target: self, selector: #selector(UpdateViewController.searching), userInfo: nil, repeats: true)
        updateButton.addTarget(self, action: #selector(UpdateViewController.update), forControlEvents: .TouchUpInside)
        // Do any additional setup after loading the view.
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func searching() {
        if (indicator == 6 && isUpdate == false) {
            spinner.stopAnimating()
            timer.invalidate()
            timer = nil
            infoLabel.text = NSLocalizedString("UPDATE_NEW", comment: "information")
            descriptionUpdate.hidden = false
            updateButton.hidden = false
        }
        
        if (isUpdate == true) {
            spinner.stopAnimating()
            timer.invalidate()
            timer = nil
            progressView.progress = 0
            progressView.hidden = true
            descriptionUpdate.hidden = true
            updateButton.hidden = true
            infoLabel.text = NSLocalizedString("UP_TO_DATE", comment: "information")
        }
        indicator += 1
    }
    
    func update() {
        LibraryAPI.sharedInstance.updateBox() { (result) -> () in
            print("installed")
        }
        descriptionUpdate.hidden = true
        updateButton.hidden = true
        progressView.hidden = false
        infoLabel.text = NSLocalizedString("UPDATE_LOADING", comment: "information")
        timer = NSTimer.scheduledTimerWithTimeInterval(0.25, target: self, selector: #selector(UpdateViewController.updateProgress), userInfo: nil, repeats: true)
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
