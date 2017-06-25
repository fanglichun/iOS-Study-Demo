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
        self.backgroundColor = UIColor.red
    }
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        self.backgroundColor = UIColor.red
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = self.bounds.size.width / 2
    }
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        super.beginTracking(touch, with: event)
        self.backgroundColor = UIColor.gray
        return super.beginTracking(touch, with: event)
    }
    override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
        super.endTracking(touch, with: event)
        self.backgroundColor = UIColor.red
    }
    override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        let inside = super.point(inside: point, with: event)
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
