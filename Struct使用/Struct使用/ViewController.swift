//
//  ViewController.swift
//  Struct使用
//
//  Created by mfang032 on 2/9/16.
//  Copyright © 2016 mfang032. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func jumpAction(sender: AnyObject) {
        let secondVC = SecondViewController(nibName: "SecondViewController", bundle: nil) as SecondViewController
        self.navigationController?.pushViewController(secondVC, animated: true)
    }

}

