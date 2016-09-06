//
//  UITableViewCell+DisclosureIndicatorColor.swift
//  PackingList
//
//  Created by mfang032 on 16/5/10.
//  Copyright © 2016年 Razeware LLC. All rights reserved.
//

import UIKit

extension UITableViewCell {
    
    public var disclosureIndicatorColor: UIColor? {
        get {
            return arrowButton?.tintColor
        }
        set {
            var image = arrowButton?.backgroundImageForState(.Normal)
            image = image?.imageWithRenderingMode(.AlwaysTemplate)
            arrowButton?.tintColor = newValue
            arrowButton?.setBackgroundImage(image, forState: .Normal)
        }
    }
    
    public func updateDisclosureIndicatorColorToTintColor() {
        self.disclosureIndicatorColor = self.window?.tintColor
    }
    
    private var arrowButton: UIButton? {
        var buttonView: UIButton?
//        buttonView = self.subviews.last as? UIButton
        self.subviews.forEach {
            print($0)
            if $0 is UIButton {
                buttonView = $0 as? UIButton
                return
            }
        }
        return buttonView
    }
}
