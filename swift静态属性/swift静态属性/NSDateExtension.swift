//
//  NSDateExtension.swift
//  swift静态属性
//
//  Created by mfang032 on 12/1/15.
//  Copyright © 2015 mfang032. All rights reserved.
//

import UIKit

extension NSDate {
    var month0xx: String {
        ViewController.dateFormatter.dateFormat = "MMM"
        return ViewController.dateFormatter.stringFromDate(self)
    }
    
    var month0xxxx: String {
        ViewController.dateFormatter.dateFormat = "MMMM"
        return ViewController.dateFormatter.stringFromDate(self)

    }
    
    var hour0x: String {
        ViewController.dateFormatter.dateFormat = "HH"
        return ViewController.dateFormatter.stringFromDate(self)

    }
    var minute0x: String {
        ViewController.dateFormatter.dateFormat = "mm"
        return ViewController.dateFormatter.stringFromDate(self)

    }
    var second0x: String {
        ViewController.dateFormatter.dateFormat = "ss"
        return ViewController.dateFormatter.stringFromDate(self)

    }
}
