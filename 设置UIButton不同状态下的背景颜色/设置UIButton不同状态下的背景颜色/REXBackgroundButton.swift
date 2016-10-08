//
//  REXBackgroundButton.swift
//  设置UIButton不同状态下的背景颜色
//
//  Created by flc on 16/9/28.
//  Copyright © 2016年 Michael. All rights reserved.
//

import UIKit

@IBDesignable class  REXBackgroundButton: UIButton {
    
    @IBInspectable  var normalColor: UIColor? {
        didSet {
            let normalImage = createImageWithColor(self.frame, color: normalColor)
            setBackgroundImage(normalImage, for: .normal)
        }
    }
    
    @IBInspectable  var highlightedColor: UIColor? {
        didSet{
            let highlightedImage = createImageWithColor(self.frame, color: self.highlightedColor)
            setBackgroundImage(highlightedImage, for: .highlighted)
        }
    }
    
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
            layer.masksToBounds = true
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable var borderColor: UIColor? {
        didSet {
            layer.borderColor = borderColor?.cgColor
        }
    }
    
    private func createImageWithColor( _ frame: CGRect, color: UIColor? = UIColor.white) -> UIImage? {
        
        UIGraphicsBeginImageContext(frame.size)
        if let context = UIGraphicsGetCurrentContext() {
            context.setFillColor((color?.cgColor)!)
            context.fill(frame)
            let theImage = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            return theImage
        }
        return nil
    }

}
