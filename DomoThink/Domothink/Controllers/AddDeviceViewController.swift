//
//  AddDeviceViewController.swift
//  Domothink
//
//  Created by Guillaume Wehrling on 12/11/2016.
//  Copyright © 2016 DomoThink. All rights reserved.
//

import UIKit

class AddDeviceViewController: UIViewController {

    @IBOutlet weak var deviceView: UITableView!
    @IBOutlet weak var buttonSearch: UIButton!
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    @IBOutlet weak var infoLabel: UILabel!
    private var indicator = 0;
    private var timer: NSTimer!
    private var allDevice = [Device]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        infoLabel.hidden = true
        deviceView.hidden = true
        spinner.hidesWhenStopped = true
        buttonSearch.addTarget(self, action: #selector(AddDeviceViewController.startReasearch), forControlEvents: .TouchUpInside)
        
        
        
        // Do any additional setup after loading the view.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        // count of all directive
        return self.allDevice.count;
    }
    
    func tableView(tableView: UITableView,
                   cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell: DeviceTableViewCell = tableView.dequeueReusableCellWithIdentifier("deviceTableCell", forIndexPath: indexPath) as! DeviceTableViewCell
        
        //add directive in the table view
        cell.deviceName.text = allDevice[indexPath.row].getName()
        
        return cell
    }
    
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func searching() {
        if (indicator == 6)
        {
            spinner.stopAnimating()
            buttonSearch.hidden = true
            timer.invalidate()
            indicator = 0

            deviceView.hidden = false
            self.deviceView.reloadData()
            
        }
        indicator += 1
    }
    
    
    func startReasearch() {
        infoLabel.text = "recherche d'object...."
        spinner.startAnimating()
        timer = NSTimer.scheduledTimerWithTimeInterval(0.25, target: self, selector: #selector(AddDeviceViewController.searching), userInfo: nil, repeats: true)
    }

}
