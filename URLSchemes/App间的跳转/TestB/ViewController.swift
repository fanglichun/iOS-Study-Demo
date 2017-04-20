//
//  ViewController.swift
//  TestB
//
//  Created by mfang032 on 2017/4/11.
//  Copyright © 2017年 mfang032. All rights reserved.
//

import UIKit

let testAUrl = "TestA://"

class ViewController: UIViewController {
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    @IBAction func openUsingURLSchemesA(_ sender: AnyObject) {
        if let url = URL(string: testAUrl) {
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
    
    
    func openScheme(scheme: String) {
        if let url = URL(string: scheme) {
            if #available(iOS 10.0, *) {
                let options = [UIApplicationOpenURLOptionUniversalLinksOnly: true]
                UIApplication.shared.open(url, options: options, completionHandler: { (success) in
                })
            } else {
                let success = UIApplication.shared.openURL(url)
                print("open \(scheme) success:\(success)")
            }
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

