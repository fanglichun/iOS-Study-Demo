//
//  Utilities.swift
//  SwiftRest
//
//  Created by mfang032 on 2017/6/23.
//  Copyright © 2017年 mfang032. All rights reserved.
//

import Foundation
import  UIKit

struct Screeen {
    static let width = UIScreen.main.bounds.size.width
    static let height = UIScreen.main.bounds.size.height
}

var isLandscape: Bool {
    var isPortrait = true
    switch UIDevice.current.orientation {
    case .portrait, .portraitUpsideDown:
        isPortrait = true
    case .landscapeLeft, .landscapeRight:
        isPortrait = false
    default:
        isPortrait = false
    }
    return isPortrait
}
