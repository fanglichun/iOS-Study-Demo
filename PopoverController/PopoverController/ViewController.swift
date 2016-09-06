//
//  ViewController.swift
//  PopoverController
//
//  Created by mfang032 on 11/5/15.
//  Copyright © 2015 mfang032. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    class func loadViewControllerFromMainStoryboard (nibName: String) -> UIViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewControllerWithIdentifier(nibName)
        return viewController
    }
    
    //var vc: ViewController?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let popVc: PopViewController = PopViewController()
        
        let nvc: UINavigationController = UINavigationController(rootViewController: popVc)
        
        let pop: UIPopoverController = UIPopoverController(contentViewController: nvc)
        pop.setPopoverContentSize(CGSizeMake(400, 600), animated: true)
        pop.presentPopoverFromRect(CGRectMake(0, 0, 300, 300), inView: self.view, permittedArrowDirections: .Up, animated: true)
        
        

        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

