//
//  ViewController.swift
//  毛玻璃效果
//
//  Created by mfang032 on 10/26/15.
//  Copyright © 2015 mfang032. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        if !UIAccessibilityIsReduceTransparencyEnabled() {
            self.view.backgroundColor = UIColor.clearColor()
            
            let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.Dark)
            let blurEffectView = UIVisualEffectView(effect: blurEffect)
            //always fill the view
            blurEffectView.frame = self.view.bounds
            blurEffectView.autoresizingMask = [.FlexibleWidth, .FlexibleHeight]
            blurEffectView.alpha = 1
            let dialogView = self.view
            dialogView!.alpha = 1.0
            self.view.addSubview(blurEffectView) //if you have more UIViews, use an insertSubview API to place it where needed
            self.view.insertSubview(dialogView!, aboveSubview:blurEffectView)
        }
        else {
            self.view.backgroundColor = UIColor.clearColor()
        }

        
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

