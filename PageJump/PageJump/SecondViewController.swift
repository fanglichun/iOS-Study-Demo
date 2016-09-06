//
//  SecondViewController.swift
//  PageJump
//
//  Created by mfang032 on 1/19/16.
//  Copyright © 2016 mfang032. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var navigationBar: UINavigationBar!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.orangeColor()
        let backButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Cancel, target: self, action: "backAction")
        self.navigationController?.navigationItem.leftBarButtonItem = backButton
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func backAction(){
        self.dismissViewControllerAnimated(true, completion: nil)
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
