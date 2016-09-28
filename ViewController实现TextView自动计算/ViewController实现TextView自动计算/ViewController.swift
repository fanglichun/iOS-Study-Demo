//
//  ViewController.swift
//  ViewController实现TextView自动计算
//
//  Created by mfang032 on 16/9/26.
//  Copyright © 2016年 mfang032. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {
    @IBOutlet weak var tableView: UITableView!
    
    var tableViewOffset: CGFloat = 0
    var textIndexPath: IndexPath?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        var nib = UINib(nibName: "TextViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "TextViewCell")
        nib = UINib(nibName: "LabelTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "LabelTableViewCell")
        tableView.estimatedRowHeight = 100
        tableView.rowHeight = UITableViewAutomaticDimension
        registerForKeyboardNotifications()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func registerForKeyboardNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShowNotification(_:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHideNotification(_:)), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }

    
    func keyboardWillShowNotification(_ notification: Notification) {
        
        guard let userInfo = (notification as NSNotification).userInfo else { return }
        let keyBoardFrame = (userInfo[UIKeyboardFrameBeginUserInfoKey] as! NSValue).cgRectValue
        if let indexPath = textIndexPath {
            let cell = self.tableView.cellForRow(at: indexPath)
            if let rect = cell?.convert((cell?.contentView.frame)!, to: self.view) {
                let yValue = rect.maxY
                if self.view.bounds.height - yValue < keyBoardFrame.height {
                    let offSetY = (yValue + keyBoardFrame.height - self.view.bounds.height) + 20
                    UIView.animateKeyframes(withDuration: 0.5, delay: 0.2, options: UIViewKeyframeAnimationOptions(), animations: {
                        self.tableView.contentOffset.y += offSetY
                        self.tableView.contentInset = UIEdgeInsetsMake(0, 0, offSetY, 0)
                        self.tableViewOffset = offSetY
                        }, completion: nil)
                }
            }
        }
    }
    
    func keyboardWillHideNotification(_ notification: Notification) {
        
        UIView.animateKeyframes(withDuration: 0.3, delay: 0.0, options: UIViewKeyframeAnimationOptions(), animations: {
            if self.tableView.contentOffset.y - self.tableViewOffset <= 0 {
                self.tableView.contentOffset.y = 0
            } else {
                self.tableView.contentOffset.y -= self.tableViewOffset
            }
            self.tableView.contentInset = UIEdgeInsets.zero
            self.tableViewOffset = 0
            }, completion: nil)
    }
    
    
//    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        view.endEditing(true)
//    }
}

extension ViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if (indexPath as NSIndexPath).row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "LabelTableViewCell") as! LabelTableViewCell
            return cell
        } else  {
            let cell = tableView.dequeueReusableCell(withIdentifier: "TextViewCell") as! TextViewCell
            cell.tableView = tableView
            cell.selectionStyle = .none
            cell.beginEditCallback = { [weak self] in
                self?.textIndexPath = indexPath
            }
            return cell
        }
//        else {
//            let cell = tableView.dequeueReusableCellWithIdentifier("LabelTableViewCell") as! LabelTableViewCell
//            return cell
//        }
    }
}

