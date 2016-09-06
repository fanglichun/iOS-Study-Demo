
//
//  Person.swift
//  Swift构造方法实现
//
//  Created by mfang032 on 4/16/16.
//  Copyright © 2016 mfang032. All rights reserved.
//

import UIKit

class Person: NSObject {
    
    //属性必须有初始值，不初始化必须定义为可选
    //只要在构造方法中对属性进行了初始化，swift中就不必要定义为可选类型
    //swift中有方法重载的概念，即只要形参和返回值不同即可
    //如果自定义了构造方法并且未调用父类的构造方法，那么默认构造方法会失效
    //若想使用默认和自定义的构造方法的话 ，必须重写默认的构造方法并且自定义构造方法
    var name: String?
    //若是定义一个对象属性后面可以加上?  如果定义一个基本类型属性建赋值为0
    //super.init()再给属性分配内存空间的时候：
    //1)若属性是一个对象属性并且是一个可选类型，那么会给这个属性分配内存空间
    //2)若属性是一个基本数据类型并且是可选类型，那么不会给这个属性分配内存空间
    
    var age: Int = 0
    
    //重载构造方法
    override init() {
        self.name = ""
        self.age = 0
    }
    //自定义构造方法
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
    
    init(dict: [String: AnyObject]){
        //若想在swift自定义构造方法中使用KVC给属性赋值之前必须调用super.init()
        //调用super.init()的目的是为了能在KVC调用之前给属性分配内存空间
        super.init()
        setValuesForKeysWithDictionary(dict)
    }

}
