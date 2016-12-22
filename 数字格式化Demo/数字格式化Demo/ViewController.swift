//
//  ViewController.swift
//  数字格式化Demo
//
//  Created by mfang032 on 16/11/23.
//  Copyright © 2016年 mfang032. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    var formatterValue: NSInteger = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        textField.keyboardType = .NumberPad
        textField.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        let myIntString = formatterValue.stringFormatedWithSepator
        print(myIntString)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func done(sender: AnyObject) {
        textField.resignFirstResponder()
        view.setNeedsLayout()
    }

}


extension ViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        return true
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        if let value = textField.text where value.characters.count > 0 {
            formatterValue = NSInteger(value)!
        }
    }
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        let textFieldText: NSString = textField.text ?? ""
        let txtAfterUpdate = textFieldText.stringByReplacingCharactersInRange(range, withString: string)
        formatterValue = NSInteger(txtAfterUpdate)!
        textField.text = "\(formatterValue)"
        return true
    }
    
    
}
