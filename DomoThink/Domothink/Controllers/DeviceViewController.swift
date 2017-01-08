//
//  TestViewController.swift
//  Domothink
//
//  Created by Guillaume Wehrling on 27/11/2016.
//  Copyright © 2016 DomoThink. All rights reserved.
//

import UIKit

class DeviceViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var menuBtn: UIBarButtonItem!
    var roomSelected: String!
    var tableData = [UIColor.redColor(), UIColor.blueColor()]
    @IBOutlet weak var tableView: UITableView!
    
    private var allDevice = [Device]()
    
    var deviceSort = [Device]()
    
    @IBOutlet weak var roomListSegmented: UISegmentedControl!
    
    @IBAction func onRoomChanged(sender: AnyObject) {
        switch roomListSegmented.selectedSegmentIndex
        {
        case 0:
            roomSelected = "bathRoom";
        case 1:
            roomSelected = "bedRoom";
        case 2:
            roomSelected = "livingRoom";
        case 3:
            roomSelected = "kitchen";
        case 4:
            roomSelected = "corridor";
        case 5:
            roomSelected = "garage";
        case 6:
            roomSelected = "garden";
        default:
            break;
        }
        
        changeCollectionItems();
    }
    
    func changeCollectionItems() {
        deviceSort.removeAll()
        for device in allDevice {
            if (device.getRoomType() == roomSelected || device.getRoomType() == "all") {
                deviceSort.append(device)
            }
        }
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //tableView.backgroundColor = UIColor.init(red: 18/255, green: 135/255, blue: 223/255, alpha: 0.1)
        
        if self.revealViewController() != nil {
            menuBtn.target = self.revealViewController()
            menuBtn.action = #selector(SWRevealViewController.revealToggle(_:))
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
            
        }
        
        roomSelected = "bathRoom"
        loadData()
        // Do any additional setup after loading the view.
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadData() {
        LibraryAPI.sharedInstance.getDevices() { (result) -> () in
            self.allDevice = result
            self.changeCollectionItems()
        }
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return deviceSort.count
    }
    
    //remplir la vue
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell: DeviceTableViewCell!
        
        let device = deviceSort[indexPath.row]
        
        switch device.getType() {
        case "light":
            print("je passe dans light")
            let lightCell: LightTableViewCell =  tableView.dequeueReusableCellWithIdentifier("lightCell", forIndexPath: indexPath) as! LightTableViewCell
            lightCell.lightSwitch.on = device.getStatus()
            lightCell.lightSwitch.tag = indexPath.row
            lightCell.lightSwitch.addTarget(self, action: #selector(DeviceListViewController.switchOnOff(_:)), forControlEvents: UIControlEvents.ValueChanged)
            //lightCell.backgroundColor = UIColor.yellowColor()
            cell = lightCell
        case "thermometer":
            let thermoCell: ThermometerTableViewCell = tableView.dequeueReusableCellWithIdentifier("termoCell", forIndexPath: indexPath) as! ThermometerTableViewCell
            thermoCell.temperature.text = "21°C"
            //thermoCell.backgroundColor = UIColor.blueColor()
            cell = thermoCell
            print("je passe dans thermo")
        case "TV":
            let tvCell: TVTableViewCell = tableView.dequeueReusableCellWithIdentifier("TVCell", forIndexPath: indexPath) as! TVTableViewCell
            tvCell.tvSwitch.on = device.getStatus()
            tvCell.tvSwitch.tag = indexPath.row
            tvCell.tvSwitch.addTarget(self, action: #selector(DeviceListViewController.switchOnOff(_:)), forControlEvents: UIControlEvents.ValueChanged)
            cell = tvCell
            print("je passe dans thermo")
        case "HomeSecured":
            let homeSecuredCell: HomeSecuredTableViewCell = tableView.dequeueReusableCellWithIdentifier("HomeSecuredCell", forIndexPath: indexPath) as! HomeSecuredTableViewCell
            homeSecuredCell.homeLock.on = device.getStatus()
            homeSecuredCell.homeLock.tag = indexPath.row
            homeSecuredCell.homeLock.addTarget(self, action: #selector(DeviceListViewController.switchOnOff(_:)), forControlEvents: UIControlEvents.ValueChanged)
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
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if (editingStyle == UITableViewCellEditingStyle.Delete) {
             // delete directive if recherche activer ou non
            if (deviceSort[indexPath.row].getId() != -1) {
                LibraryAPI.sharedInstance.deleteDevice(deviceSort[indexPath.row].getId())  { (result) -> () in
                    print("device bien supprimer", terminator: "")
                    self.loadData()
                }
            }
            
        }
    }

    @IBAction func unwindToListDevice(segue: UIStoryboardSegue) {}
    
    func switchOnOff(switchTab: UISwitch) {
        print("je change le status mais ca marche pas encore", terminator: "")
    }
    
    
}

