//
//  Planet.swift
//  Science
//
//  Created by flc on 2017/10/7.
//  Copyright © 2017年 Michael. All rights reserved.
//

import UIKit

class Planet: NSObject {
    
    var name: String?
    var color: UIColor?
    
    public override init() {
        
    }
    
    public init(name: String, color: UIColor) {
        self.name = name
        self.color = color
    }
    
}
