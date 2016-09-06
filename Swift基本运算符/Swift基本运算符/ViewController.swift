//
//  ViewController.swift
//  Swift基本运算符
//
//  Created by mfang032 on 10/22/15.
//  Copyright © 2015 mfang032. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let minX = -6
        let positiveMinX = +minX
        print(positiveMinX)
        
        var emptyString = ""               // 空字符串字面量
        var anotherEmptyString = String()
        
        print("emptyString:\(emptyString)\nanotherEmptyString:\(anotherEmptyString)")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

