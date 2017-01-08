//
//  DirectiveTableViewCell.swift
//  Domothink
//
//  Created by Guillaume Wehrling on 22/10/2016.
//  Copyright © 2016 DomoThink. All rights reserved.
//

import UIKit

class DirectiveTableViewCell: UITableViewCell {

    @IBOutlet weak var ruleName: UILabel!
    @IBOutlet weak var ruleRecurence: UILabel!
    @IBOutlet weak var ruleLastExec: UILabel!
    @IBOutlet weak var ruleStatus: UISwitch!
    @IBOutlet weak var ruleImg: UIImageView!
    
}
