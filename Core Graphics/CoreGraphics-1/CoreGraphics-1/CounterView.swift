//
//  CounterView.swift
//  CoreGraphics-1
//
//  Created by mfang032 on 2017/5/20.
//  Copyright © 2017年 mfang032. All rights reserved.
//

import UIKit

@IBDesignable
class CounterView: UIView {

    let π = CGFloat(Double.pi)
    let NoOfGlasses: Int = 8
    @IBInspectable var counter: Int = 5 {
        didSet {
            if counter <= NoOfGlasses {
                setNeedsDisplay()
            }
        }
    }
    @IBInspectable var outlineColor: UIColor = UIColor.black
    @IBInspectable var counterColor: UIColor = UIColor.orange
    
    override func draw(_ rect: CGRect) {
        let center = CGPoint(x: bounds.width / 2,
                             y: bounds.height / 2)
        let radius: CGFloat = max(bounds.width, bounds.height)
        let arcWidth: CGFloat = 76
        let startAngle: CGFloat = 3 * π / 4
        let endAngle: CGFloat = π / 4
        
        let path = UIBezierPath(arcCenter: center,
                                radius: radius / 2 - arcWidth / 2,
                                startAngle: startAngle,
                                endAngle: endAngle,
                                clockwise: true)
        path.lineWidth = arcWidth
        counterColor.setStroke()
        path.stroke()
        
        //1 - first calculate the difference between the two angles
        let angleDifference: CGFloat = 2 * π - startAngle + endAngle
        //2、then calculate the arr for each single glass
        let arcLenghtPerGlass = angleDifference / CGFloat(NoOfGlasses)
        let outlineEndAngle = arcLenghtPerGlass * CGFloat(counter) + startAngle
        //3、draw the outer arc
        let outlinePath = UIBezierPath(arcCenter: center,
                                       radius: bounds.width/2 - 2.5,
                                       startAngle: startAngle,
                                       endAngle: outlineEndAngle,
                                       clockwise: true)
        //4、dram the inner arc
        outlinePath.addArc(withCenter: center,
                           radius: bounds.width/2 - arcWidth + 2.5,
                           startAngle: outlineEndAngle,
                           endAngle: startAngle,
                           clockwise: false)
        outlinePath.close()
        outlineColor.setStroke()
        outlinePath.lineWidth = 5.0
        outlinePath.stroke()
        
    }

}
