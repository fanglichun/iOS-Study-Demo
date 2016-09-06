//
//  ViewController.swift
//  iOS自带分享功能实现
//
//  Created by mfang032 on 1/20/16.
//  Copyright © 2016 mfang032. All rights reserved.
//

import UIKit
import Social

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func shareAction(sender: AnyObject) {
        
        let  stringtoshare = "This is a string to share";
        let activityItems = [stringtoshare];
        let activityVC = UIActivityViewController(activityItems: activityItems, applicationActivities: nil)
        activityVC.excludedActivityTypes = [UIActivityTypeAssignToContact, UIActivityTypePrint, UIActivityTypePostToTwitter, UIActivityTypePostToWeibo,UIActivityTypePostToWeibo,UIActivityTypeMessage,UIActivityTypePostToTencentWeibo,UIActivityTypeAirDrop]
        
        self.presentViewController(activityVC, animated: true, completion: nil)
    }

}

