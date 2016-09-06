//
//  ViewController.swift
//  CheckLists
//
//  Created by mfang032 on 16/5/31.
//  Copyright © 2016年 mfang032. All rights reserved.
//

import UIKit

class ChecklistViewController: UITableViewController {
    
    //MARK: class attributes
    var nameDataSource = ["Walk the dog", "Brush my teeth", "Learn iOS development", "Soccer practice", "Eat ice cream"]
    var items = [ChecklistItem]()
    
    //MARK: life cycle function
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        for name in nameDataSource {
            let item = ChecklistItem()
            item.text = name
            item.checked = true
            items.append(item)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: tableView DataSource function
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return items.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier(
            "ChecklistItem", forIndexPath: indexPath)
        let item = items[indexPath.row]
        //        let label = cell.viewWithTag(1000) as! UILabel
        //        label.text = item.text
        configureTextForCell(cell, withCheckListItem: item)
        configureCheckmarkForCell(cell, withCheckList: item)
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        if let cell = tableView.cellForRowAtIndexPath(indexPath) {
            let item = items[indexPath.row]
            //            item.checked = !item.checked
            item.toggleChecked()
            configureCheckmarkForCell(cell, withCheckList: item)
        }
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        items.removeAtIndex(indexPath.row)
        let indexPaths = [indexPath]
        tableView.deleteRowsAtIndexPaths(indexPaths, withRowAnimation: .Automatic)
    }
    
    //MARK: customize private function
    
    //    private func configureCheckmarkForCell(cell: UITableViewCell, atIndexPath indexPath: NSIndexPath) {
    //        let item = items[indexPath.row]
    //        if item.checked {
    //            cell.accessoryType = .Checkmark
    //        } else {
    //            cell.accessoryType = .None
    //        }
    //    }
    
    private func configureCheckmarkForCell(cell: UITableViewCell, withCheckList item: ChecklistItem) {
        let label = cell.viewWithTag(1001) as! UILabel
        if item.checked {
            //            cell.accessoryType = .Checkmark
            label.text = "√"
        } else {
            //            cell.accessoryType = .None
            label.text = ""
        }
    }
    
    private func configureTextForCell(cell: UITableViewCell, withCheckListItem item: ChecklistItem) {
        let label = cell.viewWithTag(1000) as! UILabel
        label.text = item.text
    }
    
    private func addItem(item: ChecklistItem) {
        let newItemIndex = items.count
        items.append(item)
        let indexPath = NSIndexPath(forRow: newItemIndex, inSection: 0)
        let indexPaths = [indexPath]
        tableView.insertRowsAtIndexPaths(indexPaths, withRowAnimation: .Automatic)
    }
    
    func saveChecklistItems() {
        let data = NSMutableData()
        let archiver = NSKeyedArchiver(forWritingWithMutableData: data)
        archiver.encodeObject(items, forKey: "ChecklistItems")
        archiver.finishEncoding()
    }
    
    //MARK: prepareForSegue function
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "AddItem" {
            if let navigationController = segue.destinationViewController as? UINavigationController {
                if let controller = navigationController.topViewController as? itemDetailViewController {
                    controller.delegate = self
                }
            }
        } else if segue.identifier == "EditItem" {
            if let navigationController = segue.destinationViewController as? UINavigationController {
                if let controller = navigationController.topViewController as? itemDetailViewController {
                    controller.delegate = self
                    if let cell = sender as? UITableViewCell {
                        if let indexPath = tableView.indexPathForCell(cell) {
                            controller.itemToEdit = items[indexPath.row]
                        }
                    }
                }
            }
        }
    }
    
    
}

extension ChecklistViewController: itemDetailViewControllerDelegate {
    
    
    func itemDetailViewControllerDidCancel(controller: itemDetailViewController) {
        
        controller.textField.resignFirstResponder()
        saveChecklistItems()
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func itemDetailViewControllerDidAdd(controller: itemDetailViewController, didFinishAddingItem item: ChecklistItem) {
        addItem(item)
        controller.textField.resignFirstResponder()
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func itemDetailViewControllerDidEdit(controller: itemDetailViewController, didFinishEditingItem item: ChecklistItem) {
        if let index = items.indexOf(item) { // indexOf这个方法必须存在于NSObject的子类中
            let indexPath = NSIndexPath(forRow: index, inSection: 0)
            if let cell = tableView.cellForRowAtIndexPath(indexPath) {
                configureTextForCell(cell, withCheckListItem: item)
            }
        }
        controller.textField.resignFirstResponder()
        dismissViewControllerAnimated(true, completion: nil)
    }
    
}

