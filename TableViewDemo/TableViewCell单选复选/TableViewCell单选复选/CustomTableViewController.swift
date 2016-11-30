//
//  CustomTableViewController.swift
//  TableViewCell单选复选
//
//  Created by mfang032 on 16/8/15.
//  Copyright © 2016年 mfang032. All rights reserved.
//

import UIKit

class CustomTableViewController: UITableViewController {
    
    private lazy var dataSource: Array<Person> = []
    private var lastSelectedIndexPath: NSIndexPath?
    private var isSlected = false

    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
    }
    
    private func loadData() {
        for i in 0..<20 {
            let person = Person()
            person.firstName = "Michael" + "\(i)"
            person.fullName = "Michael Fang" + "\(i)"
            self.dataSource.append(person)
        }
        tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return dataSource.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
        let person = dataSource[indexPath.row]
        cell.textLabel?.text = person.firstName
        cell.detailTextLabel?.text = person.fullName
        cell.contentView.backgroundColor = person.isSlected ? UIColor.whiteColor() : UIColor.orangeColor()
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let tempIndexPath = lastSelectedIndexPath
        if tempIndexPath != nil && tempIndexPath != indexPath {
            let person = dataSource[tempIndexPath!.row]
            person.isSlected = false
            tableView.reloadRowsAtIndexPaths([tempIndexPath!], withRowAnimation: .Automatic)
        }
        lastSelectedIndexPath = indexPath
        let person = dataSource[indexPath.row]
        person.isSlected = true
        tableView.reloadRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
    }
}
