//
//  UIColor+Extension.swift
//  Artistry
//
//  Created by flc on 16/10/15.
//  Copyright © 2016年 RayWenderlich. All rights reserved.
//

import UIKit

extension UIColor {
  
  convenience init(_ red: Int, _ green: Int, _ blue: Int, _ alpha: CGFloat = 1.0) {
    assert(red >= 0 && red <= 255, "Invalid red component")
    assert(green >= 0 && green <= 255, "Invalid green component")
    assert(blue >= 0 && blue <= 255, "Invalid blue component")
    
    self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: alpha)
  }
  
  convenience init(_ hexValue:Int) {
    self.init((hexValue >> 16) & 0xff, (hexValue >> 8) & 0xff, hexValue & 0xff)
  }
}

//699F38 105 159 56
let titleColor = UIColor(105, 159, 56)
let backColor = UIColor(0x699f38)
