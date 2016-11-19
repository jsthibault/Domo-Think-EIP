//
//  DirectiveListViewController.swift
//  
//
//  Created by Guillaume Wehrling on 07/10/2016.
//
//

import UIKit

class DirectiveListViewController: UIViewController, UISearchResultsUpdating, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var menuBtn: UIBarButtonItem!
    @IBOutlet weak var emptyMessage: UILabel!
    @IBOutlet weak var directiveListView: UITableView!
    private var filteredDirective = [Directive]()
    private var allDirectives = [Directive]()
    private var resultSeachController = UISearchController()
    
    private var directive: Directive!
    
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
        self.directiveListView.tableHeaderView = self.resultSeachController.searchBar
        
        // Modifier le titre du notre SearchTableViewController
        self.title = "Directive Search"
        
        // Actualisation du tableView
        self.directiveListView.reloadData()
        
        emptyMessage.hidden = true
        LibraryAPI.sharedInstance.getDirectives() { (result) -> () in
            self.allDirectives = result
            self.directiveListView.reloadData()
        }
    }
    
    
    func updateSearchResultsForSearchController(searchController: UISearchController) {
        self.filteredDirective.removeAll(keepCapacity: false)
        let searchPredicate = NSPredicate(format: "getName beginswith %@", searchController.searchBar.text!)
        let array = (self.allDirectives as NSArray).filteredArrayUsingPredicate(searchPredicate)
        self.filteredDirective = array as! [Directive]
        self.directiveListView.reloadData()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        var count: Int!
        if (resultSeachController.active) {
            count =  self.filteredDirective.count
        } else {
            count = self.allDirectives.count;
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
        let cell: DirectiveTableViewCell = tableView.dequeueReusableCellWithIdentifier("directiveCell", forIndexPath: indexPath) as! DirectiveTableViewCell
        
        //add directive in the table view
        if (resultSeachController.active) {
            cell.directiveName.text = filteredDirective[indexPath.row].getName()
            //cell.directiveStatus.setOn(filteredDirective[indexPath.row].getStatus(), animated: true)
            cell.directiveStatus.setOn(true, animated: true)
            cell.directiveDate.text = LibraryAPI.sharedInstance.dateFormatter(String(NSDate()))
            
            cell.directiveStatus.tag = indexPath.row
            cell.directiveStatus.addTarget(self, action: #selector(DirectiveListViewController.switchOnOff(_:)), forControlEvents: UIControlEvents.ValueChanged)
            
        } else {
            cell.directiveName.text = allDirectives[indexPath.row].getName()
            //cell.directiveStatus.setOn(allDirectives[indexPath.row].getStatus(), animated: true)
            cell.directiveStatus.setOn(true, animated: true)
            cell.directiveDate.text = LibraryAPI.sharedInstance.dateFormatter(String(NSDate()))
            
            cell.directiveStatus.tag = indexPath.row
            cell.directiveStatus.addTarget(self, action: #selector(DirectiveListViewController.switchOnOff(_:)), forControlEvents: UIControlEvents.ValueChanged)
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
                LibraryAPI.sharedInstance.deleteDevice(filteredDirective[indexPath.row].getId())  { (result) -> () in
                    print("device bien supprimer", terminator: "")
                    self.directiveListView.reloadData()
                }
                
            } else {
                LibraryAPI.sharedInstance.deleteDevice(allDirectives[indexPath.row].getId())  { (result) -> () in
                    print("device bien supprimer", terminator: "")
                    self.directiveListView.reloadData()
                }
                
            }
        }
    }
    
    @IBAction func unwindToListDir(segue: UIStoryboardSegue) {}
    
    @IBAction func unwindToListDirButSave(segue: UIStoryboardSegue) {}

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "editDir") {
            let svc = segue.destinationViewController as! EditDirectiveViewController;
            
            //get selected Directive from tableView
            if let selectedDirCell = sender as? DirectiveTableViewCell {
                let indexPath = directiveListView.indexPathForCell(selectedDirCell)!
                if (resultSeachController.active) {
                    directive = filteredDirective[indexPath.row]
                } else {
                    directive = allDirectives[indexPath.row]
                }
                svc.directive = directive
            }
            
            
        }
    }

    func switchOnOff(switchTab: UISwitch) {
        print("je change le status mais ca marche pas encore", terminator: "")
    }

}
