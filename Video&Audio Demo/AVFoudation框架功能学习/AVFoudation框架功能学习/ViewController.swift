//
//  ViewController.swift
//  AVFoudation框架功能学习
//
//  Created by mfang032 on 2017/1/5.
//  Copyright © 2017年 mfang032. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let captureDevice = AVCaptureDevice.defaultDevice(withMediaType: AVMediaTypeVideo)
        print(captureDevice)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


fileprivate extension ViewController {
    
    
}
