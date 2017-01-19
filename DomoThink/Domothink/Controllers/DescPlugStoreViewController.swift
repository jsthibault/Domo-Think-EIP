//
//  DescPlugStoreViewController.swift
//  Domothink
//
//  Created by Guillaume Wehrling on 11/11/2016.
//  Copyright © 2016 DomoThink. All rights reserved.
//

import UIKit

class DescPlugStoreViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var emptyMessage: UILabel!
    @IBOutlet weak var imgPlugin: UIImageView!
    @IBOutlet weak var datePlugin: UILabel!
    @IBOutlet weak var titlePlugin: UILabel!
    @IBOutlet weak var ratePlugin: UILabel!
    @IBOutlet weak var downloadButton: UIButton!
    @IBOutlet weak var addCommentBtn: UIBarButtonItem!
    
    @IBOutlet weak var commentListView: UITableView!
    
    var plugin: StorePlugin!
    private var allComment = [StoreComment]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        datePlugin.text = plugin.getDate()
        titlePlugin.text = plugin.getName()
        ratePlugin.text = String(round(plugin.getRate()))
        imgPlugin.image = UIImage(named: "plugin")
        
        emptyMessage.hidden = true
        getTableValue()
        downloadButton.addTarget(self, action: #selector(DescPlugStoreViewController.dlPlugin), forControlEvents: .TouchUpInside)
    }
    
    func getTableValue () {
        LibraryAPI.sharedInstance.getStoreComments(plugin.getId()) { (result) -> () in
            self.allComment = result
            self.commentListView.reloadData()
        }
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        var count: Int!

        count = self.allComment.count;
        print(count)
        
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
        let cell: CommentStoreTableViewCell = tableView.dequeueReusableCellWithIdentifier("commentCell", forIndexPath: indexPath) as! CommentStoreTableViewCell
        
        //add plugin in the table view
            cell.authorLabel.text = allComment[indexPath.row].getAuthor()
            cell.rateLabel.text = String(allComment[indexPath.row].getRate()) + "/5"
            cell.commentLabel.text = allComment[indexPath.row].getComment()
        return cell
    }
    
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if (editingStyle == UITableViewCellEditingStyle.Delete) {
            let comment = allComment[indexPath.row]
            
            let idLogin = comment.getKeyLoginHash()
            
            let user = LibraryAPI.sharedInstance.getUser()
            if (idLogin.containsString((String(user.getId()) + user.getLogin()).md5)) {
                LibraryAPI.sharedInstance.deleteStoreComment(comment.getId(), keyLoginHash: comment.getKeyLoginHash())  { (result) in
                    self.getTableValue()
                    print("comment delete")
                }
            } else {
                self.commentListView.reloadData()
                let alertController = UIAlertController(title:
                    
                    NSLocalizedString("INFO", comment: "information"), message:
                    NSLocalizedString("ECHEC_ERASE", comment: "comment no erase"), preferredStyle: UIAlertControllerStyle.Alert)
                alertController.addAction(UIAlertAction(title: NSLocalizedString("RETURN", comment: "Dismiss"), style: UIAlertActionStyle.Default,handler: nil))
                
                self.presentViewController(alertController, animated: true, completion: nil)
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func unwindToDesc(segue: UIStoryboardSegue) {}
    
    @IBAction func unwindToDescButSave(segue: UIStoryboardSegue) {
        LibraryAPI.sharedInstance.getStoreComments(plugin.getId()) { (result) -> () in
            self.allComment = result
            self.commentListView.reloadData()
        }
    }

    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if (segue.identifier == "goToAdd") {
            let svc = segue.destinationViewController as! AddCommentViewController
            svc.plugin = plugin
        } else if (segue.identifier == "modifyComment") {
            let svc = segue.destinationViewController as! AddCommentViewController
            svc.plugin = plugin
            if let selectedcomment = sender as? CommentStoreTableViewCell {
                let indexPath = commentListView.indexPathForCell(selectedcomment)!
                let selectedCommentPlugin: StoreComment!
                selectedCommentPlugin = allComment[indexPath.row]
                svc.commentPlugin = selectedCommentPlugin
            }
        }
    }
    
    override func shouldPerformSegueWithIdentifier(identifier: String?, sender: AnyObject?) -> Bool {
        if let ident = identifier {
            if ident == "modifyComment" {
                if let selectedcomment = sender as? CommentStoreTableViewCell {
                    let indexPath = commentListView.indexPathForCell(selectedcomment)!
                    let selectedCommentPlugin: StoreComment!
                    selectedCommentPlugin = allComment[indexPath.row]
                    if (selectedCommentPlugin.getKeyLoginHash() == (String(LibraryAPI.sharedInstance.getUser().getId()) + LibraryAPI.sharedInstance.getUser().getLogin()).md5) {
                        return true
                    } else {
                        return false
                    }
                }
            }
        }
        return true
    }

    
    func dlPlugin() {
        downloadButton.enabled = false
        LibraryAPI.sharedInstance.addPlugin(plugin.getId(), name: plugin.getName(), status: true, repository: plugin.getRepository()) { (result) -> () in
            if (result == true) {
                print("c'est bien", terminator: "")
                
                let alertController = UIAlertController(title:
                    
                    NSLocalizedString("INFO", comment: "information"), message:
                    NSLocalizedString("PLUGIN_INSTALLED", comment: ""), preferredStyle: UIAlertControllerStyle.Alert)
                alertController.addAction(UIAlertAction(title: NSLocalizedString("RETURN", comment: "Dismiss"), style: UIAlertActionStyle.Default,handler: nil))
                
                self.presentViewController(alertController, animated: true, completion: nil)
                
            } else {
                self.downloadButton.enabled = true
                let alertController = UIAlertController(title:
                    
                    NSLocalizedString("INFO", comment: "information"), message:
                    NSLocalizedString("PLUGIN_NOT_INSTALLED", comment: ""), preferredStyle: UIAlertControllerStyle.Alert)
                alertController.addAction(UIAlertAction(title: NSLocalizedString("RETURN", comment: "Dismiss"), style: UIAlertActionStyle.Default,handler: nil))
                
                self.presentViewController(alertController, animated: true, completion: nil)
            }
        }
    }

}
