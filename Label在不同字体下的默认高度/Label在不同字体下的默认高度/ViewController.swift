//
//  ViewController.swift
//  Label在不同字体下的默认高度
//
//  Created by mfang032 on 16/5/24.
//  Copyright © 2016年 mfang032. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var label:UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        label.sizeToFit()
        
        print(label.frame.height)
        
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

