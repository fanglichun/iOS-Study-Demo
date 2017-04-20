//
//  ViewController.swift
//  多线程基本知识
//
//  Created by mfang032 on 31/03/2017.
//  Copyright © 2017 mfang032. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //createOperationBlock()
        threadDependency()
        
        
      
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func createOperationBlock() {
        
        //可以将执行的任务封装到Operation对象中
        //NSOperation是个抽象类，所以不能封装任务，但可以用他的两个子类进行任务的封装：NSInvocationOperation和NSBlockOperation
        
        //将任务添加到NSOperationQueue
        let operationQueue = OperationQueue()
        
        let operation = BlockOperation {
            print("current thread:\(Thread.current)")
        }

        for i in 0..<5 {
            operation.addExecutionBlock({
                NSLog("这是第%d次 %@", i, Thread.current)
            })
        }
        
        //blocks cannot be added after the operation has started executing or finished'
        
        operation.start()//if adding the BlockOperation  to the OperationQueue, not need to call start()
        operationQueue.addOperation(operation)
        operationQueue.maxConcurrentOperationCount = 1//串行
        
        /*
         调用一个 NSOperation 对象的 start() 方法来启动这个任务，但是这样做他们默认是 同步执行 的。就算是 addExecutionBlock 方法，也会在 当前线程和其他线程 中执行，也就是说还是会占用当前线程。这是就要用到队列 NSOperationQueue 了。
         
         */
        
    }
    
    func threadDependency() {
        
        let operation1 = BlockOperation { 
            NSLog("下载图片 - %@", Thread.current)
            Thread.sleep(forTimeInterval: 1.0)
        }
        
        let operation2 = BlockOperation { 
            NSLog("打水印 - %@", Thread.current)
            Thread.sleep(forTimeInterval: 1.0)
        }
        
        let operation3 = BlockOperation { 
            NSLog("上传照片 - %@", Thread.current)
            Thread.sleep(forTimeInterval: 1.0)
        }
        
        operation2.addDependency(operation1)
        operation3.addDependency(operation2)
        let queue = OperationQueue()
        queue.addOperations([operation3, operation2, operation1], waitUntilFinished: false)
        
        //不能添加相互依赖，会死锁，比如 A依赖B，B依赖A
        //可以使用 removeDependency 来解除依赖关系。
        //可以在不同的队列任务之间依赖，反正就是这个依赖是添加到任务身上的，和队列没关系。
    }
    
    /*
     线程同步就是为了防止多个线程抢夺同一个资源造成的数据安全问题，所采取的一种措施
     */
    
    func threadSync() {
        //GCD 
        DispatchQueue.global().sync {
            
        }
        
        //operationQueue
        let operationQueue = OperationQueue()
        let operation = BlockOperation { 
            
        }
        
        operationQueue.addOperation(operation)
        operationQueue.waitUntilAllOperationsAreFinished()
        
        OperationQueue.main.addOperation { () -> Void in
            
        }
        
        
    }
    


}

