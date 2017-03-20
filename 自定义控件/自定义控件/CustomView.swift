//
//  CustomView.swift
//  自定义控件
//
//  Created by mfang032 on 16/8/23.
//  Copyright © 2016年 mfang032. All rights reserved.
//

import UIKit

class CustomView: UIControl {
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.redColor()
    }
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        self.backgroundColor = UIColor.redColor()
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = self.bounds.size.width / 2
    }
    override func beginTrackingWithTouch(touch: UITouch, withEvent event: UIEvent) -> Bool {
        super.beginTrackingWithTouch(touch, withEvent: event)
        self.backgroundColor = UIColor.grayColor()
        return super.beginTrackingWithTouch(touch, withEvent: event)
    }
    override func endTrackingWithTouch(touch: UITouch, withEvent event: UIEvent) {
        super.endTrackingWithTouch(touch, withEvent: event)
        self.backgroundColor = UIColor.redColor()
    }
    override func pointInside(point: CGPoint, withEvent event: UIEvent?) -> Bool {
        let inside = super.pointInside(point, withEvent: event)
        if inside {
            let radius = self.layer.cornerRadius
            let dx = point.x - self.bounds.size.width / 2
            let dy = point.y - radius
            let distace = sqrt(dx * dx + dy * dy)
            return distace < radius
        }
        return inside
    }
}