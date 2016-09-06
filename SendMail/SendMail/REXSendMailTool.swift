//
//  REXSendMailTool.swift
//  SendMail
//
//  Created by mfang032 on 11/9/15.
//  Copyright © 2015 mfang032. All rights reserved.
//

import UIKit
import MessageUI
class REXSendMailTool: NSObject, MFMailComposeViewControllerDelegate {
    
    var mailComposeViewController: MFMailComposeViewController = MFMailComposeViewController()
    
    class var sharedInstance : REXSendMailTool {
        struct Static {
            static var onceToken : dispatch_once_t = 0
            static var instance : REXSendMailTool? = nil
        }
        dispatch_once(&Static.onceToken) {
            Static.instance = REXSendMailTool()
            Static.instance?.mailComposeViewController = MFMailComposeViewController()
        }
        return Static.instance!
    }
    
    /**
    config MailComposeViewController
    
    - returns: MailComposeViewController object
    */
     func configuredMailComposeViewController(ToRecipient toRecipients: String, Subject subject: String, MessageBody messagebody: String) -> MFMailComposeViewController {
        
        mailComposeViewController.mailComposeDelegate = self
        
        mailComposeViewController.setToRecipients([toRecipients])
        
        mailComposeViewController.setSubject(subject)
        
        mailComposeViewController.setMessageBody(messagebody, isHTML: true)
        
        return mailComposeViewController
        
    }
    /**
    judging that  is  Email avaliable
    
    - returns: avaliable result
    */
    func isEmailAvaliable() -> Bool {
        
        return MFMailComposeViewController.canSendMail()
    }
    
    func mailComposeController(controller: MFMailComposeViewController, didFinishWithResult result: MFMailComposeResult, error: NSError?) {
        switch result.rawValue {
            
        case MFMailComposeResultCancelled.rawValue:
            print("Mail cancelled")
        case MFMailComposeResultSaved.rawValue:
            print("Mail saved")
        case MFMailComposeResultSent.rawValue:
            print("Mail sent")
        case MFMailComposeResultFailed.rawValue:
            print("Mail Failed:\(error?.localizedDescription)")
        default:
            break
        }
    }
    
    //Show prompt alert with OK button
     func showAlert(title: String, message: String, inViewController: UIViewController) {
        let alertView = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert)
        alertView.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
        inViewController.presentViewController(alertView, animated: true, completion: nil)
    }

    
}
