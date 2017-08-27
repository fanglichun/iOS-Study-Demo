//
//  Objc+Extension.swift
//  Objc-Runtime
//
//  Created by mfang032 on 2017/8/20.
//  Copyright © 2017年 mfang032. All rights reserved.
//

import Foundation
import ObjectiveC.runtime
import ObjectiveC.objc

extension NSObject {
    
    class func swizzleInstanceMethod(_ originalSelector: Selector, newSelector: Selector ) ->Void {
        let originalMethod = class_getInstanceMethod(self, originalSelector)
        let newMethod = class_getInstanceMethod(self, newSelector)
        guard originalMethod != nil && newMethod != nil else { return }
        method_exchangeImplementations(originalMethod, newMethod)
    }
    
    func setAssociated(with key: UnsafeRawPointer, value: Any) ->Void {
        objc_setAssociatedObject(self, key, value, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
    }
    
    func getAssociatedValue(with key: UnsafeRawPointer) ->Any {
        return objc_getAssociatedObject(self, key)
    }
    
    func removeAssociatedValue(with key: UnsafeRawPointer) {
        objc_setAssociatedObject(self, key, nil, .OBJC_ASSOCIATION_ASSIGN)
    }
}

