//
//  RootViewController.swift
//  UI基础
//
//  Created by mfang032 on 10/26/15.
//  Copyright © 2015 mfang032. All rights reserved.
//

import UIKit

class RootViewController: UIViewController, UIAlertViewDelegate {
    
    
    var label: UILabel?
    
    
    func originX() -> CGFloat {
        let version: String = UIDevice.currentDevice().systemVersion
        return version >= "7.0" ? 64.0 : 0.0
    }
    
    func button() -> Void {
       let button = UIButton(frame: CGRectMake(30, self.originX(), 100, 30))
        button.setTitle("返回", forState: UIControlState.Normal)
        button.setTitleColor(UIColor.orangeColor(), forState: UIControlState.Selected)
        button.backgroundColor = UIColor.lightGrayColor()
        button.addTarget(self, action: "btnCliked", forControlEvents: UIControlEvents.TouchUpInside)
        self.view .addSubview(button)
        
    }
    
    func label1() -> Void {
        
        self.label = UILabel(frame: CGRectMake(30, self.originX() + 70, 100, 30))
        self.label?.text = "FLC"
        self.label?.backgroundColor = UIColor.clearColor()
        self.label?.textColor = UIColor.redColor()
        self.label?.textAlignment = NSTextAlignment.Center
        self.view.addSubview(self.label!)
        
        
        ///Users/mfang032/Desktop/demo/UI基础/UI基础/RootViewController.swift:58:35: Cannot invoke 'systemFontOfSize' with an argument list of type '(Float)'
        

        
        
        
        
        
    }
    
    
    func btnCliked() -> Void {
        self.view.backgroundColor = UIColor.yellowColor()
        
    }
    func clickSlider(sender: UISlider) {
        
        
        
        
        
        
        
    }
    
    
    
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.button()
        self.label1()
        
        let slider: UISlider = UISlider(frame: CGRectMake(30, self.originX() + 130, 60, 30))
        slider.addTarget(self, action: "clickSlider:", forControlEvents: .ValueChanged)
        slider.maximumValue = 36.0
        slider.minimumValue = 17.0
        self.view.addSubview(slider)
        

        

        // Do any additional setup after loading the view.
        
      
        
        
    }

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
