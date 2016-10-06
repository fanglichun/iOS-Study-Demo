//
//  UIButton+Extension.swift
//  UIButton不同状态下的背景颜色
//
//  Created by mfang032 on 16/9/29.
//  Copyright © 2016年 mfang032. All rights reserved.
//

import UIKit


func createImageWithColor(color: UIColor) -> UIImage? {
    
    let rect = CGRectMake(0.0, 0.0, 1.0, 1.0)
    UIGraphicsBeginImageContext(rect.size)
    let context = UIGraphicsGetCurrentContext()
    CGContextSetFillColorWithColor(context, color.CGColor)
    CGContextFillRect(context, rect)
    let theImage = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    return theImage
}

private var key: Void?

extension UIButton {
    
    
    @IBInspectable var borderColor: UIColor? {
        get {
            return objc_getAssociatedObject(self, &key) as? UIColor
        }
        set(newValue) {
            objc_setAssociatedObject(self, &key, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            layer.borderColor = borderColor?.CGColor
        }
    }
    
    @IBInspectable var borderWidth: CGFloat? {
        get {
            return objc_getAssociatedObject(self, &key) as? CGFloat
        }
        set(newValue) {
            objc_setAssociatedObject(self, &key, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            layer.borderWidth = borderWidth ?? 0
        }
    }
    
    @IBInspectable var cornerRadius: CGFloat? {
        get {
            return objc_getAssociatedObject(self, &key) as? CGFloat
        }
        set(newValue) {
            objc_setAssociatedObject(self, &key, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            layer.cornerRadius = cornerRadius ?? 0
            layer.masksToBounds = cornerRadius != 0
        }
    }
    
    
    @IBInspectable var normalColor: UIColor? {
        get {
            return objc_getAssociatedObject(self, &key) as? UIColor
        }
        set(newValue) {
            objc_setAssociatedObject(self, &key, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            setBackGroundColor(normalColor ?? UIColor.whiteColor(), state: .Normal)
        }
    }
    
    @IBInspectable var highlightedColor: UIColor? {
        get {
            return objc_getAssociatedObject(self, &key) as? UIColor
        }
        set(newValue) {
            objc_setAssociatedObject(self, &key, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            setBackGroundColor(highlightedColor ?? UIColor.lightGrayColor(), state: .Highlighted)
        }
    }
    
    private func setBackGroundColor(backGroundColor: UIColor, state: UIControlState) {
        let image = createImageWithColor(backGroundColor)
        setBackgroundImage(image, forState: state)
    }
}
