//
//  REXServiceManager.swift
//  AFNetworkingCheckNetworkingReachability
//
//  Created by mfang032 on 16/10/17.
//  Copyright © 2016年 mfang032. All rights reserved.
//

import UIKit
import AFNetworking

class REXServiceManager: NSObject {
    
     var manager: AFHTTPRequestOperationManager = AFHTTPRequestOperationManager()
    
//    static let shared = { () -> REXServiceManager in
//        let instance = REXServiceManager()
//        instance.manager = AFHTTPRequestOperationManager()
//        instance.manager?.requestSerializer.timeoutInterval = 10
//        instance.manager?.securityPolicy.validatesDomainName = false
//        instance.manager?.responseSerializer = AFJSONResponseSerializer()
//        instance.manager?.securityPolicy.allowInvalidCertificates = true
//        AFNetworkActivityIndicatorManager.shared().isEnabled = true
//        return instance
//    }()
    
    static let shared: REXServiceManager = {
        $0.manager = AFHTTPRequestOperationManager()
        $0.manager.reachabilityManager.startMonitoring()
        $0.manager.requestSerializer.timeoutInterval = 10
        $0.manager.securityPolicy.validatesDomainName = false
        $0.manager.responseSerializer = AFJSONResponseSerializer()
        $0.manager.securityPolicy.allowInvalidCertificates = true
        AFNetworkActivityIndicatorManager.shared().isEnabled = true
        return $0
    }(REXServiceManager())
    
    func getWithURLString(_ URLString: String, Parameter para: [String: AnyObject], Success successBlock: @escaping (AnyObject) ->Void ) {
        
    }
    
}
