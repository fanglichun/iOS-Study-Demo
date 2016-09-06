//
//  ViewController.swift
//  PageJump
//
//  Created by mfang032 on 1/19/16.
//  Copyright © 2016 mfang032. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var jumpSecondVC: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func jump(sender: AnyObject) {
        let secondVC = SecondViewController(nibName: "SecondViewController", bundle: nil) as SecondViewController
        self.presentViewController(secondVC, animated: true, completion: nil)

    }

}

