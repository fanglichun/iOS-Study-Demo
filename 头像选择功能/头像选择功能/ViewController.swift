//
//  ViewController.swift
//  头像选择功能
//
//  Created by mfang032 on 10/28/15.
//  Copyright © 2015 mfang032. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    

    
    
    
   
    
    
    @IBAction func chooseImage(sender: AnyObject) {
        

        
        
    }

    
    
    @IBOutlet weak var Portrait: UIImageView!
    
    
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
      
        
        var alert: UIAlertController = UIAlertController(title: nil, message:"test", preferredStyle: UIAlertControllerStyle.ActionSheet)
        
        
        var saveAction = UIAlertAction(title: "Save", style: .Default, handler:{
            (alerts: UIAlertAction!) -> Void in
            print("File saved")
        })
        var deleteAction = UIAlertAction(title: "Delete", style: .Default, handler:{
            (alerts: UIAlertAction!) -> Void in
            print("File delete")
        })
        var cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler:{
            (alerts: UIAlertAction!) -> Void in
        })
        
        
        alert.addAction(saveAction)
        alert.addAction(deleteAction)
        alert.addAction(cancelAction)
        
        self.presentViewController(alert, animated: true, completion: nil)

        
        
        alert.addAction(UIAlertAction(title: "确定", style: .Destructive, handler: {
            action in switch action.style{
            case .Default:
                print("ok")
            case .Cancel:
                print("cancel")
            case .Destructive:
                print("Destructive")
            }
            }
            ))
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

