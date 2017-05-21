//
//  ViewController.swift
//  自定义View视图
//
//  Created by mfang032 on 2017/5/18.
//  Copyright © 2017年 mfang032. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let v1 = CircleView(frame: CGRect(x: (UIScreen.main.bounds.width / 2 - 100) , y: (UIScreen.main.bounds.height / 2 - 100), width: 100, height: 100))
        view.addSubview(v1)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

