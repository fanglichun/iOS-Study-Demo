//
//  ItemDetailViewController.swift
//  CheckLists
//
//  Created by mfang032 on 16/6/2.
//  Copyright © 2016年 mfang032. All rights reserved.
//

import UIKit

//MARK: delegate decalaration

@objc protocol itemDetailViewControllerDelegate: class {
    
    func itemDetailViewControllerDidCancel(controller: itemDetailViewController)
    
    func itemDetailViewControllerDidAdd(controller: itemDetailViewController, didFinishAddingItem item: ChecklistItem)
    
    func itemDetailViewControllerDidEdit(controller: itemDetailViewController, didFinishEditingItem item: ChecklistItem)
    
    optional func ss(s: String, s1: String)
    optional func ss(s: String, s2: String)
    
}





class itemDetailViewController: UITableViewController {
    
    //MARK: IBOutlet
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var doneBarButton: UIBarButtonItem!
    @IBOutlet weak var cancelBarButton: UIBarButtonItem!
    
    //MARK: delegate attribute
    
    weak var delegate: itemDetailViewControllerDelegate?
    var itemToEdit: ChecklistItem?
    //    var editItemText: ((String) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let footerView = UIView(frame: CGRectMake(0, 0, UIScreen.mainScreen().bounds.width, 1))
        tableView.tableFooterView = footerView
        
        if let item = itemToEdit {
            title = "Edit Item"
            textField.text = item.text
            doneBarButton.enabled = true
        }
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        textField.becomeFirstResponder()
    }
    
    override func tableView(tableView: UITableView, willSelectRowAtIndexPath indexPath: NSIndexPath) -> NSIndexPath? {
        return nil
    }
    
    
    @IBAction func cancel() {
        
        print("cancel")
        textField.text = ""
        delegate?.itemDetailViewControllerDidCancel(self)
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func done() {
        
        print("done")
        if let item = itemToEdit {
            item.text = textField.text!
            delegate?.itemDetailViewControllerDidEdit(self, didFinishEditingItem: item)
        } else {
            let item = ChecklistItem()
            item.text = textField.text!
            item.checked = false
            delegate?.itemDetailViewControllerDidAdd(self, didFinishAddingItem: item)
        }
    }
    
}

extension itemDetailViewController: UITextFieldDelegate {
    
    func textFieldDidEndEditing(textField: UITextField) {
        print(textField.text)
    }
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        
        let oldText: NSString = textField.text!
        let newText: NSString = oldText.stringByReplacingCharactersInRange(range, withString: string)
        doneBarButton.enabled = (newText.length > 0)
        return true
    }
}
