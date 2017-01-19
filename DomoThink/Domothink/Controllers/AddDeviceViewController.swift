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
        var cell: DeviceTableViewCell!
        
        let device = allDevice[indexPath.row]
        
        switch device.getType() {
        case "light":
            print("je passe dans light")
            let lightCell: LightTableViewCell =  tableView.dequeueReusableCellWithIdentifier("lightCell", forIndexPath: indexPath) as! LightTableViewCell
            lightCell.lightSwitch.on = device.getStatus()
            lightCell.lightSwitch.tag = indexPath.row
            lightCell.lightSwitch.addTarget(self, action: #selector(AddDeviceViewController.installDevice(_:)), forControlEvents: UIControlEvents.ValueChanged)
            //lightCell.backgroundColor = UIColor.yellowColor()
            cell = lightCell
        case "TV":
            let tvCell: TVTableViewCell = tableView.dequeueReusableCellWithIdentifier("TVCell", forIndexPath: indexPath) as! TVTableViewCell
            tvCell.tvSwitch.on = device.getStatus()
            tvCell.tvSwitch.tag = indexPath.row
            tvCell.tvSwitch.addTarget(self, action: #selector(AddDeviceViewController.installDevice(_:)), forControlEvents: UIControlEvents.ValueChanged)
            cell = tvCell
            print("je passe dans thermo")
        case "HomeSecured":
            let homeSecuredCell: HomeSecuredTableViewCell = tableView.dequeueReusableCellWithIdentifier("HomeSecuredCell", forIndexPath: indexPath) as! HomeSecuredTableViewCell
            homeSecuredCell.homeLock.on = device.getStatus()
            homeSecuredCell.homeLock.tag = indexPath.row
            homeSecuredCell.homeLock.addTarget(self, action: #selector(AddDeviceViewController.installDevice(_:)), forControlEvents: UIControlEvents.ValueChanged)
            cell = homeSecuredCell
            print("je passe dans homesecured")
        default:
            let addDeviceCell: AddDeviceTableViewCell = tableView.dequeueReusableCellWithIdentifier("OtherCell", forIndexPath: indexPath) as! AddDeviceTableViewCell
            addDeviceCell.infoCell.text = device.getDesc()
            cell = addDeviceCell
            print("je passe dans default")
        }
        cell!.icon.image = UIImage(named: device.getImgName())
        cell!.deviceName.text = device.getName()
        if (indexPath.row % 2 != 0) {
            cell.backgroundColor = UIColor.init(red: 18/255, green: 135/255, blue: 223/255, alpha: 0.1)
        } else {
            cell.backgroundColor = UIColor.init(red: 246/255, green: 246/255, blue: 246/255, alpha: 0.1)
        }
        
        
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
        LibraryAPI.sharedInstance.scanDevices() { (result) -> () in
            self.allDevice = result
            self.spinner.stopAnimating()
            self.buttonSearch.hidden = true
            self.timer.invalidate()
            
            self.deviceView.hidden = false
            self.deviceView.reloadData()

        }
    }
    
    
    func startReasearch() {
        infoLabel.text = "recherche d'object...."
        spinner.startAnimating()
        timer = NSTimer.scheduledTimerWithTimeInterval(0.25, target: self, selector: #selector(AddDeviceViewController.searching), userInfo: nil, repeats: true)
    }
    
    func installDevice(switchTab: UISwitch) {
        let deviceTmp = allDevice[switchTab.tag]
        LibraryAPI.sharedInstance.addDevice(deviceTmp.getName(), desc: deviceTmp.getDesc(), status: Int(deviceTmp.getStatus()), protocole: deviceTmp.getProtocole()) { (result) -> () in
            
        }
    }

}
