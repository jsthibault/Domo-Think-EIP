//
//  LightTableViewCell.swift
//  Domothink
//
//  Created by Guillaume Wehrling on 26/12/2016.
//  Copyright © 2016 DomoThink. All rights reserved.
//

import UIKit

class LightTableViewCell: DeviceTableViewCell {

    @IBOutlet weak var lightSwitch: UISwitch!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
