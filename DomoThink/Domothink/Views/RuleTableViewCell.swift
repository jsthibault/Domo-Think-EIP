//
//  RuleTableViewCell.swift
//  Domothink
//
//  Created by Guillaume Wehrling on 24/12/2016.
//  Copyright © 2016 DomoThink. All rights reserved.
//

import UIKit

class RuleTableViewCell: UITableViewCell {

    @IBOutlet weak var ruleImg: UIImageView!
    @IBOutlet weak var ruleTitle: UILabel!
    @IBOutlet weak var ruleRecurence: UILabel!
    @IBOutlet weak var ruleLastExec: UILabel!
    @IBOutlet weak var ruleState: UISwitch!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
