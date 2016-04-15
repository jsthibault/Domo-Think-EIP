//
//  ObjectSearchViewController.swift
//  DomothinkIOS
//
//  Created by Guillaume Wehrling on 28/10/2015.
//  Copyright (c) 2015 DomoThink. All rights reserved.
//

import UIKit

class ObjectSearchViewController: UIViewController {

    
    @IBOutlet weak var buttonSearch: UIButton!
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    @IBOutlet weak var infoLabel: UILabel!
    private var indicator = 0;
    private var timer: NSTimer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        infoLabel.hidden = true
        spinner.hidesWhenStopped = true
        buttonSearch.addTarget(self, action: "startReasearch", forControlEvents: .TouchUpInside)
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func searching() {
        if (indicator == 6)
        {
            spinner.stopAnimating()
            infoLabel.text = "pas d'object à proximité"
            infoLabel.hidden = false
            timer.invalidate()
            indicator = 0
        }
        println("indicator : \(indicator)")
        indicator += 1
    }

    
    func startReasearch() {
        infoLabel.text = "recherche d'object...."
        spinner.startAnimating()
        timer = NSTimer.scheduledTimerWithTimeInterval(0.25, target: self, selector: "searching", userInfo: nil, repeats: true)
    }
    
}
