//
//  ViewController.swift
//  SwiftRuntime
//
//  Created by mfang032 on 28/03/2017.
//  Copyright © 2017 mfang032. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        
        print(RuntimeKit.shared.getClassName(ViewController.self))
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

