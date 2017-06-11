//
//  ViewController.swift
//  HLS播放视频
//
//  Created by mfang032 on 2017/6/10.
//  Copyright © 2017年 mfang032. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let queue = OperationQueue()
        queue.maxConcurrentOperationCount = 1 //equal to 1,stands for serial , greater than 1, stands for curriency
        let op1 = BlockOperation { 
            
        }
        queue.addOperation(op1)
        
        let op2 = BlockOperation { 
            
        }
        
        queue.addOperation(op2)
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

