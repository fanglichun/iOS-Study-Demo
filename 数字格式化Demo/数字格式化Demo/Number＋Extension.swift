//
//  Number＋Extension.swift
//  数字格式化Demo
//
//  Created by mfang032 on 16/11/23.
//  Copyright © 2016年 mfang032. All rights reserved.
//

import Foundation


private struct Number {
    static let formatterWithSepator: NSNumberFormatter = {
        let formatter = NSNumberFormatter()
        formatter.groupingSeparator = ","
        formatter.numberStyle = .DecimalStyle
        return formatter
    }()
}
extension IntegerType {
    var stringFormatedWithSepator: String {
        return Number.formatterWithSepator.stringFromNumber(hashValue) ?? ""
    }
}
