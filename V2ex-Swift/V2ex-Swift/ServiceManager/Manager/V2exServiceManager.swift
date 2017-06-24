//
//  V2exServiceManager.swift
//  V2ex-Swift
//
//  Created by mfang032 on 2017/6/24.
//  Copyright © 2017年 mfang032. All rights reserved.
//

import UIKit
import Alamofire

typealias CompletionCallbackBlcok = (_ response: Any?, _ error: Error?) ->Void

class V2exServiceManager: NSObject {
    
    static let shared: V2exServiceManager = {
        let instance = V2exServiceManager()
        return instance
    }()
    

}
