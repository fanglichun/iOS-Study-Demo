//
//  MainViewController.swift
//  侧边栏效果
//
//  Created by mfang032 on 10/26/15.
//  Copyright © 2015 mfang032. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    var btn1: UIButton!
    var btn2: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
//        let cancelButton = UIBarButtonItem(title: "Cancel", style: UIBarButtonItemStyle.Plain, target: self, action: "cancelButton:")
//        cancelButton.tintColor = UIColor.whiteColor()
//        self.navigationItem.leftBarButtonItem = cancelButton
        
        
        
        
//        btn1 = UIButton(type: UIButtonType.Custom)
//        btn1.frame = CGRectMake(self.view.frame.width/2 - 100, 300, 100, 100)
//        btn1.setTitle("自定义", forState: UIControlState.Normal)
//        btn1.setTitleColor(UIColor.orangeColor(), forState: UIControlState.Normal)
//        btn1.setTitleShadowColor(UIColor.lightGrayColor(), forState: UIControlState.Normal)
//        btn1.titleLabel?.shadowOffset = CGSizeMake(1.0, 1.0)
//        btn1.titleLabel?.font = UIFont.systemFontOfSize(12)
//        btn1.titleLabel?.lineBreakMode = .ByTruncatingTail
//        btn1.backgroundColor = UIColor(red: 0.8, green: 0.8, blue: 0.8, alpha: 1)
//        btn1.adjustsImageWhenHighlighted = false
//        btn1.adjustsImageWhenDisabled = false
//        btn1.showsTouchWhenHighlighted = true
//        btn1.addTarget(self, action: "buttonActions:", forControlEvents: UIControlEvents.TouchUpInside)
//        btn1.tag = 100
//        self.view.addSubview(btn1)
//        
//        let item = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: "add")
//        self.navigationItem.leftBarButtonItem = item
        
        
        
        
       // btn2 = UIButton.buttonWithType(.System) as UIButton
        
//        btn2 = UIButton(type: .System) as UIButton
//        btn2.frame = CGRectMake(self.view.frame.width/2 - 50, 100, 100, 100)
//        btn2.setBackgroundImage(UIImage(named: ""), forState: UIControlState.Normal)
//        btn2.addTarget(self, action: "buttonActions", forControlEvents: .TouchUpInside)
//        btn2.tag = 102
//        self.view.addSubview(btn2)
        
        
        
        
        
        let sv  = self.revealViewController()
        
        sv.panGestureRecognizer()
        sv.tapGestureRecognizer()
        
        
    }
    
//    func add() {
//        
//    }
//
//    func buttonActions(sender: UIButton) {
//        print(sender.tag)
//    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
