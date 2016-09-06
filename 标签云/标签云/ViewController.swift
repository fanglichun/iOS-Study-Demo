//
//  ViewController.swift
//  标签云
//
//  Created by mfang032 on 3/29/16.
//  Copyright © 2016 mfang032. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.translucent = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func jumpNextViewController(sender: AnyObject) {
        let referOtherVC =  REXReferOthersViewController(nibName: "REXReferOthersViewController", bundle: nil) as REXReferOthersViewController
        self.navigationController?.pushViewController(referOtherVC, animated: true)
    }
}

