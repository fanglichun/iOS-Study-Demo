//
//  ServiceManager.swift
//  AFNetworkingCheckNetworkingReachability
//
//  Created by mfang032 on 16/10/19.
//  Copyright © 2016年 mfang032. All rights reserved.
//

import UIKit
import AFNetworking

let baseURL = URL(string: "http://wwww.baidu.com")!

class ServiceManager: AFHTTPSessionManager {
    
    static var shared: ServiceManager = {
        let baseURL = URL(string: "http://wwww.baidu.com")!
        let manager = ServiceManager(baseURL: baseURL, sessionConfiguration: URLSessionConfiguration.default)
        manager.responseSerializer.acceptableContentTypes = NSSet(objects: "application/json", "text/json", "text/javascript", "text/plain", "text/html") as? Set<AnyHashable>
        return manager
        
    }()
}
