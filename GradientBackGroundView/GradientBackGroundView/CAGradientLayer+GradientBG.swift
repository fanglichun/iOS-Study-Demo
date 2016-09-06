//
//  CAGradientLayer+GradientBG.swift
//  GradientBackGroundView
//
//  Created by mfang032 on 3/2/16.
//  Copyright © 2016 mfang032. All rights reserved.
//

import UIKit
extension CAGradientLayer {
    func GradientLayer() -> CAGradientLayer {
        
        let topColor = UIColor(red: (91/255.0), green: (91/255.0), blue: (91/255.0), alpha: 1)
        let buttomColor = UIColor(red: (24/255.0), green: (24/255.0), blue: (24/255.0), alpha: 1)
        
        let gradientColors: [CGColor] = [topColor.CGColor, buttomColor.CGColor]
        let gradientLocations: [CGFloat] = [0.2, 1.0]
        
        let gradientLayer: CAGradientLayer = CAGradientLayer()
        gradientLayer.colors = gradientColors
        gradientLayer.locations = gradientLocations
        
        return gradientLayer
        
    }
}
