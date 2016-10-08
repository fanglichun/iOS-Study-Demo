//
//  ViewController.swift
//  UIButton不同状态下的背景颜色
//
//  Created by mfang032 on 16/9/29.
//  Copyright © 2016年 mfang032. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var setttingBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}


extension UIStoryboard {
    
    enum StoryBoard: String {
        case Main
        case Launch
    }
    
    convenience init(storyboard: StoryBoard, bundle: Bundle? = nil) {
        self.init(name:storyboard.rawValue, bundle: bundle )
    }
}
