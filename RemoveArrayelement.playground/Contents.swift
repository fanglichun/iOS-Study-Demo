//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

var oldArray = ["Andy", "Hanson", "Aaron", "Ruvi", "Tod"]


let newArray = oldArray.filter({
    $0 != "Andy"
})

print(newArray)






func check() -> String {
    
    let  result = NSMutableString()
    
    // 使用正则表达式一定要加try语句
    
    do {
        
        // - 1、创建规则
        
        let pattern = "[a-zA-Z_0-9_一-龥]"
        
        // - 2、创建正则表达式对象
        
        let regex = try NSRegularExpression(pattern: pattern, options: NSRegularExpressionOptions.CaseInsensitive)
        
        // - 3、开始匹配
        
        let res = regex.matchesInString(self, options: NSMatchingOptions(rawValue: 0), range: NSMakeRange(0, self.characters.count))
        
        // 输出结果
        
        for checkingRes in res {
            
            let nn = (self as NSString).substringWithRange(checkingRes.range) as NSString
            
            result.appendString(nn as String)
            
        }
        
    }
        
    catch {
        
        print(error)
        
    }
    
    return result as String
    
}
