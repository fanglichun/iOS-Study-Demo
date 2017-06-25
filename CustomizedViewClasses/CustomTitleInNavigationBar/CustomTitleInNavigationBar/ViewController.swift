//
//  ViewController.swift
//  CustomTitleInNavigationBar
//
//  Created by mfang032 on 2017/1/11.
//  Copyright © 2017年 mfang032. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        navigationController?.navigationBar.backgroundColor = UIColor.redColor()
        let button = UIButton(frame: CGRectZero)
        button.setTitle("My Name is Micahel, I love C++, OC, Swiftdsjbkdsdfbjhfbdbkdfdfkjdfjkbdfjkbk", forState: UIControlState.Normal)
        button.sizeToFit()
        button.backgroundColor = UIColor.redColor()
        button.setTitleShadowColor(UIColor.clearColor(), forState: UIControlState.Normal)
        button.titleLabel?.textAlignment = .Center
        
        let label = UILabel(frame: CGRectZero)
        label.backgroundColor = UIColor.clearColor()
        label.textAlignment = .Center
        label.textColor = UIColor.whiteColor()
        navigationItem.titleView = button
        label.text = "My Name is Micahel, I love C++, OC, Swiftdsjbkdsdfbjhfbdbkdfdfkjdfjkbdfjkbk"
        label.sizeToFit()
        let cancel = UIBarButtonItem(title: "Cancel", style: .Plain, target: self, action: #selector(ss))
        navigationItem.leftBarButtonItem = cancel
        let save = UIBarButtonItem(title: "Save", style: .Plain, target: self, action: #selector(ss))
//        navigationItem.rightBarButtonItem = save
        
        
    }
    func ss() {
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

