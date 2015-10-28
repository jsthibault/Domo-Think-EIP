//
//  DirectiveViewController.swift
//  DomothinkIOS
//
//  Created by Guillaume Wehrling on 24/10/2015.
//  Copyright (c) 2015 DomoThink. All rights reserved.
//

import UIKit

let reuseIdentifierDirective = "DirectiveCellId"

class DirectiveViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var tableData: [String] = ["Allumage four", "Eteindre les lumieres"]
    var tableHour: [String] = ["17:30", "23:00"]
    var tableValueSwitch: [Int] = [1, 0]
    
    var dataPassed: String!
    var dataPassed2: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if (dataPassed != nil && dataPassed != "") {
            tableData.append(dataPassed)
            tableHour.append(dataPassed2)
            tableValueSwitch.append(1)
        }

        // Do any additional setup after loading the view.
    }

    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return self.tableData.count;
    }
    
    func tableView(tableView: UITableView,
        cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        
        let cell: DirectiveCell = tableView.dequeueReusableCellWithIdentifier(reuseIdentifierDirective, forIndexPath: indexPath) as! DirectiveCell
        
        cell.labelText.text = tableData[indexPath.row]
        cell.switchTab.setOn(Bool(tableValueSwitch[indexPath.row]), animated: true)
        cell.dateLabel.text = tableHour[indexPath.row]
        
        return cell
    }

        
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
