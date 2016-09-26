//
//  ViewController.swift
//  ViewController实现TextView自动计算
//
//  Created by mfang032 on 16/9/26.
//  Copyright © 2016年 mfang032. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var tableViewOffset: CGFloat = 0
    var textIndexPath: NSIndexPath?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let nib = UINib(nibName: "TextViewCell", bundle: nil)
        tableView.registerNib(nib, forCellReuseIdentifier: "TextViewCell")
        tableView.estimatedRowHeight = 100
        tableView.rowHeight = UITableViewAutomaticDimension
        registerForKeyboardNotifications()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func registerForKeyboardNotifications() {
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(keyboardWillShowNotification(_:)), name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(keyboardWillHideNotification(_:)), name: UIKeyboardWillHideNotification, object: nil)
    }

    
    func keyboardWillShowNotification(notification: NSNotification) {
        
        guard let userInfo = notification.userInfo else { return }
        let keyBoardFrame = (userInfo[UIKeyboardFrameBeginUserInfoKey] as! NSValue).CGRectValue()
        if let indexPath = textIndexPath {
            let cell = self.tableView.cellForRowAtIndexPath(indexPath)
            if let rect = cell?.convertRect((cell?.contentView.frame)!, toView: self.view) {
                let yValue = CGRectGetMaxY(rect)
                if self.view.bounds.height - yValue < keyBoardFrame.height {
                    let offSetY = (yValue + keyBoardFrame.height - self.view.bounds.height) + 20
                    UIView.animateKeyframesWithDuration(0.5, delay: 0.2, options: UIViewKeyframeAnimationOptions.CalculationModeLinear, animations: {
                        self.tableView.contentOffset.y += offSetY
                        self.tableView.contentInset = UIEdgeInsetsMake(0, 0, offSetY, 0)
                        self.tableViewOffset = offSetY
                        }, completion: nil)
                }
            }
        }
    }
    
    func keyboardWillHideNotification(notification: NSNotification) {
        
        UIView.animateKeyframesWithDuration(0.3, delay: 0.0, options: UIViewKeyframeAnimationOptions.CalculationModeLinear, animations: {
            if self.tableView.contentOffset.y - self.tableViewOffset <= 0 {
                self.tableView.contentOffset.y = 0
            } else {
                self.tableView.contentOffset.y -= self.tableViewOffset
            }
            self.tableView.contentInset = UIEdgeInsetsZero
            self.tableViewOffset = 0
            }, completion: nil)
    }

}

extension ViewController: UITableViewDataSource {
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("TextViewCell") as! TextViewCell
        cell.tableView = tableView
        cell.selectionStyle = .None
        cell.beginEditCallback = { [weak self] in
            self?.textIndexPath = indexPath
        }
        return cell
    }
}

