//
//  PluginManagerViewController.swift
//  DomothinkIOS
//
//  Created by Guillaume Wehrling on 07/12/2015.
//  Copyright (c) 2015 DomoThink. All rights reserved.
//

import UIKit

let reuseIdentifierPluginManager = "PluginManagerCell"

class PluginManagerViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    private var allPluginInstalled: [Plugin]!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        allPluginInstalled = LibraryAPI.sharedInstance.getPluginsInstalled()
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        // count of all directive
            return self.allPluginInstalled.count;
    }
    
    func tableView(tableView: UITableView,
        cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        
        let cell: PluginManagerCell = tableView.dequeueReusableCellWithIdentifier(reuseIdentifierPluginManager, forIndexPath: indexPath) as! PluginManagerCell
        //add plugin in the table view
        /*if (resultSeachController.active) {
            cell.pluginTitle.text = filtredPlugin[indexPath.row]._name
            cell.pluginAutor.text = filtredPlugin[indexPath.row]._autor
            cell.pluginImg.image = UIImage(named: filtredPlugin[indexPath.row]._imgName)
            cell.pluginRate.text = NSString(format: "%.1f/5", filtredPlugin[indexPath.row]._rate) as String
            cell.pluginIndex.text = NSString(format: "%d", indexPath.row + 1) as String
        } else {*/
            cell.titlePlugin.text = allPluginInstalled[indexPath.row]._name
            cell.switchPlugin.setOn(allPluginInstalled[indexPath.row]._isActive, animated: true)
        
            cell.switchPlugin.tag = indexPath.row
            cell.switchPlugin.addTarget(self, action: "switchOnOff:", forControlEvents: UIControlEvents.ValueChanged)
        //}
        
        return cell
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func switchOnOff(switchTab: UISwitch) {
        if (switchTab.on) {
            LibraryAPI.sharedInstance.setIsActivePlugin(allPluginInstalled[switchTab.tag], value: true)
        } else {
            LibraryAPI.sharedInstance.setIsActivePlugin(allPluginInstalled[switchTab.tag], value: false)
        }
    }
    
}
