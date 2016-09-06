//
//  main.swift
//  11111
//
//  Created by mfang032 on 3/10/16.
//  Copyright © 2016 mfang032. All rights reserved.
//

import Foundation
extension NSNumber {
    var formatNumString: String {
        let formatter = NSNumberFormatter()
        formatter.numberStyle = NSNumberFormatterStyle.DecimalStyle //72,900
        return formatter.stringFromNumber(self)!
    }
}

let str: String = "1234343"
if let n = Int(str) {
    let number = NSNumber(integer: n)
    print(number.formatNumString)

}





