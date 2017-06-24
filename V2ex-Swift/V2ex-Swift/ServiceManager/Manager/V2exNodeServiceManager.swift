//
//  V2exServiceManager+ Node.swift
//  V2ex-Swift
//
//  Created by mfang032 on 2017/6/24.
//  Copyright © 2017年 mfang032. All rights reserved.
//

import Foundation
import Alamofire

extension V2exServiceManager {
    
    
    func getAllNodes(_ all: V2exNodeRouter, completionHander: @escaping (Result<[V2exNode]>) -> Void) {
        Alamofire.request(all)
            .responseJSON { (dataResponse) in
                if let result = dataResponse.value {
                    print(result)
                }
        }
    }
}
