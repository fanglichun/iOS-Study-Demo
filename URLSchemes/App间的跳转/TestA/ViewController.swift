//
//  ViewController.swift
//  TestA
//
//  Created by mfang032 on 2017/4/11.
//  Copyright © 2017年 mfang032. All rights reserved.
//

import UIKit

let testBUrl = "TestB://"


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func openUsingURLSchemesB(_ sender: AnyObject) {
        
        if let url = URL(string: testBUrl) {
            guard UIApplication.shared.canOpenURL(url) else {
                return
            }
            
            if #available(iOS 10.0, *) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
                UIApplication.shared.open(url, options: [:], completionHandler: { (isSuccess) in
                    print(isSuccess)
                })
            } else {
                UIApplication.shared.openURL(url)
            }
        }
    }


}

