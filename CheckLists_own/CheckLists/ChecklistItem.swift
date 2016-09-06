//
//  ChecklistItem.swift
//  CheckLists
//
//  Created by mfang032 on 16/6/1.
//  Copyright © 2016年 mfang032. All rights reserved.
//
import Foundation
class ChecklistItem: NSObject, NSCoding {
    
    var text = ""
    var checked = false
    
    func toggleChecked() {
        checked = !checked
    }
    
    override init() {
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init()
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(text, forKey: "Text")
        aCoder.encodeBool(checked, forKey: "Checked")
    }
}