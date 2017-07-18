//
//  ViewController.swift
//  V2ex-Swift
//
//  Created by mfang032 on 2017/6/24.
//  Copyright © 2017年 mfang032. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
       
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func callServiceAction(_ sender: UIButton) {
//        V2exServiceManager.shared.getAllNodes(.all) { (result) in
//            
//        }
        
//        V2exServiceManager.shared.getNode(V2exNodeRouter.one(name: "olivida", id: "id")) { (result) in
//            
//        }
        V2exServiceManager.shared.favNodeWithName(V2exNodeRouter.favNode(name: "olivida")) { (result) in
            
        }
    }
}

