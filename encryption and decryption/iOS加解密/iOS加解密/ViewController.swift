//
//  ViewController.swift
//  iOS加解密
//
//  Created by mfang032 on 2017/4/14.
//  Copyright © 2017年 mfang032. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var pwdTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func login(_ sender: Any) {
        
        guard let username = usernameTextField.text, let pwd = pwdTextField.text else {
            return
        }
        
        guard username.characters.count > 0 && pwd.characters.count > 0  else {
            return
        }
        
        let userDefault = UserDefaults.standard
        let user = userDefault.object(forKey: "username") as! String
        let pwdBase64Str = userDefault.object(forKey: "pwd") as! String
        let pwdData = Data(base64Encoded: pwdBase64Str, options: Data.Base64DecodingOptions(rawValue: 0))
        let decodePwd = String(data: pwdData!, encoding: String.Encoding.utf8)
        print(user)
        print(decodePwd ?? "")
        if user == username && pwd == decodePwd {
            print("success")
        } else {
            print("failure")
        }

//        let utf8EncodeData = pwd.data(using: String.Encoding.utf8)
//        let base64String = utf8EncodeData?.base64EncodedString(options: Data.Base64EncodingOptions(rawValue: UInt(0)))
//        userDefault.set(base64String, forKey: "pwd")
//        userDefault.synchronize()
        
    }
    
    
    @IBAction func logout(_ sender: Any) {
        
        
    }

}


extension ViewController {
    
}
