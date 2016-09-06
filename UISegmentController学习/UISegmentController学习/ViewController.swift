//
//  ViewController.swift
//  UISegmentController学习
//
//  Created by mfang032 on 11/22/15.
//  Copyright © 2015 mfang032. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var segment: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.segment.titleTextAttributesForState(.Normal)
        // set selected defalut is 1
        self.segment.selectedSegmentIndex = 0
        self.segment.tintAdjustmentMode = .Normal
        self.segment.setTitle("My Name", forSegmentAtIndex: 0)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

