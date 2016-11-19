//
//  DirectiveViewController.swift
//  DomothinkIOS
//
//  Created by Guillaume Wehrling on 24/10/2015.
//  Copyright (c) 2015 DomoThink. All rights reserved.
//

import UIKit

let reuseIdentifierDirective = "DirectiveCellId"

class DirectiveViewController: UIViewController, UISearchResultsUpdating, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var emptyMessage: UILabel!
    @IBOutlet weak var tableViewObject: UITableView!
    
    @IBOutlet weak var menuBtn: UIBarButtonItem!
    
    private var resultSeachController = UISearchController()
    
    private var allDirective = [Directive]()
    private var filtredDirective = [Directive]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //gestion du Menu
        if self.revealViewController() != nil {
            menuBtn.target = self.revealViewController()
            menuBtn.action = "revealToggle:"
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
            emptyMessage.hidden = true
        }

        
        // get all the directive in data
        //println(NSDate())
        allDirective = LibraryAPI.sharedInstance.getDirectives()
        
        // l'initialisation de SeachController avec un UISearchController vide
        self.resultSeachController = UISearchController(searchResultsController: nil)
        
        // Paramétrer le SeachController
        self.resultSeachController.searchResultsUpdater = self
        self.resultSeachController.dimsBackgroundDuringPresentation = false
        self.resultSeachController.searchBar.sizeToFit()
        
        // Ajout de SeachController au Header du tableView
        self.tableViewObject.tableHeaderView = self.resultSeachController.searchBar
        
        // Modifier le titre du notre SearchTableViewController
        self.title = "BPL Teams"
        
        // Actualisation du tableView
        self.tableViewObject.reloadData()
        
    }

    func updateSearchResultsForSearchController(searchController: UISearchController) {
        
        self.filtredDirective.removeAll(keepCapacity: false)
        println(searchController.searchBar.text)
        
        let searchPredicate = NSPredicate(format: "_title beginswith %@", searchController.searchBar.text)
        
        let array = (self.allDirective as NSArray).filteredArrayUsingPredicate(searchPredicate)
        
        self.filtredDirective = array as! [Directive]
        //println(array)
        // Actualisation du tableView
        self.tableViewObject.reloadData()
        
        

        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        var count: Int!
        // count of all directive
        if (resultSeachController.active) {
            count =  self.filtredDirective.count
        } else {
            count = self.allDirective.count;
        }
        if (count <= 0) {
            emptyMessage.hidden = false
        } else {
            emptyMessage.hidden = true
        }
        return count
    }
    
    //add all directive in the table view
    func tableView(tableView: UITableView,
        cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        
        let cell: DirectiveCell = tableView.dequeueReusableCellWithIdentifier(reuseIdentifierDirective, forIndexPath: indexPath) as! DirectiveCell
        //add directive in the table view
        if (resultSeachController.active) {
            cell.labelText.text = filtredDirective[indexPath.row]._title
            cell.switchTab.setOn(filtredDirective[indexPath.row]._isActive, animated: true)
            
            cell.switchTab.tag = indexPath.row
            cell.switchTab.addTarget(self, action: "switchOnOff:", forControlEvents: UIControlEvents.ValueChanged)
            
            //format date to hour and minutes (a changer pour une date complete a voir)
            var dateFormatter = NSDateFormatter()
            dateFormatter.dateFormat = "hh:mm"
            
            cell.dateLabel.text = dateFormatter.stringFromDate(filtredDirective[indexPath.row]._dateApply)
        } else {
            cell.labelText.text = allDirective[indexPath.row]._title
            cell.switchTab.setOn(allDirective[indexPath.row]._isActive, animated: true)
            
            cell.switchTab.tag = indexPath.row
            cell.switchTab.addTarget(self, action: "switchOnOff:", forControlEvents: UIControlEvents.ValueChanged)
            
            //format date to hour and minutes (a changer pour une date complete a voir)
            var dateFormatter = NSDateFormatter()
            dateFormatter.dateFormat = "hh:mm"
            
            cell.dateLabel.text = dateFormatter.stringFromDate(allDirective[indexPath.row]._dateApply)
            
        }
        
        
        return cell
    }
    
    
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    //remove a directive
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if (editingStyle == UITableViewCellEditingStyle.Delete) {
            
            // delete directive if recherche activer ou non
            if (resultSeachController.active) {
                //trouver une meilleure solution
                var tmp : Directive!
                tmp = filtredDirective[indexPath.row]
                var i : Int!
                i = 0
                while (tmp != allDirective[i] && i < allDirective.count)
                {
                    i = i + 1
                }
                
                LibraryAPI.sharedInstance.deleteDirective(tmp._id, index: i)
                allDirective.removeAtIndex(i)
                filtredDirective.removeAtIndex(indexPath.row)
                
            } else {
                LibraryAPI.sharedInstance.deleteDirective(allDirective[indexPath.row]._id, index: indexPath.row)
                allDirective.removeAtIndex(indexPath.row)
            }
            
            self.tableViewObject.reloadData()
            
        }
    }
    //add or edit a directive
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "editDir" {
            let directiveDetailViewController = segue.destinationViewController as! AddDirectiveViewController
            
            // Get the cell that generated this segue.
            if let selectedDirectiveCell = sender as? DirectiveCell {
                let indexPath = tableViewObject.indexPathForCell(selectedDirectiveCell)!
                println("index = \(indexPath.row)")
                let selectedDirective: Directive!
                if (resultSeachController.active) {
                    selectedDirective = filtredDirective[indexPath.row]
                } else {
                    selectedDirective = allDirective[indexPath.row]
                }
                println(selectedDirective._title)
                directiveDetailViewController.directive = selectedDirective
            }
        }
        else if segue.identifier == "addDir" {
            print("Adding new directive.")
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func switchOnOff(switchTab: UISwitch) {
        if (switchTab.on) {
            LibraryAPI.sharedInstance.setIsActive(allDirective[switchTab.tag], value: true)
        } else {
            LibraryAPI.sharedInstance.setIsActive(allDirective[switchTab.tag], value: false)
        }
        
    }
    
    @IBAction func cancelToDirectiveViewController(segue:UIStoryboardSegue) {
    }
    
    
    @IBAction func saveToDirectiveViewController(segue:UIStoryboardSegue) {
        if let addDirectiveViewController = segue.sourceViewController as? AddDirectiveViewController {
            if let directive = addDirectiveViewController.directive {
                let updating = addDirectiveViewController.updating
                
                
                if (updating == false) {
                    LibraryAPI.sharedInstance.addDirective(directive, index: LibraryAPI.sharedInstance.countDirectives())
                }
                else {
                    LibraryAPI.sharedInstance.updateDirective(directive, id: directive._id)
                }
                
            }
            allDirective = LibraryAPI.sharedInstance.getDirectives()
            self.tableViewObject.reloadData()
        }
    }
    
}
