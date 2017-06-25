//
//  Walker.swift
//  KVO设计模式
//
//  Created by mfang032 on 2017/4/6.
//  Copyright © 2017年 mfang032. All rights reserved.
//

import UIKit

class Walker: NSObject {
    
    var age: Int
    var name: String
    
    init(_ name: String, _ age: Int) {
        self.name = name
        self.age = age
    }

}
