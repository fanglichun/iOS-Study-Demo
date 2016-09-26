//
//  枚举.swift
//  Swift3枚举写法
//
//  Created by flc on 16/9/24.
//  Copyright © 2016年 Michael. All rights reserved.
//

import Foundation
import UIKit

enum ShortcutIdentifier: String {
    case First
    case Second
    case Third
    case Fourth
    
    // MARK: Initializers
    
    init?(fullType: String) {
        let last = fullType.components(separatedBy: ".").last ?? ""
        self.init(rawValue:last)
    }
    
    // MARK: Properties
    
    var type: String {
        return Bundle.main.bundleIdentifier! + ".\(self.rawValue)"
    }
}
