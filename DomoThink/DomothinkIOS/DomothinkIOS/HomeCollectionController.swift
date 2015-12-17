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

    @IBOutlet weak var logoutButton: UIBarButtonItem!
    
    var tableData: [String] = ["Objects", "Directives", "Mes Plugins", "Store", "Mise à jour", "Paramètres"]
    var tableImg: [String] = ["briefcase11.png", "list30.png", "archive15.png", "shopping69.png", "download63.png", "cog2.png"]
    var tableSegueName: [String] = ["objectSegue", "directiveSegue", "domoboxSegue", "storeSegue", "updateSegue", "settingSegue"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        logoutButton.action = "logoutAction"
        
        
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tableData.count
    }
    
    //remplir la vue
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell:  HomeCell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! HomeCell
        
        // Configure the cell
        
        cell.labelCell.text = tableData[indexPath.row]
        cell.imgCell.image = UIImage(named: tableImg[indexPath.row])
        cell.labelSegue = tableSegueName[indexPath.row]
        
        
        
        return cell
        
    }
    
    // onclick ce dirriger vers la page concerner 
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        println("Cell \(tableSegueName[indexPath.row]) selected")
        self.performSegueWithIdentifier(tableSegueName[indexPath.row], sender: self)
        
    }
    
    //Alerte pour la deconnexion 
    
    func logoutAction() {
        let alert = UIAlertController(title: "Deconnexion !", message:"Voulez-vous vous déconnecter ?", preferredStyle: .Alert)
        let action = UIAlertAction(title: "OUI", style: .Default) { _ in
            println("j'ai cliquer sur OUI")
            self.performSegueWithIdentifier("logoutSegue", sender: self)
        }
        
        let action2 = UIAlertAction(title: "NON", style: .Default) { _ in
            println("j'ai cliquer sur NON")

        }

        alert.addAction(action)
        alert.addAction(action2)
        self.presentViewController(alert, animated: true){}
        //self.performSegueWithIdentifier("logoutSegue", sender: self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
}
