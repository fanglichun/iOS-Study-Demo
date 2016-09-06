//
//  ViewController.swift
//  StoryBoard使用
//
//  Created by mfang032 on 16/5/11.
//  Copyright © 2016年 mfang032. All rights reserved.
//

import UIKit

class ViewController: UITableViewController, UITextViewDelegate {
    
    
    @IBOutlet weak var descTextView: UITextView!
    @IBOutlet weak var textViewConstraintHeight: NSLayoutConstraint!
    var height : CGFloat = 60

    override func viewDidLoad() {
        super.viewDidLoad()
        self.descTextView.delegate = self
        self.navigationController?.navigationBar.translucent = false
        
        
        let tableHeadView = UIView(frame: CGRectMake(0, 0, UIScreen.mainScreen().bounds.width, 20))
        self.tableView.tableHeaderView = tableHeadView
        self.tableView.tableFooterView = UIView(frame: CGRectZero)
//        self.view.backgroundColor = UIColor.yellowColor()
//        self.descTextView.text = "fjnsfnskjdjkngknjsgkkgjnnksgjjknsgkngskjsgnkgskgskjgskjkjsgjsgsgjknsgngsdsjkgngskjnkjgsnkgsnjkgsngskgsjkngsnjskgngsnsgnsgnjsgjksgsgjknsgkjnksjgnsgjkdgjsdjnksnjgsnjkgsdngsnsgngsnsgnsgnkgsnkgsgssjgknskgjngsjkngsjksgsdgnjkgsdndgsgjkdnjkgsdnjksgdnkgsdknksdgnjkgdnsgndnsgjkdngksjdjkngsdnjkgsdngdjnjgdnjksgdjknsdgjkngdnjksgdjksgdjknjgkdnjkgdnjgdjkgdndjknjkdgnjkdgnjkdgnjkgdnjkdgnjkdjkjkdgnjkdgjkgjdnjdkjnsgnjgsnjsdjngsdjgsdjgnsdgsdkjnkjngsnkjgskjnsgdnjskgdkjnsgdskjnsnkjdnkjsdskgdnjknjgdsnkjsgdnjgkdsnkjsgdsnkgjdnjksgdgsdnsgjkdnjksgdnjkgsdgsnjgnsjk"
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 5
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section == 1 ? 2 : 1
    }
    
    override func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 90
    }
        
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        switch indexPath.section {
        case 2:
            return 60
        case 4:
            return 100
        default:
            return 90
        }
    }
    
}







