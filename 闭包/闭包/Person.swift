

//
//  Person.swift
//  闭包
//
//  Created by mfang032 on 4/16/16.
//  Copyright © 2016 mfang032. All rights reserved.
//

import UIKit

class Person: NSObject {
    //在企业开发中不这样写getter和setter方法
    var _name: String?
    var name: String?{
        get {
            return _name
        }
        set {
            _name = newValue
        }
    }
    
    var gender: String?{
        //设置完值后调用
        //swift中利用didSet 来替换充血setter方法
        didSet {
            print(gender)
        }
    }
    
    //重写getter方法，称这个属性为计算型属性，对应OC中的read only,不占用内存空间
    var age:Int {
        get {
            return 30
        }
    }
}
