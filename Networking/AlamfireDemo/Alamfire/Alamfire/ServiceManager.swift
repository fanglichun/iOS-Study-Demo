//
//  ServiceManager.swift
//  Alamfire
//
//  Created by mfang032 on 2017/4/11.
//  Copyright © 2017年 mfang032. All rights reserved.
//

import UIKit

import Alamofire

class ServiceManager: NSObject {
    
    static let shared: ServiceManager = ServiceManager()

    func downloadImage(_ url: String) {
        
        Alamofire.download(url).responseData { response in
            print("response:\(response)")
            if let data = response.result.value {
                if let image = UIImage(data: data) {
                    print(image)
                }
            }
        }
    }
    
    func request(URL url: String, serviceCompletionBlock: @escaping (_ success: Bool, _ response: Any?, _ error: Error?) ->Void) {
        Alamofire.request(url).responseJSON { (response) in
            serviceCompletionBlock(response.result.isSuccess, response.result.value, response.error)
        }
    }
    
    func validate() {
        
        Alamofire.request("https://httpbin.org/get")
            .validate(statusCode: 200..<300)
            .validate(contentType: ["application/json"])
            .responseData { response in
                print("response:\(response)")
                switch response.result {
                case .success:
                    print("Validation Successful")
                case .failure(let error):
                    print(error)
                }
        }
        
//        let parameters: Parameters = ["foo": "bar"]
        
        // All three of these calls are equivalent
//        Alamofire.request("https://httpbin.org/get", parameters: parameters) // encoding defaults to `URLEncoding.default`
//        Alamofire.request("https://httpbin.org/get", parameters: parameters, encoding: URLEncoding.default)
//        Alamofire.request("https://httpbin.org/get", parameters: parameters, encoding: URLEncoding(destination: .methodDependent))
//        
    }
    
    func getRequest(URL url: String, serviceCompletionBlock: @escaping (_ success: Bool, _ response: Any?, _ error: Error?) ->Void) {
       
        let parameters: Parameters = ["foo": "bar"]
        Alamofire.request(url, method: HTTPMethod.get, parameters: parameters, encoding: URLEncoding.default).responseJSON { (response) in
            if let response = response.result.value {
                print(response)
            }
        }
    }
    
    
}
