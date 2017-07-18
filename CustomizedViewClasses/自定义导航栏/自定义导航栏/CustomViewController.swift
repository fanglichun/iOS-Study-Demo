//
//  CustomViewController.swift
//  自定义导航栏
//
//  Created by mfang032 on 2017/7/8.
//  Copyright © 2017年 mfang032. All rights reserved.
//

import UIKit

class CustomViewController: UINavigationController {
    
    
    override class func initialize() {
        let navigationBar = UINavigationBar.appearance()
        let image = UIImage(named: "bg_navigationBar_normal")
        navigationBar.setBackgroundImage(image, for: UIBarMetrics.default)
    }
    
    
//    override func loadView() {
//        let navigationBar = UINavigationBar.appearance()
//        let image = UIImage(named: "bg_navigationBar_normal")
//        navigationBar.setBackgroundImage(image, for: UIBarMetrics.default)
//    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
