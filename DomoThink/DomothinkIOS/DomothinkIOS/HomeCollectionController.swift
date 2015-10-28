//
//  HomeCollectionController.swift
//  DomothinkIOS
//
//  Created by Guillaume Wehrling on 23/10/2015.
//  Copyright (c) 2015 DomoThink. All rights reserved.
//

import UIKit

let reuseIdentifier = "Cell"

class HomeCollectionController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    var tableData: [String] = ["Objects", "Directives", "Ma Domobox", "Store", "Mise à jour", "Paramètres"]
    var tableImg: [String] = ["briefcase11.png", "list30.png", "archive15.png", "shopping69.png", "download63.png", "cog2.png"]
    var tableSegueName: [String] = ["objectSegue", "directiveSegue", "domoboxSegue", "storeSegue", "updateSegue", "settingSegue"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tableData.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell:  HomeCell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! HomeCell
        
        // Configure the cell
        
        cell.labelCell.text = tableData[indexPath.row]
        cell.imgCell.image = UIImage(named: tableImg[indexPath.row])
        cell.labelSegue = tableSegueName[indexPath.row]
        
        
        
        return cell
        
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        println("Cell \(tableSegueName[indexPath.row]) selected")
        self.performSegueWithIdentifier(tableSegueName[indexPath.row], sender: self)
        
    }
    


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
}
