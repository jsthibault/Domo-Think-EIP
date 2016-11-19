//
//  PluginManagerViewController.swift
//  DomothinkIOS
//
//  Created by Guillaume Wehrling on 07/12/2015.
//  Copyright (c) 2015 DomoThink. All rights reserved.
//

import UIKit

let reuseIdentifierPluginManager = "PluginCell"

class PluginManagerViewController: UIViewController, UISearchResultsUpdating, UITableViewDataSource, UITableViewDelegate {

    private var allPlugins: [Plugin]!
    private var filtredPlugin: [Plugin]!
    
    @IBOutlet weak var menuBtn: UIBarButtonItem!

    @IBOutlet weak var pluginTableView: UITableView!
    
    private var resultSeachController = UISearchController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Gestion du bouton Menu
        if self.revealViewController() != nil {
            menuBtn.target = self.revealViewController()
            menuBtn.action = "revealToggle:"
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
            
        }

        //chargement de tout les plugins
        allPlugins = LibraryAPI.sharedInstance.getPlugins()
        
        // l'initialisation de SeachController avec un UISearchController vide
        self.resultSeachController = UISearchController(searchResultsController: nil)
        
        // Paramétrer le SeachController
        self.resultSeachController.searchResultsUpdater = self
        self.resultSeachController.dimsBackgroundDuringPresentation = false
        self.resultSeachController.searchBar.sizeToFit()
        
        // Ajout de SeachController au Header du tableView
        self.pluginTableView.tableHeaderView = self.resultSeachController.searchBar
        
        // Modifier le titre du notre SearchTableViewController
        self.title = "BPL Teams"
        
        // Actualisation du tableView
        self.pluginTableView.reloadData()
        
        
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        // count of all directive
            return self.allPlugins.count;
    }
    
    //Remplissage du tableau
    func tableView(tableView: UITableView,
        cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        
        let cell: PluginCell = tableView.dequeueReusableCellWithIdentifier(reuseIdentifierPluginManager, forIndexPath: indexPath) as! PluginCell
        //par recherche avec la barre de recherche
        if (resultSeachController.active) {
            cell.pluginTitle.text = filtredPlugin[indexPath.row]._name
            cell.pluginAuthor.text = filtredPlugin[indexPath.row]._author
            cell.pluginImg.image = UIImage(named: filtredPlugin[indexPath.row]._imgName)
            cell.pluginRate.text = NSString(format: "%.1f/5", filtredPlugin[indexPath.row]._rate) as String
            cell.pluginIndex.text = NSString(format: "%d", indexPath.row + 1) as String
        //sans la recherche
        } else {
            cell.pluginTitle.text = allPlugins[indexPath.row]._name
            cell.pluginAuthor.text = allPlugins[indexPath.row]._author
            cell.pluginImg.image = UIImage(named: allPlugins[indexPath.row]._imgName)
            cell.pluginRate.text = NSString(format: "%.1f/5", allPlugins[indexPath.row]._rate) as String
            cell.pluginIndex.text = NSString(format: "%d", indexPath.row + 1) as String
            
            cell.pluginActivate.setOn(allPlugins[indexPath.row]._isActive, animated: true)
            cell.pluginActivate.tag = indexPath.row
            cell.pluginActivate.addTarget(self, action: "switchOnOff:", forControlEvents: UIControlEvents.ValueChanged)
        }
        return cell
    }
    
        //update de la barre de recherche
        func updateSearchResultsForSearchController(searchController: UISearchController) {
            
            self.filtredPlugin.removeAll(keepCapacity: false)
            println(searchController.searchBar.text)
            
            let searchPredicate = NSPredicate(format: "_name beginswith %@", searchController.searchBar.text)
            
            let array = (self.allPlugins as NSArray).filteredArrayUsingPredicate(searchPredicate)
            
            self.filtredPlugin = array as! [Plugin]
            self.pluginTableView.reloadData()
        }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if (editingStyle == UITableViewCellEditingStyle.Delete) {
            
            // delete directive if recherche activer ou non
            if (resultSeachController.active) {
                //trouver une meilleure solution
                var tmp : Plugin!
                tmp = filtredPlugin[indexPath.row]
                var i : Int!
                i = 0
                while (tmp != allPlugins[i] && i < allPlugins.count)
                {
                    i = i + 1
                }
                LibraryAPI.sharedInstance.deleteDevice(tmp._id, index: i)
                allPlugins.removeAtIndex(i)
                
                filtredPlugin.removeAtIndex(indexPath.row)
                
            } else {
                LibraryAPI.sharedInstance.deletePlugin(allPlugins[indexPath.row]._id, index: indexPath.row)
                allPlugins.removeAtIndex(indexPath.row)
                
            }
            
            self.pluginTableView.reloadData()
            
        }
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //ON/OFF un plugin
    func switchOnOff(switchTab: UISwitch) {
        if (switchTab.on) {
            LibraryAPI.sharedInstance.setIsActivePlugin(allPlugins[switchTab.tag], value: true)
        } else {
            LibraryAPI.sharedInstance.setIsActivePlugin(allPlugins[switchTab.tag], value: false)
        }
    }
    
}
