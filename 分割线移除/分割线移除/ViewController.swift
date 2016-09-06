//
//  ViewController.swift
//  分割线移除
//
//  Created by mfang032 on 16/5/20.
//  Copyright © 2016年 mfang032. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    var dataSource = ["Michael","Michael","Michael", "Michael", "Michael", "Michael", "Michael", "Michael", "Michael", "Michael", "Michael", "Michael", "Michael", "Michael", "Michael", "Michael", "Michael", "Michael", "Michael","Michael"]

    override func viewDidLoad() {"Michael"
        super.viewDidLoad()
        
//        let rect = CGRect(x: 0, y: 0, width: UIScreen.mainScreen().bounds.size.width, height: 1)
//        self.tableView.tableFooterView = UIView(frame: rect)
//        self.tableView.tableFooterView?.backgroundColor = UIColor.clearColor()
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 20
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = dataSource[indexPath.row]
        return cell
    }
    
    override func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.01
    }
    
    
    override func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 10
    }
    
    
//    override func tableView(tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
//        return nil
//    }
}

