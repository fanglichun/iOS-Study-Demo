//
//  V2exNodeRouter.swift
//  V2ex-Swift
//
//  Created by mfang032 on 2017/6/24.
//  Copyright © 2017年 mfang032. All rights reserved.
//

import Foundation
import Alamofire

struct Router {
    static let baseUrlString = "https://www.v2ex.com"
}
typealias CompletionCallbackBlcok = (_ response: Any?, _ error: Error?) ->Void


enum V2exNodeRouter: URLRequestConvertible {
    
    case all
    case one(String,String)
    case favNode(String)
    
    func asURLRequest() throws -> URLRequest {
        
        var method: HTTPMethod {
            switch self {
            case .all, .favNode,.one:
                return .get
            }
        }
        let url:URL = {
            let relativePath: String
            switch self {
            case .all:
                relativePath = "/api/nodes/all.json"
            case .one:
                relativePath = "/api/nodes/show.json"
            case .favNode(let nodeName):
                relativePath =  "/go/\(nodeName)"
            }
//            let escapedUrlString = (Router.baseUrlString + relativePath).addingPercentEncoding(withAllowedCharacters: CharacterSet.urlFragmentAllowed)
            var url = URL(string: Router.baseUrlString)!
            url.appendPathComponent(relativePath)
            return url
        }()
        
        
        let params: ([String: Any]?) = {
            switch self {
            case .all, .favNode:
                return nil
            case .one(let name, let id):
                if name.length > 0 {
                    return ["node_name": name]
                }
                if id.length > 0 {
                    return ["node_id": id]
                }
                if name.length > 0 && id.length > 0 {
                    return ["node_name": name]
                }
                return nil
            }
        }()
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.rawValue
        let encoding = JSONEncoding.default
        return try encoding.encode(urlRequest, with: params)
    }
}




