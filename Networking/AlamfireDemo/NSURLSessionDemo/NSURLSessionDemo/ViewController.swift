//
//  ViewController.swift
//  NSURLSessionDemo
//
//  Created by mfang032 on 31/03/2017.
//  Copyright © 2017 mfang032. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
//        let defaultSessionConfiguration = URLSessionConfiguration.default
//        let ephemeralSesssionConfiguration  = URLSessionConfiguration.ephemeral
//        let backgroundSessionConfiguration = URLSessionConfiguration.background(withIdentifier: "test")
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


extension ViewController {
    
    func query(_ parameters: [String: AnyObject]) -> String {
        
        var components: [(String, AnyObject)] = []
        for key in parameters.keys.sorted(by: <) {
            let value = parameters[key]
        }
        return ""
    }
    
    func  queryComponents(key: String, _ value: AnyObject) -> [(String, String)] {
        var components: [(String, String)] = []
        if let dictionary = value as? [String: AnyObject] {
            
        } else if let array = value as? [AnyObject] {
            
            
        } else {
            //components.append(<#T##newElement: (String, String)##(String, String)#>)
        }
        return components
    }
    
    func escape(string: String) -> String {
        let generalDelimitersToEncode = ":#[]@"
        let subDelimitersToEncode = "!$&'()*+,;="
        
        return ""
    }
}
