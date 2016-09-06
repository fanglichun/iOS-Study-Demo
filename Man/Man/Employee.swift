//
//  Employee.swift
//  Man
//
//  Created by mfang032 on 2/17/16.
//  Copyright © 2016 mfang032. All rights reserved.
//

import UIKit

class Employee: NSObject {
    
    var gender: String?

    var age: Int = 0

    var hobby: [Hobby]?

    var name: String?

    var height: String?

    var addr: Address?

}

struct Add {
    
    var province: String?
    
    var city: String?
    
    var code: String?
}

class Address: NSObject {

    var province: String?

    var city: String?

    var code: String?

}

class Hobby: NSObject {

    var name: String?

    var code: String?

}

