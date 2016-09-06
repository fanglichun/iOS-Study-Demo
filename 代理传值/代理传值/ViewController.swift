//
//  ViewController.swift
//  代理传值
//
//  Created by mfang032 on 11/1/15.
//  Copyright © 2015 mfang032. All rights reserved.
//

import UIKit

class ViewController: UIViewController, AnotherViewControllerDelegate {
    
    var anotherVc: AnotherViewController? = AnotherViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        anotherVc?.delegate = self
        
        anotherVc?.updateViewColorBlock = { (backColor: UIColor) in
            self.view.backgroundColor = backColor
            
        }
        
    }

    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        self.presentViewController(anotherVc!, animated: true, completion: nil)

        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateViewColor(color: UIColor) {
        
         self.view.backgroundColor = color
    }


}

