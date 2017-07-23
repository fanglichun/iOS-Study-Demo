//: Playground - noun: a place where people can play

import UIKit

func printLog<T>(_ message: T, file: String = #file, method: String = #function,line: Int = #line) {
    #if DEBUG
        debugPrint("\((file as NSString).lastPathComponent)[\(line)], \(method): \(message)")
    #endif
}

func dPrint(_ item: @autoclosure () -> Any, file: String = #file, method: String = #function, line: Int = #line) {
    #if DEBUG
        debugPrint("\((file as NSString).lastPathComponent)[\(line)], \(method): \(item())")
    #endif
}


dPrint("message")

let s = 5;
dPrint(s)



