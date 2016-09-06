//
//  ViewController.swift
//  KSJSONHelp使用
//
//  Created by mfang032 on 2/17/16.
//  Copyright © 2016 mfang032. All rights reserved.
//

import UIKit
import KSJSONHelp
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        Employee.properties { (name, type, value) -> Void in
//            print("\(name),\(type),\(value)")
//        }
        let employee = Employee()
        let dic = employee.toDictionary()
        print(dic)
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

