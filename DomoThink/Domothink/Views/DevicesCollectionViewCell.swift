//
//  DeviceCollectionViewCell.swift
//  Domothink
//
//  Created by Guillaume Wehrling on 27/11/2016.
//  Copyright © 2016 DomoThink. All rights reserved.
//

import UIKit

class DevicesCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var titleRoom: UILabel!
    
    private var colorBorder: UIColor!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        colorBorder = UIColor.init(red: 18/255, green: 135/255, blue: 223/255, alpha: 1.0)
    
        self.contentView.layer.borderColor = colorBorder.CGColor
        
       // titleRoom.layer.cornerRadius = 5
        self.contentView.layer.borderWidth = 1.5
        //self.contentView.layer.cornerRadius = 50

        self.layer.cornerRadius = 5

        
    }
    
    
}
