//
//  ViewController.swift
//  自定义导航栏按钮
//
//  Created by mfang032 on 4/28/16.
//  Copyright © 2016 mfang032. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //搜索按钮
        let button1 = UIButton(frame:CGRectMake(0, 0, 18, 18))
        button1.setImage(UIImage(named: "search"), forState: .Normal)
        let barButton1 = UIBarButtonItem(customView: button1)
        self.navigationItem.leftBarButtonItem = barButton1
        
        //设置按钮
        let button2 = UIButton(frame:CGRectMake(0, 0, 18, 18))
        button2.setImage(UIImage(named: "settings"), forState: .Normal)
        let barButton2 = UIBarButtonItem(customView: button2)
        self.navigationItem.leftBarButtonItem = barButton2
        let cancelButton = UIBarButtonItem(title: "Cancel", style: UIBarButtonItemStyle.Plain, target: self, action: Selector("funcd"))
        cancelButton.tintColor = UIColor.whiteColor()
        
        //        cancelButton.setTitleTextAttributes([NSFontAttributeName: UIFont.boldSystemFontOfSize(19)], forState: .Normal)
        self.navigationItem.leftBarButtonItem = cancelButton
        
        //按钮间的空隙
//        let gap = UIBarButtonItem(barButtonSystemItem: .FixedSpace, target: nil,action: nil)
//        gap.width = 15;
        
        //用于消除右边边空隙，要不然按钮顶不到最边上
//        let spacer = UIBarButtonItem(barButtonSystemItem: .FixedSpace, target: nil, action: nil)
//        spacer.width = -10;
        
        //设置按钮（注意顺序）
//        self.navigationItem.rightBarButtonItems = [spacer,barButton2,gap,barButton1]
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

