//
//  ViewController.swift
//  @noescape使用
//
//  Created by flc on 16/9/19.
//  Copyright © 2016年 flc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var callback: ( () ->Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func test(willCapturePhotoAnimation: @escaping ( () -> Void)) {
        
    }
    
 

}

