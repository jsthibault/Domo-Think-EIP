//
//  AllStoreViewController.swift
//  Domothink
//
//  Created by Guillaume Wehrling on 11/11/2016.
//  Copyright © 2016 DomoThink. All rights reserved.
//

import UIKit

class AllStoreViewController: UIViewController, UISearchResultsUpdating, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var menuBtn: UIBarButtonItem!
    @IBOutlet weak var emptyMessage: UILabel!
    @IBOutlet weak var pluginListView: UITableView!
    
    private var filteredPlugins = [StorePlugin]()
    private var allPlugins = [StorePlugin]()
    private var resultSeachController = UISearchController()
    
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
        self.pluginListView.tableHeaderView = self.resultSeachController.searchBar
        
        // Modifier le titre du notre SearchTableViewController
        self.title = "Plugin Search"
        
        // Actualisation du tableView
        self.pluginListView.reloadData()
        
        emptyMessage.hidden = true
        LibraryAPI.sharedInstance.getStore() { (result) -> () in
            self.allPlugins = result
            self.pluginListView.reloadData()
        }
    }
    
    
    func updateSearchResultsForSearchController(searchController: UISearchController) {
        self.filteredPlugins.removeAll(keepCapacity: false)
        let searchPredicate = NSPredicate(format: "getName beginswith %@", searchController.searchBar.text!)
        let array = (self.allPlugins as NSArray).filteredArrayUsingPredicate(searchPredicate)
        self.filteredPlugins = array as! [StorePlugin]
        self.pluginListView.reloadData()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        var count: Int!
        if (resultSeachController.active) {
            count =  self.filteredPlugins.count
        } else {
            count = self.allPlugins.count;
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
        let cell: StoreTableViewCell = tableView.dequeueReusableCellWithIdentifier("AllPluginCell", forIndexPath: indexPath) as! StoreTableViewCell
        
        //add plugin in the table view
        if (resultSeachController.active) {
            cell.titlePlugin.text = filteredPlugins[indexPath.row].getName()
            cell.ratePlugin.text = String(filteredPlugins[indexPath.row].getRate()) + "/5"
            cell.datePlugin.text = filteredPlugins[indexPath.row].getDate()
            
        } else {
            cell.titlePlugin.text = allPlugins[indexPath.row].getName()
            cell.ratePlugin.text = String(allPlugins[indexPath.row].getRate()) + "/5"
            cell.datePlugin.text = allPlugins[indexPath.row].getDate()
        }
        cell.imgPlugin.image = UIImage(named: "plugin")
        return cell
    }
    
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
