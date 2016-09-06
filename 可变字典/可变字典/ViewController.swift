//
//  ViewController.swift
//  可变字典
//
//  Created by mfang032 on 4/18/16.
//  Copyright © 2016 mfang032. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var dataSource: NSMutableArray!
    override func viewDidLoad() {
        super.viewDidLoad()
        let dict = ["freelancerLanguageId": 0,
                    "language":"Pashto",
                    "languageCode": "ps",
                    "languageId": 180 ,
                    "profileId": 3464,
                    "rowState": 0]
        
        let dict1 = ["freelancerLanguageId": 0,
                    "language":"Pashto",
                    "languageCode": "ps",
                    "languageId": 180 ,
                    "profileId": 3464,
                    "rowState": 0]
        let dict2 = ["freelancerLanguageId": 0,
                    "language":"Pashto",
                    "languageCode": "ps",
                    "languageId": 180 ,
                    "profileId": 3464,
                    "rowState": 0]
        let data = ["freelancerLanguages":[dict, dict1, dict2]]
        self.dataSource = NSMutableArray()
        dataSource.addObject(data)
//        print(dataSource)
     
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

