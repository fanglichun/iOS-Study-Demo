//
//  ViewController.swift
//  自适应布局
//
//  Created by mfang032 on 20/02/2017.
//  Copyright © 2017 mfang032. All rights reserved.
//

import UIKit

private let pedding: CGFloat = 10
private let btnHeight: CGFloat = 30.0


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        for i in 0...5 {
            let btnWidth = UIScreen.main.bounds.width - 3 * pedding;
            var row = 0;
            let btn = UIButton(type: UIButtonType.custom)
            btn.backgroundColor = UIColor.red
            btn.frame = CGRect(x: pedding, y: pedding, width: btnWidth, height: btnHeight)
            view.addSubview(btn)
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

