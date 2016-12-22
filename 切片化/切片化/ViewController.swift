//
//  ViewController.swift
//  切片化
//
//  Created by mfang032 on 16/11/22.
//  Copyright © 2016年 mfang032. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let manager1 =  REXManager.manager
        let manager2 = REXManager.manager
        let shared1 = REXManager.shared
        let shared2 = REXManager.shared
        
        print(manager1)
        print(manager2)
        print(shared1)
        print(shared2)

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

