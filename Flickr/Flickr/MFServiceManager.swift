//
//  MFServiceManager.swift
//  Flickr
//
//  Created by mfang032 on 2017/6/18.
//  Copyright © 2017年 mfang032. All rights reserved.
//

import UIKit
import Alamofire
import ObjectMapper

typealias CompletionCallbackBlcok = (_ response: Any?, _ error: Error?) ->Void

class MFServiceManager: NSObject {
    
    static let shared: MFServiceManager = {
        let instance = MFServiceManager()
        return instance
    }()
    
    func check(Token token: AuthTokenRouter, completion: @escaping CompletionCallbackBlcok) {
        
        Alamofire.request(token).responseJSON { (response) in
            print(response.result)
            
            guard response.result.isSuccess else {
                completion(nil, response.result.error)
                return
            }
            
            guard let responseJSON = response.result.value as? [String: Any] else {
                completion(nil, response.result.error)
                return
            }
            print(responseJSON)
            guard let stat = responseJSON["stat"] as? String, stat == "ok" else {
                completion(nil, response.result.error)
                return
            }
            
            guard let auth = responseJSON["auth"] as? [String: Any] else {
                completion(nil, response.result.error)
                return
            }
            completion(auth, nil)
        }
    }
    
    func getFrob(_ frob: AuthTokenRouter, completion: @escaping CompletionCallbackBlcok) {
        
        Alamofire.request(frob).responseJSON { (response) in
            guard response.result.isSuccess else {
                completion(nil, response.result.error)
                return
            }
            
            guard let responseJSON = response.result.value as? [String: Any] else {
                completion(nil, response.result.error)
                return
            }
            
            print(responseJSON)
            guard let stat = responseJSON["stat"] as? String, stat == "ok" else {
                completion(nil, response.result.error)
                return
            }
            guard let frob = responseJSON["frob"] as? [String: Any] else {
                completion(nil, response.result.error)
                return
            }
            completion(frob, nil)
            
        }
    }
}
