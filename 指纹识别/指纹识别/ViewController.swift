//
//  ViewController.swift
//  指纹识别
//
//  Created by mfang032 on 3/1/16.
//  Copyright © 2016 mfang032. All rights reserved.
//

import UIKit
import LocalAuthentication
class ViewController: UIViewController {
    
    @IBOutlet weak var btn: UIButton!
    
    let context = LAContext()
    var error: NSError?
    
    
    
    @IBAction func btnClick(sender: AnyObject) {
        if Double(UIDevice.currentDevice().systemVersion) >= 8.0 {
            if context.canEvaluatePolicy(.DeviceOwnerAuthenticationWithBiometrics, error: &error) {
                context.evaluatePolicy(.DeviceOwnerAuthenticationWithBiometrics, localizedReason: "", reply: { (success, evalPolicyError) -> Void in
                    dispatch_async(dispatch_get_main_queue(), { () -> Void in
                        if success {
                            let alertController = UIAlertController(title: "身份验证", message: "验证成功", preferredStyle: UIAlertControllerStyle.Alert)
                            alertController.addAction(UIAlertAction(title: "OK", style: .Default, handler: { (action: UIAlertAction!) -> Void in
                                
                            }))
                            
                        } else {
                            print(evalPolicyError?.localizedDescription)
                        }
                    })
                })
                
            } else {
                switch error!.code {
                case LAError.TouchIDNotEnrolled.rawValue:
                    print("您还没有保存TouchID指纹")
                case LAError.PasscodeNotSet.rawValue:
                    print("您还没有设置密码")
                default :
                    print("TouchID不可用")
                }
                print(error?.localizedDescription)
            }
        }
        
    }
   
    override func viewDidLoad() {
        super.viewDidLoad()
        btn.showsTouchWhenHighlighted = true
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

