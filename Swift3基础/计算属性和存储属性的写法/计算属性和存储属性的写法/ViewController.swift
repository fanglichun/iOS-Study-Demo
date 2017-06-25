//
//  ViewController.swift
//  计算属性和存储属性的写法
//
//  Created by flc on 16/9/24.
//  Copyright © 2016年 Michael. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var textLabel: UILabel!
    //属性也可以直接作用于类型本身，这样的属性成为类型属性。
    //计算属性是用来计算一个值，可以用在类、结构体和枚举。
    var value: Double {
        get {//get方法在读值的时候调用
            return  (NumberFormatter().number(from: "1234")?.doubleValue)!
        }
        set {//set方法在赋值的时候调用
            textLabel.text = "\(newValue)"
        }
    }
    
    //存储属性:存储常量或者变量作为实例的一部分，用于类和结构体

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        value = 4.5
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

