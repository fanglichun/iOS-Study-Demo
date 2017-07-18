//
//  MemeoryUtil.swift
//  Snapkit使用
//
//  Created by mfang032 on 2017/7/1.
//  Copyright © 2017年 mfang032. All rights reserved.
//

import Foundation

public struct memoryUtil {
    
    public static func address(_ o: UnsafeRawPointer) -> String {
        let address  = Int(bitPattern: o)
        return String(format: "%p", address)
    }
    
    public static func address<T: AnyObject>(_ ref: T) -> String {
        let address = unsafeBitCast(ref, to: Int.self)
        return String(format: "%p", address)
    }
}
