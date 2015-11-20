//
//  RecentsStoreViewController.swift
//  DomothinkIOS
//
//  Created by Guillaume Wehrling on 20/11/2015.
//  Copyright (c) 2015 DomoThink. All rights reserved.
//

import UIKit

let reuseIdentifierPlugin = "PluginCell"

class RecentsStoreViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    private var tableData: [String] = ["Valentine Mood", "Musical Setup", "Film Setup", "Working Ambiance"]
    private var tableDesc: [String] = ["vous voulez faire une surprise a votre femme ?", "Reglez votre musique comme bon vous semble", "Selectionner un film a distance", "ambiance de chantier ? ce plugin est pour vous"]
    private var tableImg: [String] = ["images.jpeg", "images.jpeg", "images.jpeg", "images.jpeg"]
    
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
        
        let cell: PluginCell = tableView.dequeueReusableCellWithIdentifier(reuseIdentifierPlugin, forIndexPath: indexPath) as! PluginCell
        
        cell.titlePlug.text = tableData[indexPath.row]
        cell.imgPlug.image = UIImage(named: tableImg[indexPath.row])
        cell.descriptionPlug.text = tableDesc[indexPath.row]
        return cell
    }

    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
