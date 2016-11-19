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
        ratePlugin.text = String(plugin.getRate())
        imgPlugin.image = UIImage(named: "images.jpeg")
        
        emptyMessage.hidden = true
        LibraryAPI.sharedInstance.getStoreComments(plugin.getId()) { (result) -> () in
            self.allComment = result
            self.commentListView.reloadData()
        }
        downloadButton.addTarget(self, action: #selector(DescPlugStoreViewController.dlPlugin), forControlEvents: .TouchUpInside)
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        var count: Int!

        count = self.allComment.count;
        
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
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func unwindToDesc(segue: UIStoryboardSegue) {}
    
    @IBAction func unwindToDescButSave(segue: UIStoryboardSegue) {}

    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if (segue.identifier == "goToAdd") {
            let svc = segue.destinationViewController as! AddCommentViewController;
            svc.plugin = plugin
        }
    }
    
    func dlPlugin() {
        LibraryAPI.sharedInstance.addPlugin(plugin.getId(), name: plugin.getName(), status: true, repository: plugin.getRepository()) { (result) -> () in
            if (result == true) {
                print("c'est bien", terminator: "")
                
                let alertController = UIAlertController(title:
                    
                    NSLocalizedString("INFO", comment: "information"), message:
                    NSLocalizedString("plugin installed go to plugin section", comment: "mdp changer"), preferredStyle: UIAlertControllerStyle.Alert)
                alertController.addAction(UIAlertAction(title: NSLocalizedString("RETURN", comment: "Dismiss"), style: UIAlertActionStyle.Default,handler: nil))
                
                self.presentViewController(alertController, animated: true, completion: nil)
                
            } else {
                print("c'est pas bien", terminator: "")
                
                let alertController = UIAlertController(title:
                    
                    NSLocalizedString("INFO", comment: "information"), message:
                    NSLocalizedString("plugin not installed", comment: "mdp changer"), preferredStyle: UIAlertControllerStyle.Alert)
                alertController.addAction(UIAlertAction(title: NSLocalizedString("RETURN", comment: "Dismiss"), style: UIAlertActionStyle.Default,handler: nil))
                
                self.presentViewController(alertController, animated: true, completion: nil)
            }
        }
    }

}
