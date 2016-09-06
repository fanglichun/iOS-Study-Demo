//: Playground - noun: a place where people can play

import UIKit

let dict = ["freelancerLanguageId": 0,
            "language":"Pashto",
            "languageCode": "ps",
            "languageId": 180 ,
            "profileId": 3464,
            "rowState": 0]

let dict1 = ["freelancerLanguageId": 0,
             "language":"Pashto",
             "languageCode": "ps",
             "languageId": 180 ,
             "profileId": 3464,
             "rowState": 0]
let dict2 = ["freelancerLanguageId": 0,
             "language":"Pashto",
             "languageCode": "ps",
             "languageId": 180 ,
             "profileId": 3464,
             "rowState": 0]
let data = ["freelancerLanguages":[dict, dict1, dict2]]

var dataSource = NSMutableDictionary(dictionary: data)
var dataArr = NSMutableArray()
for (key, value) in dataSource  {
    print(value)
    dataArr.addObject(value)
}
print(dataArr)
var i = -1
for dict in dataArr {
    if var _dict = dict as? [String: NSObject] {
        for (key ,value) in (dict as? [String: NSObject ])!{
            i = i + 1
            if key == "rowState" {
                _dict["rowState"] = 1
                dataArr[i] = _dict
                print(i)
            }
            
        }
    }
}
print("dataArr:\(dataArr)")


