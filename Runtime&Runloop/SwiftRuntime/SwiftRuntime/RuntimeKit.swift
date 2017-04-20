//
//  RuntimeKit.swift
//  SwiftRuntime
//
//  Created by mfang032 on 28/03/2017.
//  Copyright © 2017 mfang032. All rights reserved.
//

import UIKit
import ObjectiveC.objc
import ObjectiveC.runtime
import ObjectiveC.message

class RuntimeKit: NSObject {
    
    static var shared = { () -> RuntimeKit in
       let instance = RuntimeKit()
        return instance;
    }()
    
    
    
    func getClassName(_ aClass: AnyClass) ->String {
        
        //let className = class_getName(aClass);
        return NSStringFromClass(aClass).components(separatedBy: ".").last!
        //return "";
    }
    
}
