//
//  ViewController.swift
//  AlertControllerIPad
//
//  Created by mfang032 on 11/4/15.
//  Copyright © 2015 mfang032. All rights reserved.
//

import UIKit
import Kamagari

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
 
     
    
    }

    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        
        
//        // Alert Sample
//        AlertBuilder(title: "Question", message: "Are you sure where Kamagari is?", preferredStyle: .Alert)
//            .addAction(title: "NO", style: .Cancel) { _ in }
//            .addAction(title: "YES", style: .Default) { _ in }
//            .build()
//            .kam_show(animated: true)
        
        // ActionSheet Sample
        if UIDevice.currentDevice().userInterfaceIdiom != .Pad {
            // Sample to show on iPad
            AlertBuilder(title: "Question", message: "Are you sure where Kamagari is?", preferredStyle: .ActionSheet)
                .addAction(title: "NO", style: .Cancel) { _ in }
                .addAction(title: "YES", style: .Default) { _ in }
                .build()
                .kam_show(animated: true)
        } else {
            /*
            Sample to show on iPad
            With setPopoverPresentationProperties(), specify the properties of UIPopoverPresentationController.
            */
            AlertBuilder(title: "Question", message: "Are you sure where Kamagari is?", preferredStyle: .ActionSheet)
                .addAction(title: "YES", style: .Default) { _ in }
                .addAction(title: "Not Sure", style: .Default) { _ in }
                .setPopoverPresentationProperties(sourceView: view, sourceRect: CGRectMake(0, 0, 100, 100), barButtonItem: nil, permittedArrowDirections: .Any)
                .build()
                .kam_show(animated: true)
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

