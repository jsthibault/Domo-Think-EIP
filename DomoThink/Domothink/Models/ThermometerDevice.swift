//
//  LightDevice.swift
//  Domothink
//
//  Created by Guillaume Wehrling on 24/12/2016.
//  Copyright © 2016 DomoThink. All rights reserved.
//

import UIKit

class ThermometerDevice: Device {
    private var _value: Float!
    
    init(id: Int, name: String, desc: String, status: Bool, value: Float) {
        super.init(id: id, name: name, desc: desc, status: status)
        self._value = value
    }
}
