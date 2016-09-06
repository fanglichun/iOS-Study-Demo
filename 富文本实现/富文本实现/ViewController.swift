//
//  ViewController.swift
//  富文本实现
//
//  Created by mfang032 on 4/14/16.
//  Copyright © 2016 mfang032. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var button: UIButton!
    
    override func viewDidLoad() {
        let attributedStr = NSMutableAttributedString(string: button.currentTitle!)
        print(attributedStr)
        attributedStr.addAttribute(NSFontAttributeName, value: UIFont(name: "HelveticaNeue", size: 30)!, range: NSMakeRange(0, attributedStr.length - 1))
        button.titleLabel?.attributedText = attributedStr
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

