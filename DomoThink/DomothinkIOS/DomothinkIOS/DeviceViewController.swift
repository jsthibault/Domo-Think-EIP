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
    
    private var resultSeachController = UISearchController()
    
    private var allDevice = [Device]()
    private var filtredDevice = [Device]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        if (resultSeachController.active) {
            return self.filtredDevice.count
        } else {
            return self.allDevice.count;
        }
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
                allDevice.removeAtIndex(i)
                LibraryAPI.sharedInstance.deleteDevice(i)
                filtredDevice.removeAtIndex(indexPath.row)
                
            } else {
                allDevice.removeAtIndex(indexPath.row)
                LibraryAPI.sharedInstance.deleteDevice(indexPath.row)
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

}
