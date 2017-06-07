//
//  GradientView.swift
//  CoreGraphics-1
//
//  Created by mfang032 on 2017/5/21.
//  Copyright © 2017年 mfang032. All rights reserved.
//

import UIKit

@IBDesignable
class GradientView: UIView {
    
    @IBInspectable var isClipping: Bool = false
    //1 - the properties for the gradient
    @IBInspectable var startColor: UIColor = UIColor.red
    @IBInspectable var endColor: UIColor = UIColor.green

    override func draw(_ rect: CGRect) {
        //2 - get the current context
        let context = UIGraphicsGetCurrentContext()
        let colors = [startColor.cgColor, endColor.cgColor]
        //3 - set up the color space
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        //4 - set up the color stops
        let colorLocations:[CGFloat] = [0.0, 1.0]
        //5 - create the start and end point of gradient
        let startPoint = CGPoint.zero
        let endPoint = CGPoint(x: 0, y: bounds.height)
        //6 - create the gradient
        if let gradient = CGGradient(colorsSpace: colorSpace,
                                     colors: colors as CFArray,
                                     locations: colorLocations) {
            //7 - draw the gradient
            context?.drawLinearGradient(gradient,
                                        start: startPoint,
                                        end: endPoint,
                                        options: CGGradientDrawingOptions(rawValue: 0))
        }
        if isClipping {
            let path = UIBezierPath(roundedRect: rect,
                         byRoundingCorners: UIRectCorner.allCorners,
                         cornerRadii: CGSize(width: 8.0, height: 8.0))
            path.addClip()
            
        }
    }
}
