//
//  PluginListViewController.swift
//  
//
//  Created by Guillaume Wehrling on 07/10/2016.
//
//

import UIKit

class PluginListViewController: UIViewController, UISearchResultsUpdating, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var menuBtn: UIBarButtonItem!
    @IBOutlet weak var pluginListView: UITableView!
    @IBOutlet weak var emptyMessage: UILabel!
    private var filteredPlugins = [Plugin]()
    private var allPlugins = [Plugin]()
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
        LibraryAPI.sharedInstance.getPlugins() { (result) -> () in
            self.allPlugins = result
            self.pluginListView.reloadData()

        // Do any additional setup after loading the view.
        }
    }
    
    func updateSearchResultsForSearchController(searchController: UISearchController) {
        self.filteredPlugins.removeAll(keepCapacity: false)
        let searchPredicate = NSPredicate(format: "getName beginswith %@", searchController.searchBar.text!)
        let array = (self.allPlugins as NSArray).filteredArrayUsingPredicate(searchPredicate)
        self.filteredPlugins = array as! [Plugin]
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
        let cell: PluginTableViewCell = tableView.dequeueReusableCellWithIdentifier("pluginCell", forIndexPath: indexPath) as! PluginTableViewCell
        
        //add directive in the table view
        if (resultSeachController.active) {
            print("le plugin : " + filteredPlugins[indexPath.row].getName(), terminator: "")
            
            cell.pluginName.text = filteredPlugins[indexPath.row].getName()
            //cell.directiveStatus.setOn(filteredDirective[indexPath.row].getStatus(), animated: true)
            cell.pluginStatus.setOn(true, animated: true)
            
            cell.pluginStatus.tag = indexPath.row
            cell.pluginStatus.addTarget(self, action: #selector(PluginListViewController.switchOnOff(_:)), forControlEvents: UIControlEvents.ValueChanged)
            
        } else {
            cell.pluginName.text = allPlugins[indexPath.row].getName()
            //cell.directiveStatus.setOn(allDirectives[indexPath.row].getStatus(), animated: true)
            cell.pluginStatus.setOn(true, animated: true)

            cell.pluginStatus.tag = indexPath.row
            cell.pluginStatus.addTarget(self, action: #selector(PluginListViewController.switchOnOff(_:)), forControlEvents: UIControlEvents.ValueChanged)
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
                LibraryAPI.sharedInstance.deleteDevice(filteredPlugins[indexPath.row].getId())  { (result) -> () in
                    print("device bien supprimer", terminator: "")
                    self.pluginListView.reloadData()
                }
                
            } else {
                LibraryAPI.sharedInstance.deleteDevice(allPlugins[indexPath.row].getId())  { (result) -> () in
                    print("device bien supprimer", terminator: "")
                    self.pluginListView.reloadData()
                }
                
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func switchOnOff(switchTab: UISwitch) {
        print("je change le status mais ca marche pas encore", terminator: "")
    }


}
