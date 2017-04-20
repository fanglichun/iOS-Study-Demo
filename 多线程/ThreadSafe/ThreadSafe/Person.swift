//
//  Person.swift
//  ThreadSafe
//
//  Created by mfang032 on 2017/4/6.
//  Copyright © 2017年 mfang032. All rights reserved.
//

import UIKit

class Person: NSObject {
    
    var name: String?
    var age: Int?
    
    init(_ name: String, _ age: Int) {
        self.name = name
        self.age = age
    }
    
    func update(name: String, age: Int) {
        self.name = name
        self.age = age
    }
    
    override var description: String {
        return "name: \(String(describing: name ?? "")), age: \(String(describing: age ?? 0))"
    }
    
}
