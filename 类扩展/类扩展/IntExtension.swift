//
//  IntExtension.swift
//  类扩展
//
//  Created by mfang032 on 10/27/15.
//  Copyright © 2015 mfang032. All rights reserved.
//

import Foundation

extension Int {
    enum Kind {
        case Negative, Zero, Positive
    }
    var kind: Kind {
        switch self {
        case 0:
            return .Zero
        case let x where x > 0:
            return .Positive
        default:
            return .Negative
        }
    }
}