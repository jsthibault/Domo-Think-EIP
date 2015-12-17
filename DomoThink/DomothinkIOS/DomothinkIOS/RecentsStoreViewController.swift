//
//  RecentsStoreViewController.swift
//  DomothinkIOS
//
//  Created by Guillaume Wehrling on 20/11/2015.
//  Copyright (c) 2015 DomoThink. All rights reserved.
//

import UIKit

let reuseIdentifierPlugin = "PluginCell"

class RecentsStoreViewController: UIViewController, UISearchResultsUpdating, UITableViewDataSource, UITableViewDelegate {
    

    @IBOutlet weak var recentTableView: UITableView!
    
    private var allPlugin = [Plugin]()
    private var filtredPlugin = [Plugin]()
    
    private var resultSeachController = UISearchController()
    
    private var indexSelected: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        indexSelected = -1
        
        allPlugin = LibraryAPI.sharedInstance.getPlugins()
        
        // l'initialisation de SeachController avec un UISearchController vide
        self.resultSeachController = UISearchController(searchResultsController: nil)
        
        // Paramétrer le SeachController
        self.resultSeachController.searchResultsUpdater = self
        self.resultSeachController.dimsBackgroundDuringPresentation = false
        self.resultSeachController.searchBar.sizeToFit()
        
        // Ajout de SeachController au Header du tableView
        self.recentTableView.tableHeaderView = self.resultSeachController.searchBar
        
        // Modifier le titre du notre SearchTableViewController
        self.title = "BPL Teams"
        
        // Actualisation du tableView
        self.recentTableView.reloadData()

        // Do any additional setup after loading the view.
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        // count of all directive
        if (resultSeachController.active) {
            return self.filtredPlugin.count
        } else {
            return self.allPlugin.count;
        }

    }
    
    func updateSearchResultsForSearchController(searchController: UISearchController) {
        
        self.filtredPlugin.removeAll(keepCapacity: false)
        println(searchController.searchBar.text)
        
        let searchPredicate = NSPredicate(format: "_name beginswith %@", searchController.searchBar.text)
        
        let array = (self.allPlugin as NSArray).filteredArrayUsingPredicate(searchPredicate)
        
        self.filtredPlugin = array as! [Plugin]
        //println(array)
        // Actualisation du tableView
        self.recentTableView.reloadData()
        
    }
    
    func tableView(tableView: UITableView,
        cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        
        let cell: PluginCell = tableView.dequeueReusableCellWithIdentifier(reuseIdentifierPlugin, forIndexPath: indexPath) as! PluginCell
        
        //add directive in the table view
        if (resultSeachController.active) {
            cell.pluginTitle.text = filtredPlugin[indexPath.row]._name
            cell.pluginAutor.text = filtredPlugin[indexPath.row]._autor
            cell.pluginImg.image = UIImage(named: filtredPlugin[indexPath.row]._imgName)
            cell.pluginRate.text = NSString(format: "%.1f/5", filtredPlugin[indexPath.row]._rate) as String
            cell.pluginIndex.text = NSString(format: "%d", indexPath.row + 1) as String
        } else {
            cell.pluginTitle.text = allPlugin[indexPath.row]._name
            cell.pluginAutor.text = allPlugin[indexPath.row]._autor
            cell.pluginImg.image = UIImage(named: allPlugin[indexPath.row]._imgName)
            cell.pluginRate.text = NSString(format: "%.1f/5", allPlugin[indexPath.row]._rate) as String
            cell.pluginIndex.text = NSString(format: "%d", indexPath.row + 1) as String
        }

        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        indexSelected = indexPath.row
        self.performSegueWithIdentifier("viewPlugin", sender: self)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if(segue.identifier == "viewPlugin") {
            
            var pluginInstallViewController = (segue.destinationViewController as! PluginInstallViewController)
            
            if (resultSeachController.active) {
                pluginInstallViewController.pluginView = filtredPlugin[indexSelected]
            } else {
                pluginInstallViewController.pluginView = allPlugin[indexSelected]
            }
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}