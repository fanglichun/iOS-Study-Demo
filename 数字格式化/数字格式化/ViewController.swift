//
//  ViewController.swift
//  数字格式化
//
//  Created by mfang032 on 3/9/16.
//  Copyright © 2016 mfang032. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let num: NSNumber = 0
        
        let formatter = NSNumberFormatter()
        //formatter.numberStyle = NSNumberFormatterStyle.CurrencyStyle //$72,900
        formatter.numberStyle = NSNumberFormatterStyle.DecimalStyle //72,900
        //formatter.numberStyle = NSNumberFormatterStyle.PercentStyle //90%
        let str = formatter.stringFromNumber(num)!
        print(str)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

