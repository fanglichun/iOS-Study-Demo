//
//  ViewController.swift
//  贝塞尔曲线
//
//  Created by mfang032 on 16/11/19.
//  Copyright © 2016年 mfang032. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let aPath = UIBezierPath()
        
        aPath.moveToPoint(CGPoint(x: 100.0, y: 0.0))
        
        aPath.addLineToPoint(CGPoint(x: 200.0, y: 40.0))
        aPath.addLineToPoint(CGPoint(x: 160, y: 140))
        aPath.addLineToPoint(CGPoint(x: 40, y: 140))
        aPath.addLineToPoint(CGPoint(x: 0.0, y: 40.0))
        
        aPath.closePath()
        
        view.layer.shadowPath = aPath.CGPath
        
        
        
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func degreeToRadious(degrees: Double, f: Double -> Double) ->Double {
        return f(degrees)
    }
}

