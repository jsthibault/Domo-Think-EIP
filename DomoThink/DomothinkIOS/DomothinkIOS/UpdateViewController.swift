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
    private var timer: NSTimer!
    private var indicator = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        progressView.hidden = true
        descriptionUpdate.hidden = true
        updateButton.hidden = true
        spinner.hidesWhenStopped = true
        
        infoLabel.text = "Recherche de mise à jour..."
        spinner.startAnimating()
        descriptionUpdate.text = "Version: 1.6 \n\nBuild: 1.1.342.54\n\nNouveautés: At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat."
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
            infoLabel.text = "Nouvelle Mise à jour disponible !"
            descriptionUpdate.hidden = false
            updateButton.hidden = false
        }
        indicator += 1
    }
    
    func update() {
        descriptionUpdate.hidden = true
        updateButton.hidden = true
        progressView.hidden = false
        infoLabel.text = "instalation en cours..."
        timer = NSTimer.scheduledTimerWithTimeInterval(0.25, target: self, selector: "updateProgress", userInfo: nil, repeats: true)
    }
    
    func updateProgress() {
        if (progressView.progress == 1)
        {
            timer.invalidate()
            timer = nil
            progressView.progress = 0
            progressView.hidden = true
            infoLabel.text = "Mise à jour installée"
        }
        progressView.progress += 0.1
    }

}
