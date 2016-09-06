//
//  ViewController.swift
//  ImageBaseEncode
//
//  Created by mfang032 on 10/30/15.
//  Copyright © 2015 mfang032. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
     let image = UIImage(named: "1029_1")
     let encodeStr = image?.imagetoBase64String()
     print(encodeStr)
              
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

