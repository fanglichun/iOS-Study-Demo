//
//  ViewController.swift
//  UIPickerView学习
//
//  Created by mfang032 on 10/26/15.
//  Copyright © 2015 mfang032. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate,UIPickerViewDataSource {
    
    var myPickView: UIPickerView?
    
    var provinces = [String: [String]]()
    
    var cities: NSMutableArray? = NSMutableArray()
    
    
    //var cities = [String]()
    
    
    

    
    
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        provinces = ["河南省": ["开封","洛阳","郑州"],
                     "浙江省": ["宁波","杭州"],
                     "安徽省": ["黄山","合肥"]
                    ]
        
        
        for value in provinces.values {
            
            cities?.addObject(value)
            
            
        }
        print(cities)
        
        let button1 = UIButton(frame: CGRectMake(self.view.frame.width/2 - 200, 50, 400, 50))
        button1.setTitle("回到默认状态", forState: UIControlState.Normal)
        button1.addTarget(self, action: "buttonAction", forControlEvents: UIControlEvents.TouchUpInside)
        button1.tag = 1
        
        
        let button2 = UIButton(frame: CGRectMake(self.view.frame.width/2 - 200, 150, 450, 50))
        button2.setTitle("刷新所有元素", forState: UIControlState.Normal)
        button2.addTarget(self, action: "buttonAction", forControlEvents: UIControlEvents.TouchUpInside)
        button2.tag = 2
        
        let button3 = UIButton(frame: CGRectMake(self.view.frame.width/2 - 200, 250, 400, 50))
        button3.setTitle("显示当前选中省市", forState: UIControlState.Normal)
        button3.addTarget(self, action: "buttonAction", forControlEvents: UIControlEvents.TouchUpInside)
        button3.tag = 3
        
        myPickView = UIPickerView(frame: CGRectMake(0, self.view.frame.height - 200, self.view.frame.width, 200))
        myPickView?.delegate = self
        myPickView?.dataSource = self
        
        self.view.addSubview(button1)
        self.view.addSubview(button2)
        self.view.addSubview(button3)
        self.view.addSubview(myPickView!)
        
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
         return 2
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        if 0 == component {
            return provinces.keys.count
        } else {
            return provinces.count
        }
        
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if 0 == component {
            return "河南"
        } else {
            return cities?.objectAtIndex(row) as! String
            
            
            
        }
        
      
    }
  

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

