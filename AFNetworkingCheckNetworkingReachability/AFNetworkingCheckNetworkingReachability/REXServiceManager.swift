//
//  REXServiceManager.swift
//  AFNetworkingCheckNetworkingReachability
//
//  Created by mfang032 on 16/10/17.
//  Copyright © 2016年 mfang032. All rights reserved.
//

import UIKit
import AFNetworking

typealias ServiceCompletionBlock = (_ result: AnyObject?, _ success: Bool, _ responseCode: NSInteger?) -> ()


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
        let manager = AFHTTPRequestOperationManager()
        manager.responseSerializer.acceptableContentTypes = NSSet(objects: "application/json", "text/json", "text/javascript", "text/plain", "text/html") as? Set<AnyHashable>
        $0.manager.reachabilityManager.startMonitoring()
        $0.manager.requestSerializer.timeoutInterval = 10
        $0.manager.securityPolicy.validatesDomainName = false
        $0.manager.responseSerializer = AFJSONResponseSerializer()
        $0.manager.securityPolicy.allowInvalidCertificates = true
        AFNetworkActivityIndicatorManager.shared().isEnabled = true
        return $0
    }(REXServiceManager())
    
    func get(_ URLString: String, Parameter parameter: AnyObject?, HttpType type: String, Completion completionBlock: @escaping ServiceCompletionBlock ) {
        let url = URL(string: URLString)!
        
        let request = NSMutableURLRequest(url: url, cachePolicy: NSURLRequest.CachePolicy.reloadIgnoringCacheData, timeoutInterval: 30)
        request.httpMethod = type
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("text/html", forHTTPHeaderField: "Content-Type")
//        request.allHTTPHeaderFields = ["Content-Type": "application/json"]
        print(request.allHTTPHeaderFields)
        
        do {
            if let para = parameter {
                request.httpBody = try JSONSerialization.data(withJSONObject: para, options: [])
            }
        } catch {
            print(error)
            request.httpBody = nil
        }
        let afOperation = AFHTTPRequestOperation(request: request as URLRequest)
        manager.operationQueue.addOperation(afOperation)
        afOperation.responseSerializer = AFJSONResponseSerializer()
        afOperation.setCompletionBlockWithSuccess({ (operation: AFHTTPRequestOperation, response: Any) in
            var isSuccess = false
            if response is NSDictionary {
                let responseDic = response as? NSDictionary
                let responseStatus = responseDic?.object(forKey: "responseStatus") as? Int
                if responseStatus == 1 {
                    isSuccess = true
                } else {
                    
                }
            } else {
                print("response json is invalid")
            }
            completionBlock(response as AnyObject?, isSuccess, 0)
            
        }) { (operation: AFHTTPRequestOperation, error: Error) in
            completionBlock(error as AnyObject?, false, 1001)
        }
        afOperation.start()
    }
    
}
