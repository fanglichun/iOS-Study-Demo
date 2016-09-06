//
//  ViewController.swift
//  线程依赖
//
//  Created by mfang032 on 16/8/20.
//  Copyright © 2016年 mfang032. All rights reserved.
//

import UIKit

typealias REXServiceCompletionBlock = (result: AnyObject?) -> ()




class ViewController: UIViewController {
    
    var blcok: REXServiceCompletionBlock?
    
    let openrationQueue = NSOperationQueue()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        for _ in 0..<5 {
            let loadData1 = NSBlockOperation {
                print("执行操作1")
            }
            let loadData2 = NSBlockOperation {
                print("执行操作2")
            }
            loadData2.addDependency(loadData1)
            openrationQueue.addOperation(loadData1)
            openrationQueue.addOperation(loadData2)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func execulate(Blcok aBlock: REXServiceCompletionBlock) {
        blcok = aBlock
    }


}

