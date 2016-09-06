//
//  EnumValue.swift
//  swift枚举使用
//
//  Created by mfang032 on 1/11/16.
//  Copyright © 2016 mfang032. All rights reserved.
//

import UIKit

enum mobileLanguageFun {
    case iOS(String, String)
    case Android(String)
    var description: String {
        switch self {
        case .iOS(let s1, let s2) :
            return "language1 = \(s1), language2 = \(s2)"
        case .Android(let str) :
            return str
        }
    }
}