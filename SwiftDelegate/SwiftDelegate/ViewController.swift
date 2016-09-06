//
//  ViewController.swift
//  SwiftDelegate
//
//  Created by mfang032 on 10/29/15.
//  Copyright © 2015 mfang032. All rights reserved.
//

import UIKit

protocol viewControllerDelegate {
    func controller(controller: ViewController, didAddItem: String)
    
}

class ViewController: UIViewController {
    
    
    var delegate: viewControllerDelegate?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        if let delegate = self.delegate {
            delegate.controller(self, didAddItem: "ffff")
            
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

