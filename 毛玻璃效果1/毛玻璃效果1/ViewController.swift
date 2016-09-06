//
//  ViewController.swift
//  毛玻璃效果1
//
//  Created by mfang032 on 10/28/15.
//  Copyright © 2015 mfang032. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    var imageView: UIImageView?
    
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        imageView = UIImageView(frame: self.view.bounds)
        imageView?.image = UIImage(named: "")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    


}

