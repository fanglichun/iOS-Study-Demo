//
//  ViewController.swift
//  iPadAlertController
//
//  Created by mfang032 on 11/4/15.
//  Copyright © 2015 mfang032. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var btn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func btnClicked(sender: AnyObject) {
        
        var alert = UIAlertController(title: nil, message: "请仔细查看", preferredStyle: UIAlertControllerStyle.ActionSheet)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: { (alert:UIAlertAction!) -> Void in
            print("You tapped OK")
        }))
        alert.popoverPresentationController?.sourceView = self.view
        alert.popoverPresentationController?.sourceRect = CGRectMake(0, self.view.bounds.height, self.view.bounds.width, 600)
        self.presentViewController(alert, animated: true, completion: nil)
    }
}

