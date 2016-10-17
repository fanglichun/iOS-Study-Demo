//
//  ViewController.swift
//  AFNetworkingCheckNetworkingReachability
//
//  Created by mfang032 on 16/10/17.
//  Copyright © 2016年 mfang032. All rights reserved.
//

import UIKit
import AFNetworking

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        REXServiceManager.shared.manager.reachabilityManager.startMonitoring()
        print(REXServiceManager.shared.manager.reachabilityManager.isReachable)
        print(REXServiceManager.shared.manager.reachabilityManager.networkReachabilityStatus)

        print(AFNetworkReachabilityManager.shared())
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

