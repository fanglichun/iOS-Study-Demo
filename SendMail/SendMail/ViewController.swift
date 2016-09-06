//
//  ViewController.swift
//  SendMail
//
//  Created by mfang032 on 11/9/15.
//  Copyright © 2015 mfang032. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func sendMail(sender: AnyObject) {
        
        let ToRecipient: String = ""
        let subject: String = "'"
        let messagebody: String = ""
        REXSendMailTool.sharedInstance.configuredMailComposeViewController(ToRecipient: ToRecipient, Subject: subject, MessageBody: messagebody)
        if REXSendMailTool.sharedInstance.isEmailAvaliable() {
            self.presentViewController(REXSendMailTool.sharedInstance.mailComposeViewController, animated: true, completion: nil)
        } else {
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

