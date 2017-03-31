//
//  OperationClass.swift
//  多线程基本知识
//
//  Created by mfang032 on 31/03/2017.
//  Copyright © 2017 mfang032. All rights reserved.
//

import UIKit

/*Operation和OperationQueue是对GCD的进一步的封装
 
 */

class OperationClass: NSObject {
    
    //可以将执行的任务封装到Operation对象中
    //NSOperation是个抽象类，所以不能封装任务，但可以用他的两个子类进行任务的封装：NSInvocationOperation和NSBlockOperation
    let queue = Operation()
    //将任务添加到NSOperationQueue
    let operationQueue = OperationQueue()
    
    func createOperationBlock() {
        let operation = BlockOperation { 
            print("current thread:\(Thread.current)")
        }
        
        for i in 0..<5 {
            operation.addExecutionBlock({ 
                NSLog("这是第%d次 %@", i, Thread.current)
            })
        }
        /*
         调用一个 NSOperation 对象的 start() 方法来启动这个任务，但是这样做他们默认是 同步执行 的。就算是 addExecutionBlock 方法，也会在 当前线程和其他线程 中执行，也就是说还是会占用当前线程。这是就要用到队列 NSOperationQueue 了。
         
         */
        
    }
    
   
    
    
    

}
