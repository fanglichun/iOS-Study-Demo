//
//  ViewController.swift
//  For循环
//
//  Created by mfang032 on 3/23/16.
//  Copyright © 2016 mfang032. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        for var index = 0; index < 3; index += 2 {
            print("index is \(index)")
        }
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

