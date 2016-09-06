//
//  ViewController.swift
//  swiftSetAndGet
//
//  Created by mfang032 on 16/5/13.
//  Copyright © 2016年 mfang032. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let stepCounter = StepCounter()
//        stepCounter.totalSteps = 200
//        // About to set totalSteps to 200
//        // Added 200 steps
//        stepCounter.totalSteps = 360
//        // About to set totalSteps to 360
//        // Added 160 steps
//        stepCounter.totalSteps = 896
        // Do any additional setup after loading the view, typically from a nib.
        
        let me = People()
        me.firstName = "Zhang"
        me.lastName  = "San"
        me.age = 20
        print(me.toString())
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

