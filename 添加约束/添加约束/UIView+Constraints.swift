//
//  UIView+Constraints.swift
//  添加约束
//
//  Created by mfang032 on 12/25/15.
//  Copyright © 2015 mfang032. All rights reserved.
//

import UIKit

extension UIView {
    
    func addEdgeConstraints(Subview subview: UIView,Top top: CGFloat?,Left left: CGFloat?, Bottom bottom: CGFloat?, Right right: CGFloat?) {
        subview.translatesAutoresizingMaskIntoConstraints = false
        if let value = top {
            let topConst = NSLayoutConstraint(item: subview, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.Top, multiplier: 1.0, constant: value)
            self.addConstraint(topConst)
        }
        if let value = left {
            let leftConst = NSLayoutConstraint(item: subview, attribute: NSLayoutAttribute.Left, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.Left, multiplier: 1.0, constant: value)
            self.addConstraint(leftConst)
        }
        if let value = bottom {
            let bottomConst = NSLayoutConstraint(item: subview, attribute: NSLayoutAttribute.Bottom, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.Bottom, multiplier: 1.0, constant: value)
            self.addConstraint(bottomConst)
        }
        if let value = right {
            let rightConst = NSLayoutConstraint(item: subview, attribute: NSLayoutAttribute.Right, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.Right, multiplier: 1.0, constant: value)
            self.addConstraint(rightConst)
        }
    }
    
    func addSizeConstraints(SubView subView: UIView, Width width: CGFloat?, Height height: CGFloat?, CenterX centerX: CGFloat?, CenterY centerY: CGFloat?) {
        subView.translatesAutoresizingMaskIntoConstraints = false
        if let value = centerX {
            let topConst = NSLayoutConstraint(item: subView, attribute: NSLayoutAttribute.CenterX, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.CenterX, multiplier: 1.0, constant: value)
            self.addConstraint(topConst)
        }
        if let value = centerY {
            let topConst = NSLayoutConstraint(item: subView, attribute: NSLayoutAttribute.CenterY, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.CenterY, multiplier: 1.0, constant: value)
            self.addConstraint(topConst)
        }
        if let value = width {
            let topConst = NSLayoutConstraint(item: subView, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.Width, multiplier: 1.0, constant: value)
            self.addConstraint(topConst)
        }
        if let value = height {
            let topConst = NSLayoutConstraint(item: subView, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.Height, multiplier: 1.0, constant: value)
            self.addConstraint(topConst)
        }
    }
}
