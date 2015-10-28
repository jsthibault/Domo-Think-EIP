//
//  ObjectViewController.swift
//  DomothinkIOS
//
//  Created by Guillaume Wehrling on 24/10/2015.
//  Copyright (c) 2015 DomoThink. All rights reserved.
//

import UIKit

let reuseIdentifierTable = "CellTable"

class ObjectViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    private var tableData: [String] = ["Oven", "Garden Light", "TV", "Stereo"]
    private var tableType: [Int] = [1, 1, 1, 0]
    private var tableValueSwitchSlider: [Int] = [1, 0, 1, 50]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return self.tableData.count;
    }
    
    func tableView(tableView: UITableView,
        cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        
        let cell: ObjectCell = tableView.dequeueReusableCellWithIdentifier(reuseIdentifierTable, forIndexPath: indexPath) as! ObjectCell
        
        cell.labelCellTab.text = tableData[indexPath.row]
        if (tableType[indexPath.row] == 1)
        {
            cell.sliderCellTab.hidden = true
            cell.switchCellTab.setOn(Bool(tableValueSwitchSlider[indexPath.row]), animated: true)
        }
        else
        {
            cell.switchCellTab.hidden = true
            cell.sliderCellTab.value = Float(tableValueSwitchSlider[indexPath.row])
        }
        
        return cell
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
