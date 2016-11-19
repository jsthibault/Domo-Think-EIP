//
//  ObjectViewController.swift
//  DomothinkIOS
//
//  Created by Guillaume Wehrling on 24/10/2015.
//  Copyright (c) 2015 DomoThink. All rights reserved.
//

import UIKit

let reuseIdentifierTable = "CellTable"

class DeviceViewController: UIViewController, UISearchResultsUpdating, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var deviceTableView: UITableView!
    
    @IBOutlet weak var menuBtn: UIBarButtonItem!
    
    @IBOutlet weak var emptyMessage: UILabel!
    
    private var allDevice = [Device]()
    private var filtredDevice = [Device]()
    
    private var resultSeachController = UISearchController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if self.revealViewController() != nil {
            menuBtn.target = self.revealViewController()
            menuBtn.action = "revealToggle:"
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
            emptyMessage.hidden = true
            
        }
        
        allDevice = LibraryAPI.sharedInstance.getDevice()
        
        // l'initialisation de SeachController avec un UISearchController vide
        self.resultSeachController = UISearchController(searchResultsController: nil)
        
        // Paramétrer le SeachController
        self.resultSeachController.searchResultsUpdater = self
        self.resultSeachController.dimsBackgroundDuringPresentation = false
        self.resultSeachController.searchBar.sizeToFit()
        
        // Ajout de SeachController au Header du tableView
        self.deviceTableView.tableHeaderView = self.resultSeachController.searchBar
        
        // Modifier le titre du notre SearchTableViewController
        self.title = "BPL Teams"
        
        // Actualisation du tableView
        self.deviceTableView.reloadData()


        // Do any additional setup after loading the view.
    }
    
    
    func updateSearchResultsForSearchController(searchController: UISearchController) {
        
        self.filtredDevice.removeAll(keepCapacity: false)
        println(searchController.searchBar.text)
        
        let searchPredicate = NSPredicate(format: "_name beginswith %@", searchController.searchBar.text)
        
        let array = (self.allDevice as NSArray).filteredArrayUsingPredicate(searchPredicate)
        
        self.filtredDevice = array as! [Device]
        //println(array)
        // Actualisation du tableView
        self.deviceTableView.reloadData()
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        // count of all directive
        var count: Int!
        // count of all directive
        if (resultSeachController.active) {
            count =  self.filtredDevice.count
        } else {
            count = self.allDevice.count;
        }
        if (count <= 0) {
            emptyMessage.hidden = false
        } else {
            emptyMessage.hidden = true
        }
        return count
    }
    
    func tableView(tableView: UITableView,
        cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell: ObjectCell = tableView.dequeueReusableCellWithIdentifier(reuseIdentifierTable, forIndexPath: indexPath) as! ObjectCell
        
        //add directive in the table view
        if (resultSeachController.active) {
            cell.labelCellTab.text = filtredDevice[indexPath.row]._name
            cell.switchCellTab.setOn(filtredDevice[indexPath.row]._isActive, animated: true)
            
            cell.switchCellTab.tag = indexPath.row
            cell.switchCellTab.addTarget(self, action: "switchOnOff:", forControlEvents: UIControlEvents.ValueChanged)
            
        } else {
            cell.labelCellTab.text = allDevice[indexPath.row]._name
            cell.switchCellTab.setOn(allDevice[indexPath.row]._isActive, animated: true)
            
            cell.switchCellTab.tag = indexPath.row
            cell.switchCellTab.addTarget(self, action: "switchOnOff:", forControlEvents: UIControlEvents.ValueChanged)
        }
        
        
        return cell
    }
    
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if (editingStyle == UITableViewCellEditingStyle.Delete) {
            
            // delete directive if recherche activer ou non
            if (resultSeachController.active) {
                //trouver une meilleure solution
                var tmp : Device!
                tmp = filtredDevice[indexPath.row]
                var i : Int!
                i = 0
                while (tmp != allDevice[i] && i < allDevice.count)
                {
                    i = i + 1
                }
                LibraryAPI.sharedInstance.deleteDevice(tmp._id, index: i)
                allDevice.removeAtIndex(i)
                
                filtredDevice.removeAtIndex(indexPath.row)
                
            } else {
                LibraryAPI.sharedInstance.deleteDevice(allDevice[indexPath.row]._id, index: indexPath.row)
                allDevice.removeAtIndex(indexPath.row)
                
            }
            
            self.deviceTableView.reloadData()
            
        }
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func switchOnOff(switchTab: UISwitch) {
        if (switchTab.on) {
            LibraryAPI.sharedInstance.setIsActiveDevice(allDevice[switchTab.tag], value: true)
        } else {
            LibraryAPI.sharedInstance.setIsActiveDevice(allDevice[switchTab.tag], value: false)
        }
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "formDevice" {
            let deviceDetailViewController = segue.destinationViewController as! FormDeviceViewController
            
            // Get the cell that generated this segue.
            if let selectedDeviceCell = sender as? ObjectCell {
                let indexPath = deviceTableView.indexPathForCell(selectedDeviceCell)!
                println("index = \(indexPath.row)")
                let selectedDevice: Device!
                if (resultSeachController.active) {
                    selectedDevice = filtredDevice[indexPath.row]
                } else {
                    selectedDevice = allDevice[indexPath.row]
                }
                deviceDetailViewController.device = selectedDevice
            }
        }
    }

    
    @IBAction func cancelToDeviceViewController(segue:UIStoryboardSegue) {
        allDevice = LibraryAPI.sharedInstance.getDevice()
        self.deviceTableView.reloadData()
    }
    
    @IBAction func saveToDeviceViewController(segue:UIStoryboardSegue) {
        if let FormObjetViewController = segue.sourceViewController as? FormDeviceViewController {
            if let device = FormObjetViewController.device {
                let updating = FormObjetViewController.updating
                
                
                if (updating == false) {
                   // LibraryAPI.sharedInstance.addDirective(directive, index: LibraryAPI.sharedInstance.countDirectives())
                    println("Ajout device : je ne marche pas")
                }
                else {
                    LibraryAPI.sharedInstance.updateDevice(device, id: device._id)
                }
                
            }
            allDevice = LibraryAPI.sharedInstance.getDevice()
            self.deviceTableView.reloadData()
        }
    }

}
