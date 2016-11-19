//
//  ObjectSearchViewController.swift
//  DomothinkIOS
//
//  Created by Guillaume Wehrling on 28/10/2015.
//  Copyright (c) 2015 DomoThink. All rights reserved.
//

import UIKit

let reuseIdentifierDeviceToInstall = "DeviceToInstalCell"

class ObjectSearchViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    
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
        buttonSearch.addTarget(self, action: "startReasearch", forControlEvents: .TouchUpInside)
        
        
        
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
        let cell: DeviceToInstallCell = tableView.dequeueReusableCellWithIdentifier(reuseIdentifierDeviceToInstall, forIndexPath: indexPath) as! DeviceToInstallCell
        
        //add directive in the table view
            cell.title.text = allDevice[indexPath.row]._name
        
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
            var sendRequest = HttpRequest()
            
            let jsonResult:NSMutableArray = sendRequest.getRequest("http://localhost:8080/api/installDevice")
            
            for device in (jsonResult as NSArray) {
                var activate: Bool!
                if (device["state"]!!.integerValue == 1) {
                    activate = true
                }
                else {
                    activate = false
                }
                var tmp = Device(id: device["id"]!!.integerValue, name: device["name"] as! String, isActive: activate, description: device["description"] as! String)
                allDevice.append(tmp)
                
            }
            deviceView.hidden = false
            self.deviceView.reloadData()
            
        }
        println("indicator : \(indicator)")
        indicator += 1
    }

    
    func startReasearch() {
        infoLabel.text = "recherche d'object...."
        spinner.startAnimating()
        timer = NSTimer.scheduledTimerWithTimeInterval(0.25, target: self, selector: "searching", userInfo: nil, repeats: true)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "deviceInfo" {
            let addDeviceViewController = segue.destinationViewController as! AddDeviceViewController
            
            // Get the cell that generated this segue.
            if let selectedDeviceCell = sender as? DeviceToInstallCell {
                let indexPath = deviceView.indexPathForCell(selectedDeviceCell)!
                println("index = \(indexPath.row)")
                let selectedDevice: Device!
                
                selectedDevice = allDevice[indexPath.row]
               
                println(selectedDevice._name)
                addDeviceViewController.device = selectedDevice
            }
        }
    }
    
    @IBAction func cancelToDeviceInstallViewController(segue:UIStoryboardSegue) {
    }
    
    
    @IBAction func saveToDeviceInstallViewController(segue:UIStoryboardSegue) {
        if let addDeviceViewController = segue.sourceViewController as? AddDeviceViewController {
            if let device = addDeviceViewController.device {
                
                
                
                    device._id = LibraryAPI.sharedInstance.gethighestIdDevice() + 1
                    LibraryAPI.sharedInstance.addDevice(device, index: LibraryAPI.sharedInstance.countDevices())
                
            }

        }
    }
    
}
