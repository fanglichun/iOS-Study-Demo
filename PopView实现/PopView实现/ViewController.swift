//
//  ViewController.swift
//  PopView实现
//
//  Created by mfang032 on 4/23/16.
//  Copyright © 2016 mfang032. All rights reserved.
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
    
    @IBAction func share(sender: UIButton) {
        
        let popUpViewController = PopUpViewController(nibName: "PopUpViewController", bundle: nil)
        popUpViewController.providesPresentationContextTransitionStyle = true
        popUpViewController.definesPresentationContext = true
        popUpViewController.modalTransitionStyle = .CrossDissolve
        popUpViewController.modalPresentationStyle = .OverCurrentContext
        self.presentViewController(popUpViewController, animated: true, completion: nil)
        
    }


}

