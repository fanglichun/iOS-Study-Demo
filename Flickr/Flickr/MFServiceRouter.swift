//
//  MFServiceRouter.swift
//  Flickr
//
//  Created by mfang032 on 2017/6/18.
//  Copyright © 2017年 mfang032. All rights reserved.
//

import UIKit
import Alamofire


public enum AuthTokenRouter: URLRequestConvertible {
    static let baseURLPath = "https://api.flickr.com/services/rest"
    static let apiKey = "0a36bb2b02b6b31bd6ee64b03b5d08c7"
    static let secretKey = "f4ee506b070936b2"
    static let authToken = "72157682912808401-2af7a4170c6f2b63"
    static let apiSig = "7e12db789a0c1a8b635b3bd09f82c28e"
    static let format = "json"
    static let nojsoncallback = 1
    static let urlSuffix =
        "&api_key=\(AuthTokenRouter.apiKey)" +
        "&format=\(AuthTokenRouter.format)" +
    "&nojsoncallback=\(AuthTokenRouter.nojsoncallback)" +
//     "&auth_token=\(AuthTokenRouter.authToken)" +
    "&api_sig=\(AuthTokenRouter.apiSig)"
    
//    var method: HTTPMethod {
//        switch self {
//        case .content:
//            return .post
//        case .tags, .colors:
//            return .get
//        }
//    }
    
    case checkToken
    case getFrob
    case getFullToken
    case getToToken
    
    var path: String {
        switch self {
        case .checkToken:
            return "/?method=flickr.auth.checkToken" //+ AuthTokenRouter.urlSuffix
        case .getFrob:
            return "/?method=flickr.auth.getFrob" //+ AuthTokenRouter.urlSuffix
        case .getFullToken:
            return "/?method=flickr.auth.getFullToken" //+ AuthTokenRouter.urlSuffix
        case .getToToken:
            return "/?method=flickr.auth.getToken" //+ AuthTokenRouter.urlSuffix
        }
    }
    
    public func asURLRequest() throws -> URLRequest {
        let urlString = AuthTokenRouter.baseURLPath + path + AuthTokenRouter.urlSuffix
        let escapedUrlString = urlString.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlFragmentAllowed)
        let url = try escapedUrlString?.asURL()
        var request = URLRequest(url: url!)
        print("request: \(request)")
//        request.setValue(AuthTokenRouter.apiKey, forHTTPHeaderField: "api_key")
//        request.setValue(AuthTokenRouter.authToken, forHTTPHeaderField: "auth_token")
//        request.setValue(AuthTokenRouter.apiSig, forHTTPHeaderField: "api_sig")
        request.timeoutInterval = TimeInterval(10 * 1000)
        return request
    }
}

