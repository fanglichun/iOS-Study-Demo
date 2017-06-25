//
//  Config.swift
//  MVVM
//
//  Created by mfang032 on 25/03/2017.
//  Copyright © 2017 mfang032. All rights reserved.
//

import UIKit
import  Foundation

typealias ReturnValueBlock = (_ returnValue: Any?) -> ()
typealias ErrorCodeBlock = (_ errorCode: Any) ->()
typealias FailureBlock = (Void) ->()
typealias NetWorkBlock = (_ netConnetState: Bool) ->()

let ACCESSTOKEN = "2.00NofgBD0L1k4pc584f79cc48SKGdD"
//请求公共微博的网络接口
let REQUESTPUBLICURL = "https://api.weibo.com/2/statuses/public_timeline.json"
let SOURCE           = "source"
let TOKEN            = "access_token"
let COUNT            = "count"

let STATUSES         = "statuses"
let CREATETIME       = "created_at"
let WEIBOID          = "id"
let WEIBOTEXT        = "text"
let USER             = "user"
let UID              = "id"
let HEADIMAGEURL     = "profile_image_url"
let USERNAME         = "screen_name"



