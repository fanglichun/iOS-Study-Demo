//
//  REXManager.swift
//  切片化
//
//  Created by mfang032 on 16/11/22.
//  Copyright © 2016年 mfang032. All rights reserved.
//

import UIKit

class REXManager: NSObject {
    
    var sex: Bool?
    var birthDayDate: NSDate?
    
    static let  manager = REXManager()
    
    static var shared: REXManager = {
        
        let manager = REXManager()
        manager.sex = false
        manager.birthDayDate = NSDate()
        
        return manager
    }()

}
