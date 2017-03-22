//
//  CustomView.swift
//  设置UIButton不同状态下的背景颜色
//
//  Created by flc on 16/9/28.
//  Copyright © 2016年 Michael. All rights reserved.
//

import UIKit

@IBDesignable class MyCustomView: UIView {
    
    @IBInspectable var buttonTitleColor: UIColor!         //  button title color
    @IBInspectable var buttonTitle: String!               //  button title
    @IBInspectable var buttonFrame: CGRect!               //  button frame
    
    var myButton: UIButton!
    
    override init(frame: CGRect) {
        // init stored properties
        buttonTitleColor = UIColor.red
        buttonTitle = "button title"
        buttonFrame = CGRect(x: 0, y: 0, width: 100, height: 50)
        
        myButton = UIButton(frame: buttonFrame)
        myButton.setTitleColor(buttonTitleColor, for: .normal)
        myButton.setTitle(buttonTitle, for: .normal)
        
        // call super initializer
        super.init(frame: frame)
        
        // add button to self
        addSubview(myButton)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        buttonTitleColor = UIColor.red
        buttonTitle = "button title"
        buttonFrame = CGRect(x: 0, y: 0, width: 100, height: 50)
        
        myButton = UIButton(frame: buttonFrame)
        myButton.setTitleColor(buttonTitleColor, for: .normal)
        myButton.setTitle(buttonTitle, for: .normal)
        super.init(coder: aDecoder)
        addSubview(myButton)

    }
    
 
    
    override func layoutSubviews() {
        // refresh button state through attribute inspector
        myButton.setTitleColor(buttonTitleColor, for: .normal)
        myButton.setTitle(buttonTitle, for: .normal)
    }
    
}
