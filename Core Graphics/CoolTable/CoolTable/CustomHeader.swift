//
//  CustomHeader.swift
//  CoolTable
//
//  Created by mfang032 on 2017/5/22.
//  Copyright © 2017年 mfang032. All rights reserved.
//

import UIKit

class CustomHeader: UIView {
    
    var titleLabel: UILabel!
    var lightColor: UIColor!
    var darkColor: UIColor!
    fileprivate var coloredBoxRect: CGRect!
    fileprivate var paperRect: CGRect!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.clear;
        isOpaque = false
        titleLabel = UILabel()
        titleLabel.textAlignment = .center
        titleLabel.isOpaque = false
        titleLabel.backgroundColor = UIColor.clear
        titleLabel.font = UIFont.boldSystemFont(ofSize: 20.0)
        titleLabel.textColor = UIColor.white
        titleLabel.shadowColor = UIColor(colorLiteralRed: 0, green: 0, blue: 0, alpha: 0.5)
        titleLabel.shadowOffset = CGSize(width: 0, height: -1)
        addSubview(titleLabel)
        lightColor = UIColor(colorLiteralRed: 105.0/255.0, green: 179.0/255.0, blue: 216.0/255.0 , alpha: 1.0)
        darkColor = UIColor(colorLiteralRed: 21.0/255.0, green: 92.0/255.0, blue: 136.0/255.0, alpha: 1.0)
    }
   
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        
        /*
         
         CGFloat coloredBoxMargin = 6.0;
         CGFloat coloredBoxHeight = 40.0;
         self.coloredBoxRect = CGRectMake(coloredBoxMargin,
         coloredBoxMargin,
         self.bounds.size.width-coloredBoxMargin*2,
         coloredBoxHeight);
         
         CGFloat paperMargin = 9.0;
         self.paperRect = CGRectMake(paperMargin,
         CGRectGetMaxY(self.coloredBoxRect),
         self.bounds.size.width-paperMargin*2,
         self.bounds.size.height-CGRectGetMaxY(self.coloredBoxRect));
         
         self.titleLabel.frame = self.coloredBoxRect;
         */
        
        let coloredBoxMargin: CGFloat = 6.0
        let coloredBoxHeight: CGFloat = 40.0
        coloredBoxRect = CGRect(x: coloredBoxMargin,
                                y: coloredBoxMargin,
                                width: bounds.size.width - 2 * coloredBoxMargin,
                                height: coloredBoxHeight)
        let paperMargin: CGFloat = 9.0
        paperRect = CGRect(x: paperMargin,
                           y: coloredBoxRect.maxY,
                           width: bounds.size.width - 2 * paperMargin,
                           height: bounds.size.height - coloredBoxRect.maxY)
        
        titleLabel.frame = coloredBoxRect
        
    }
    
    override func draw(_ rect: CGRect) {
        let context = UIGraphicsGetCurrentContext()
        
        let whiteColor = UIColor(colorLiteralRed: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        let shadowColor = UIColor(colorLiteralRed: 0.2, green: 0.2, blue: 0.2, alpha: 0.5)
        
        context?.setFillColor(whiteColor.cgColor)
        context?.fill(paperRect)
        context?.saveGState()
        
        context?.setShadow(offset: CGSize(width: 0, height: 2), blur: 3.0, color: shadowColor.cgColor)
        context?.setFillColor(lightColor.cgColor)
        context?.fill(coloredBoxRect)
        context?.restoreGState()
        drawGlossAndGradient(context: context!, rect: coloredBoxRect, startColor: lightColor.cgColor, endColor: darkColor.cgColor)
       
        context?.setStrokeColor(darkColor.cgColor)
        context?.setLineWidth(1.0)
        context?.stroke(rectFor1PxStroke(rect: coloredBoxRect))
        
    }
}
