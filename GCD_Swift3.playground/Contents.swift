//: Playground - noun: a place where people can play

import UIKit
import Foundation

//var group: DispatchGroup = DispatchGroup()


//global queue sync execute
//when sync,current thread must be blocked until syns thread execute end and execute next code
/*
print("Before: \(Thread.current)")
DispatchQueue.global().sync {
    print("start a sysnc child thread:\(Thread.current)")
}
print("After: \(Thread.current)")



//global queue async execute
//when async, main thread isn't blocked
print("Before: \(Thread.current)")
DispatchQueue.global().async {
    print("start a async child thread:\(Thread.current)")
    
}

print("After: \(Thread.current)")

*/

//create customized queue
//let queue = DispatchQueue(label: "seriesQueue")
//for i in 0..<10 {
//    print(i)
//    queue.async {
//        print("i = \(i)")
//        print("current Thread: \(Thread.current)")
//    }
//}



//print("Before: \(Thread.current)")
//let mainQueue = DispatchQueue.main
//for i in 0...10 {
//    print(i)
//    mainQueue.async(execute: {
//        print("current Thread: \(Thread.current)")
//
//    })
//}
//print("After: \(Thread.current)")
//main queue only produces a thread asynchronously;main queue can't execute synchronously


//create global queue
print("Before: \(Thread.current)")
let globalQueue = DispatchQueue.global()
for i in 0..<10 {
    print(i)
    globalQueue.async(execute: {
        print("i = \(i)")
        print("current Thread: \(Thread.current)")
    })
}
print("After: \(Thread.current)")





//both the queue created by defalult mode and global queue are serial queue




















