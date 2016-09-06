//
//  ViewController.swift
//  KeyBoard
//
//  Created by mfang032 on 10/21/15.
//  Copyright © 2015 mfang032. All rights reserved.
//

import UIKit
let KEYBOARD_GAP = 100.0

class ViewController: UIViewController {

    
    var keyboardWillAppear = false
    var activatedTextField: UITextField?
    var viewMovedDistance: CGFloat = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let textField = UITextField(frame: CGRectMake(10,160,200,30))
        //设置边框样式为圆角矩形
        textField.borderStyle = UITextBorderStyle.RoundedRect
        self.view.addSubview(textField)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "handleKeyboard:", name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "handleKeyboard:", name: UIKeyboardWillHideNotification, object: nil)
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    
    
    
    //MARK: Handle keyboard notification
    func handleKeyboard(notification: NSNotification) {
        var userInfo = notification.userInfo!
        let keyboardSize = (userInfo[UIKeyboardFrameBeginUserInfoKey] as! NSValue).CGRectValue()
        let defaultAnimationDuration = (userInfo[UIKeyboardAnimationDurationUserInfoKey] as! NSNumber).doubleValue
        
        if (activatedTextField != nil) {
            
            let textFieldOrigin = self.activatedTextField?.superview?.convertRect((self.activatedTextField?.frame)!, toView: self.view).origin
            let textFieldDistanceToBottom = self.view.frame.height - textFieldOrigin!.y - (self.activatedTextField?.frame.size.height)!
            if textFieldDistanceToBottom < keyboardSize.height {
                viewMovedDistance = (keyboardSize.height - textFieldDistanceToBottom) + CGFloat(KEYBOARD_GAP)
                //                println(String(format: "toBottom: %f", textFieldDistanceToBottom))
                //                println(String(format: "distance: %f", viewMovedDistance))
                //                println(keyboardSize)
                if viewMovedDistance > keyboardSize.height {
                    viewMovedDistance = keyboardSize.height
                }
            } else {
                viewMovedDistance = 0
            }
        }
        
        UIView.animateWithDuration(defaultAnimationDuration, animations: { () -> Void in
            var viewFrame = self.view.frame
            
            if self.keyboardWillAppear {
                viewFrame.origin.y = -self.viewMovedDistance
            } else {
                viewFrame.origin.y = 0
            }
            self.view.frame = viewFrame
            }) { (completed) -> Void in
                
        }
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

