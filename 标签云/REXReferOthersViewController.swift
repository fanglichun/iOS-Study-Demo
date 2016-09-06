//
//  REXReferOthersViewController.swift
//  REX
//
//  Created by mfang032 on 3/29/16.
//  Copyright © 2016 PwC Inc. All rights reserved.
//

import UIKit

class REXReferOthersViewController: UIViewController {
    
    var selectedSkillsArr: Array<Bool> = []
    @IBOutlet weak var topViewHeight: NSLayoutConstraint!
    @IBOutlet weak var middleViewHeight: NSLayoutConstraint!
    @IBOutlet weak var bottomViewHeight: NSLayoutConstraint!
    
    @IBOutlet weak var referOtherReasonView: UITextView!
    @IBOutlet weak var tagCloudView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
