//
//  ViewController.swift
//  Flickr
//
//  Created by mfang032 on 2017/6/18.
//  Copyright © 2017年 mfang032. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
//        MFServiceManager.shared.check(Token: AuthTokenRouter.checkToken) { (result, error) in
//            guard let auth = result as? [String: Any] else {
//                print(error?.localizedDescription ?? "")
//                return
//            }
//            print(auth)
//        }
        MFServiceManager.shared.getFrob(AuthTokenRouter.getFrob) { (result, error) in
            print(error?.localizedDescription ?? "")
            guard let frob = result as? [String: Any] else {
                return
            }
            
            print(frob)
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

