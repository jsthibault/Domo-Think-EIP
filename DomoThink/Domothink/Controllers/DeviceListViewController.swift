//
//  DeviceListViewController.swift
//  
//
//  Created by Guillaume Wehrling on 07/10/2016.
//
//

import UIKit

class DeviceListViewController: UIViewController, UISearchResultsUpdating, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var deviceListView: UITableView!
    private var allDevice = [Device]()
    private var filteredDevice = [Device]()
    private var resultSeachController = UISearchController()
    @IBOutlet weak var emptyMessage: UILabel!
    @IBOutlet weak var menuBtn: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if self.revealViewController() != nil {
            menuBtn.target = self.revealViewController()
            menuBtn.action = #selector(SWRevealViewController.revealToggle(_:))
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
            
        }
        
        // l'initialisation de SeachController avec un UISearchController vide
        self.resultSeachController = UISearchController(searchResultsController: nil)
        
        // Paramétrer le SeachController
        self.resultSeachController.searchResultsUpdater = self
        self.resultSeachController.dimsBackgroundDuringPresentation = false
        self.resultSeachController.searchBar.sizeToFit()
        
        // Ajout de SeachController au Header du tableView
        self.deviceListView.tableHeaderView = self.resultSeachController.searchBar
        
        // Modifier le titre du notre SearchTableViewController
        self.title = "Device Search"
        
        // Actualisation du tableView
        self.deviceListView.reloadData()
        
        emptyMessage.hidden = true
        LibraryAPI.sharedInstance.getDevices() { (result) -> () in
                self.allDevice = result
            self.deviceListView.reloadData()
        }
    }
    
    func updateSearchResultsForSearchController(searchController: UISearchController) {
        self.filteredDevice.removeAll(keepCapacity: false)
        let searchPredicate = NSPredicate(format: "getName beginswith %@", searchController.searchBar.text!)
        let array = (self.allDevice as NSArray).filteredArrayUsingPredicate(searchPredicate)
        self.filteredDevice = array as! [Device]
        self.deviceListView.reloadData()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        var count: Int!
        if (resultSeachController.active) {
            count =  self.filteredDevice.count
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
        let cell: DeviceTableViewCell = tableView.dequeueReusableCellWithIdentifier("deviceCell", forIndexPath: indexPath) as! DeviceTableViewCell
        
        //add directive in the table view
        if (resultSeachController.active) {
//            cell.deviceName.text = filteredDevice[indexPath.row].getName()
//            cell.deviceStatus.setOn(filteredDevice[indexPath.row].getStatus(), animated: true)
//            
//            cell.deviceStatus.tag = indexPath.row
//            cell.deviceStatus.addTarget(self, action: #selector(DeviceListViewController.switchOnOff(_:)), forControlEvents: UIControlEvents.ValueChanged)
            
        } else {
//            cell.deviceName.text = allDevice[indexPath.row].getName()
//            cell.deviceStatus.setOn(allDevice[indexPath.row].getStatus(), animated: true)
//            
//            cell.deviceStatus.tag = indexPath.row
//            cell.deviceStatus.addTarget(self, action: #selector(DeviceListViewController.switchOnOff(_:)), forControlEvents: UIControlEvents.ValueChanged)
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
                LibraryAPI.sharedInstance.deleteDevice(filteredDevice[indexPath.row].getId())  { (result) -> () in
                        print("device bien supprimer", terminator: "")
                        self.deviceListView.reloadData()
                    }
                
            } else {
                LibraryAPI.sharedInstance.deleteDevice(allDevice[indexPath.row].getId())  { (result) -> () in
                    print("device bien supprimer", terminator: "")
                    self.deviceListView.reloadData()
                }
                
            }
        }
    }
    
    @IBAction func unwindToListDevice(segue: UIStoryboardSegue) {}

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func switchOnOff(switchTab: UISwitch) {
        print("je change le status mais ca marche pas encore", terminator: "")
    }
}
