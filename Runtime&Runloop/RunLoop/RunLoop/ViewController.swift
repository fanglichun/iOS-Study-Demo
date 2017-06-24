//
//  ViewController.swift
//  RunLoop
//
//  Created by mfang032 on 2017/4/6.
//  Copyright © 2017年 mfang032. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        guard let mainLoop = CFRunLoopGetMain() else {
            return
        }
        print("mainLoop:\(mainLoop)\n\n")

        guard let concurrentloop = CFRunLoopGetCurrent() else {
            return
        }
        
        print("concurrentloop:\(concurrentloop)")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

//RunLoop 实现自动释放池、延迟回调、触摸事件、屏幕刷新等功能的。

