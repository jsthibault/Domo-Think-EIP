//
//  DeviceTableViewCell.swift
//  Domothink
//
//  Created by Guillaume Wehrling on 22/10/2016.
//  Copyright © 2016 DomoThink. All rights reserved.
//

import UIKit

class DeviceTableViewCell: UITableViewCell {

    @IBOutlet weak var deviceName: UILabel!
    @IBOutlet weak var icon: UIImageView!
    //@IBOutlet weak var deviceStatus: UISwitch!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
