//
//  ViewController.swift
//  Swift构造方法实现
//
//  Created by mfang032 on 4/16/16.
//  Copyright © 2016 mfang032. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let p = Person(dict: ["name": "Michael", "age": 18])
        print(p.name)
        print(p.age)

    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

