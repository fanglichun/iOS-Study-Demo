//
//  CircleView.swift
//  自定义View视图
//
//  Created by mfang032 on 2017/5/18.
//  Copyright © 2017年 mfang032. All rights reserved.
//

import UIKit

@IBDesignable
 class CircleView: UIView {
    
    @IBInspectable var lineWidth: CGFloat = 2.0
    @IBInspectable var fillColor: UIColor = UIColor.red
    @IBInspectable var strokeColor: UIColor = UIColor.blue
    
    override func draw(_ rect: CGRect) {
        let insetRect = rect.insetBy(dx: lineWidth / 2, dy: lineWidth / 2)
        let path = UIBezierPath(ovalIn: insetRect)
        path.lineWidth = lineWidth
        fillColor.setFill()
        path.fill()
        strokeColor.setStroke()
        path.stroke()
    }
}
