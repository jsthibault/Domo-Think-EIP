//
//  PluginCell.swift
//  DomothinkIOS
//
//  Created by Guillaume Wehrling on 20/11/2015.
//  Copyright (c) 2015 DomoThink. All rights reserved.
//

import UIKit

class PluginCell: UITableViewCell {

    @IBOutlet weak var imgPlug: UIImageView!
    @IBOutlet weak var titlePlug: UILabel!
    @IBOutlet weak var descriptionPlug: UITextView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
