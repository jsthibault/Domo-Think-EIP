//
//  PluginInstallViewController.swift
//  DomothinkIOS
//
//  Created by Guillaume Wehrling on 06/12/2015.
//  Copyright (c) 2015 DomoThink. All rights reserved.
//

import UIKit

class PluginInstallViewController: UIViewController {

    @IBOutlet weak var imgPlugin: UIImageView!
    @IBOutlet weak var titlePlugin: UILabel!
    @IBOutlet weak var autorPlugin: UILabel!
    @IBOutlet weak var ratePlugin: UILabel!
    @IBOutlet weak var desPlugin: UITextView!
    
    @IBOutlet weak var installButton: UIButton!
    
    var pluginView: Plugin!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        imgPlugin.image = UIImage(named: pluginView._imgName)
        titlePlugin.text = pluginView._name
        autorPlugin.text = pluginView._author
        ratePlugin.text = NSString(format: "%.1f/5", pluginView._rate) as String
        desPlugin.text = pluginView._description
        
        installButton.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        
        if (pluginView._installed == true) {
            installButton.addTarget(self, action: "uninstallPlugin", forControlEvents: .TouchUpInside)
            installButton.setTitle("Désinstaller", forState: UIControlState.Normal)
            
        } else {
            installButton.addTarget(self, action: "installPlugin", forControlEvents: .TouchUpInside)
            installButton.setTitle("Installer", forState: UIControlState.Normal)
        }
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func installPlugin() {
        LibraryAPI.sharedInstance.installPlugin(pluginView, value: true)
        installButton.hidden = true
        self.performSegueWithIdentifier("returnToPlugin", sender: pluginView)
        /*installButton.setTitle("Désinstaller", forState: UIControlState.Normal)
        installButton.removeTarget(self, action: "installPlugin", forControlEvents: .TouchUpInside)
        installButton.addTarget(self, action: "uninstallPlugin", forControlEvents: .TouchUpInside)*/
    }
    
    func uninstallPlugin() {
        //LibraryAPI.sharedInstance.uninstallPlugin(pluginView, value: false)
        installButton.setTitle("installer", forState: UIControlState.Normal)
        installButton.removeTarget(self, action: "uninstallPlugin", forControlEvents: .TouchUpInside)
        installButton.addTarget(self, action: "installPlugin", forControlEvents: .TouchUpInside)
    }
}
