//
//  ViewController.swift
//  Swift中的值类型和引用类型
//
//  Created by mfang032 on 2/18/16.
//  Copyright © 2016 mfang032. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        let employee = Employee()
//        employee.address = Address()
        
        
        //值类型和引用类型最基本的分别在复制之后的结果。当一个值类型被复制的时候，相当于创造了一个完全独立的实例，这个实例保有属于自己的独有数据，数据不会受到其他实例的数据变化影响：
        var a = Address()
        let b = a
        a.city = "Hangzhou"
        print("\(a.city),\(b.city)")
        
        //复制一个引用类型的时候，实际上是默默地创造了一个共享的实例分身，两者是共用一套数据。因此修改其中任何一个实例的数据，也会影响到另外那个。
        let x = Employee()
        let y = x
        x.age = 30
        print("\(x.age),\(y.age)")
        
        //值类型(Value Types)：每个实例都保留了一分独有的数据拷贝，一般以结构体 （struct）、枚举（enum） 或者元组（tuple）的形式出现。
        //引用类型(Reference Type)：每个实例共享同一份数据来源，一般以类（class）的形式出现。
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

