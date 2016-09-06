//
//  ViewController.swift
//  string
//
//  Created by mfang032 on 12/21/15.
//  Copyright © 2015 mfang032. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let str1 = "Michal"
        let str2 = "michal"
        if str1.lowercaseString == str2.lowercaseString {
            print("OK")
        }
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

