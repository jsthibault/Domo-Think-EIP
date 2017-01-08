//
//  DirectiveViewController.swift
//  Domothink
//
//  Created by Guillaume Wehrling on 24/12/2016.
//  Copyright © 2016 DomoThink. All rights reserved.
//

import UIKit

class DirectiveViewController: UIViewController,UISearchResultsUpdating,UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var directiveTableView: UITableView!
    
    @IBOutlet weak var menuBtn: UIBarButtonItem!
    private var resultSeachController = UISearchController()
    
    private var filteredDirective = [Directive]()
    private var allDirectives = [Directive]()
    
    private var directive: Directive!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        
         if self.revealViewController() != nil {
         menuBtn.target = self.revealViewController()
         menuBtn
         .action = #selector(SWRevealViewController.revealToggle(_:))
         self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
         
         }
         
         // l'initialisation de SeachController avec un UISearchController vide
         self.resultSeachController = UISearchController(searchResultsController: nil)
         
         // Paramétrer le SeachController
         self.resultSeachController.searchResultsUpdater = self
         self.resultSeachController.dimsBackgroundDuringPresentation = false
         self.resultSeachController.searchBar.sizeToFit()
         
         // Ajout de SeachController au Header du tableView
         self.directiveTableView.tableHeaderView = self.resultSeachController.searchBar
         
         // Modifier le titre du notre SearchTableViewController
         self.title = "Directive Search"
         
         // Actualisation du tableView
         self.directiveTableView.reloadData()
         
         //emptyMessage.hidden = true
        loadValues()

 
    }
    
    func loadValues() {
        LibraryAPI.sharedInstance.getDirectives() { (result) -> () in
            self.allDirectives = result
            if (self.resultSeachController.active) {
                self.updateSearchResultsForSearchController(self.resultSeachController)
            }
            self.directiveTableView.reloadData()
        }
    }
    
    func updateSearchResultsForSearchController(searchController: UISearchController) {
        self.filteredDirective.removeAll(keepCapacity: false)
        let searchPredicate = NSPredicate(format: "getName beginswith[cd] %@", searchController.searchBar.text!)
        let array = (self.allDirectives as NSArray).filteredArrayUsingPredicate(searchPredicate)
        self.filteredDirective = array as! [Directive]
        self.directiveTableView.reloadData()
    }
 
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        //return jsonBase.count
        
        var count: Int!
        if (resultSeachController.active) {
            count =  self.filteredDirective.count
        } else {
            count = self.allDirectives.count;
        }
        /*
        if (count <= 0) {
            emptyMessage.hidden = false
        } else {
            emptyMessage.hidden = true
        }
 */
        return count
        
    }
    
    func tableView(tableView: UITableView,
                   cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell: DirectiveTableViewCell = tableView.dequeueReusableCellWithIdentifier("directiveCell", forIndexPath: indexPath) as! DirectiveTableViewCell
        //add directive in the table view
        if (resultSeachController.active) {
            cell.ruleName.text = filteredDirective[indexPath.row].getName()
            //cell.directiveStatus.setOn(filteredDirective[indexPath.row].getStatus(), animated: true)
            cell.ruleStatus.setOn(true, animated: true)
            cell.ruleLastExec.text = LibraryAPI.sharedInstance.dateFormatter(String(NSDate()))
            cell.ruleRecurence.text = "Tous les lundis à 18H"
            
            cell.ruleStatus.tag = indexPath.row
            cell.ruleStatus.addTarget(self, action: #selector(DirectiveListViewController.switchOnOff(_:)), forControlEvents: UIControlEvents.ValueChanged)
            
        } else {
            cell.ruleName.text = allDirectives[indexPath.row].getName()
            //cell.directiveStatus.setOn(allDirectives[indexPath.row].getStatus(), animated: true)
            cell.ruleStatus.setOn(true, animated: true)
            cell.ruleLastExec.text = LibraryAPI.sharedInstance.dateFormatter(String(NSDate()))
            cell.ruleRecurence.text = "Tous les lundis à 18H"

            
            cell.ruleStatus.tag = indexPath.row
            cell.ruleStatus.addTarget(self, action: #selector(DirectiveListViewController.switchOnOff(_:)), forControlEvents: UIControlEvents.ValueChanged)
        }
        cell.ruleImg.image = UIImage(named: "directive")
        if (indexPath.row % 2 == 0) {
            cell.backgroundColor = UIColor.init(red: 18/255, green: 135/255, blue: 223/255, alpha: 0.1)
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
                LibraryAPI.sharedInstance.deleteDirective(filteredDirective[indexPath.row].getId())  { (result) -> () in
                    print("device bien supprimer", terminator: "")
                    self.loadValues()
                }
                
            } else {
                LibraryAPI.sharedInstance.deleteDirective(allDirectives[indexPath.row].getId())  { (result) -> () in
                    if (result == true) {
                        print("device bien supprimer", terminator: "")
                        self.loadValues()
                    }
                }
                
            }

        }
    }

    @IBAction func unwindToListDir(segue: UIStoryboardSegue) {}
    
    @IBAction func unwindToListDirButSave(segue: UIStoryboardSegue) {
        self.loadValues()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //editer la directive
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "editDir") {
            let svc = segue.destinationViewController as! EditDirectiveViewController;
            
            //get selected Directive from tableView
            if let selectedDirCell = sender as? DirectiveTableViewCell {
                let indexPath = directiveTableView.indexPathForCell(selectedDirCell)!
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
