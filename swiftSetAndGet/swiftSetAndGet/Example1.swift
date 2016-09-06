//
//  Example1.swift
//  swiftSetAndGet
//
//  Created by mfang032 on 16/5/13.
//  Copyright © 2016年 mfang032. All rights reserved.
//

import UIKit


class People : NSObject
{
    //普通属性
    var firstName:String = ""
    var lastName:String  = ""
    var nickName:String  = ""
    
    //计算属性
    var fullName:String
        {
        get
        {
            return nickName + " " + firstName + " " + lastName
        }
    }
    
    //带属性监视器的普通属性
    var age:Int = 0
        {
        //我们需要在age属性变化前做点什么
        willSet
        {
            print("Will set an new value \(newValue) to age")
        }
        //我们需要在age属性发生变化后，更新一下nickName这个属性
        didSet
        {
            print("age filed changed form \(oldValue) to \(age)")
            if age<10
            {
                nickName = "Little"
            }else
            {
                nickName = "Big"
            }
        }
    }
    
    func toString() -> String
    {
        return "Full Name: \(fullName) " + ", Age: \(age) "
    }
    
}