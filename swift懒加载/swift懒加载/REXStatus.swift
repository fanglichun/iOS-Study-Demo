//
//  REXStatus.swift
//  swift懒加载
//
//  Created by mfang032 on 16/5/12.
//  Copyright © 2016年 mfang032. All rights reserved.
//

import UIKit

class REXStatus: NSObject {
    
    var name: String?
    var text: String?
    var icon: String?
    var picture: String?
    var vip = false
    var cellHeight: CGFloat = 0
    override init() {
       super.init()
//        print("aaaaaaa")
    }
    
    init(name: String, text: String, icon: String, picture: String) {
        self.name = name
        self.text = text
        self.icon = icon
        self.picture = picture
//        print("bbbbbb")
    }
    
       init(dict: [String: AnyObject]) {
//        self.init()
        super.init()
//        let status = REXStatus()
        self.setValuesForKeysWithDictionary(dict)
//        print("ccccccc")

    }
}
