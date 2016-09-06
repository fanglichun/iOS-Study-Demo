//
//  Example.swift
//  Swift中的值类型和引用类型
//
//  Created by mfang032 on 2/18/16.
//  Copyright © 2016 mfang032. All rights reserved.
//

import UIKit

class Employee: NSObject {
    var name : String?
    var age : Int?
    var address: Address?
    override init() {
        name = ""
        age = 0
        address = Address(province: "甘肃", city: "兰州", zone: "皋兰县", street: "和平路")
    }
}

struct Address {
    var province : String?
    var city : String?
    var zone : String?
    var street : String?
}