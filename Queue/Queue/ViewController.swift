//
//  ViewController.swift
//  Queue
//
//  Created by flc on 16/10/12.
//  Copyright © 2016年 Michael. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        mainQueueAsync()
//        globalQueueAsync()
//        globalQueueSync()
//        customizeDefalutQueueAsync()
//        customizeDefalutQueueSync()
//        customizeQueueAsync()
//        delayQueue()
//        groupConcurrentQueue()
//        for _ in 0...5 {
//            groupSerialQueue()
//        }
        //barrierAsync()
//        let globalQueue = DispatchQueue.global(qos: DispatchQoS.QoSClass.userInitiated)
//        let serialQueue = DispatchQueue(label: "SerialQueue")
//        let concurrentQueue = DispatchQueue(label: "ConcurrentQueue", qos: DispatchQoS.userInitiated, attributes: DispatchQueue.Attributes.concurrent, autoreleaseFrequency: DispatchQueue.AutoreleaseFrequency.workItem, target: nil)
//        let delayTime = DispatchTime.now() + DispatchTimeInterval.seconds(10)
//        DispatchQueue.main.asyncAfter(deadline: delayTime, qos: DispatchQoS.userInitiated, flags: DispatchWorkItemFlags.noQoS) {
//            print("delay \(delayTime)s后执行")
//        }
//        let group = DispatchGroup()
        /*
        let myQueue = DispatchQueue(label: "my.queue", attributes: .concurrent)
        let workItem = DispatchWorkItem {
            print("done")
        }
        myQueue.async(execute: workItem)
        print("before waiting")
        workItem.wait()
        print("after waiting")
        */
        /*
        let wirte = DispatchWorkItem(flags: .barrier) {
            // write data
            print("write data ")
        }
        let dataQueue = DispatchQueue(label: "data", attributes: .concurrent)
            dataQueue.async(execute: wirte)*/
        
        /*
        let writeWorkItem = DispatchWorkItem(qos: DispatchQoS.default, flags: DispatchWorkItemFlags.barrier) {
            print("write data ")
        }
        let dataQueue = DispatchQueue(label: "write data Queue", qos: DispatchQoS.default, attributes: DispatchQueue.Attributes.concurrent, autoreleaseFrequency: DispatchQueue.AutoreleaseFrequency.inherit, target: nil)
        dataQueue.async(execute: writeWorkItem)*/
        
        semaphore()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

fileprivate extension ViewController {
    
    func mainQueueAsync() {
        print("Before: \(Thread.current)")
        let mainQueue = DispatchQueue.main
        for i in 0...10 {
            print(i)//time-consuming operation;
            mainQueue.async(execute: {
                print("current Thread: \(Thread.current)")
                
            })
        }
        print("After: \(Thread.current)")
    }
    
    func globalQueueAsync() {
        print("Before: \(Thread.current)")
        let globalQueue = DispatchQueue.global()
        for i in 0...10 {
            print(i)//time-consuming operation;
            globalQueue.async(execute: {
                print("current Thread: \(Thread.current)")
                
            })
        }
        print("After: \(Thread.current)")
    }
    
    func globalQueueSync() {
        print("Before: \(Thread.current)")
        let globalQueue = DispatchQueue.global()
        for i in 0...10 {
            print(i)//time-consuming operation;
            globalQueue.sync(execute: {
                print("current Thread: \(Thread.current)")
                
            })
        }
        print("After: \(Thread.current)")
    }
    
    func customizeDefalutQueueAsync() {
        print("Before: \(Thread.current)")
        let customizeQueue = DispatchQueue(label: "customizeQueueAsync")
        for i in 0...10 {
            print(i)//time-consuming operation;
            customizeQueue.async(execute: {
                print("current Thread: \(Thread.current)")
                
            })
        }
        print("After: \(Thread.current)")
    }
    
    func customizeDefalutQueueSync() {
        print("Before: \(Thread.current)")
        let customizeQueue = DispatchQueue(label: "customizeQueueSync")
        for i in 0...10 {
            print(i)//time-consuming operation;
            customizeQueue.sync(execute: {
                print("current Thread: \(Thread.current)")
                
            })
        }
        print("After: \(Thread.current)")
    }
    
    func customizeQueueAsync() {
        print("Before: \(Thread.current)")
        let queue = DispatchQueue(label: "", qos: .background, attributes: DispatchQueue.Attributes.concurrent, autoreleaseFrequency: DispatchQueue.AutoreleaseFrequency.workItem, target: nil)
        //        let queue = DispatchQueue(label: "queueAsync", qos: DispatchQoS.init(qosClass: DispatchQoS.QoSClass.background, relativePriority: 0), attributes: DispatchQueue.Attributes.concurrent, autoreleaseFrequency: DispatchQueue.AutoreleaseFrequency.workItem, target: nil)
        
        for i in 0...10 {
            print(i)//time-consuming operation;
            queue.async(execute: {
                print("current Thread: \(Thread.current)")
                
            })
        }
        print("After: \(Thread.current)")
        
    }
    
    func customizeGlobal() {
        print("Before: \(Thread.current)")
        let s = DispatchQueue.global(qos: DispatchQoS.QoSClass.default) //userInitiated/background   utility/userInteractive/unspecified/default
        for i in 0...10 {
            print("current Thread \(i): \(Thread.current)")
            s.async(execute: {
                print("current Thread: \(Thread.current)")
                
            })
        }
        print("After: \(Thread.current)")
    }
    
    func delayQueue() {
        let queue = DispatchQueue.global(qos: .default)
        queue.asyncAfter(wallDeadline: DispatchWallTime.now() + 10) {
            print("10s 后执行")
        }
    }
    /*
     DISPATCH_QUEUE_PRIORITY_HIGH:        .userInitiated
     DISPATCH_QUEUE_PRIORITY_DEFAULT:      .default
     DISPATCH_QUEUE_PRIORITY_LOW:          .utility
     DISPATCH_QUEUE_PRIORITY_BACKGROUND:  .background
     */
    func groupConcurrentQueue() {
        let globalQueue = DispatchQueue.global(qos: DispatchQoS.QoSClass.userInitiated)
        let group = DispatchGroup()
        group.enter()
        globalQueue.async(group: group, qos: .userInitiated, flags: DispatchWorkItemFlags.barrier) {
            print("1")
            
        }
        globalQueue.async(group: group, qos: .userInitiated, flags: DispatchWorkItemFlags.barrier) {
            print("2")
            
        }
        globalQueue.async(group: group, qos: .userInitiated, flags: DispatchWorkItemFlags.barrier) {
            print("3")
            
        }
        group.notify(qos: .userInitiated, flags: .barrier, queue: globalQueue) {
            print("completed")
            group.leave()
        }
//        group.wait(wallTimeout: .now() + 5)
//        group.wait(timeout: DispatchTime.now() + 5)
//        print("completed")
    }
    
    func groupSerialQueue() {
       let workIyem = DispatchWorkItem(qos: DispatchQoS.userInitiated, flags: DispatchWorkItemFlags.assignCurrentContext) {
        //assignCurrentContext表示QoS根据创建时的context决定
        }
        let group = DispatchGroup()
        let bookQueue = DispatchQueue(label: "download Book Queue")
        bookQueue.async(group: group, qos: DispatchQoS.userInitiated, flags: DispatchWorkItemFlags.detached) {
            print("download book")
        }
        let videoQueue = DispatchQueue(label: "download Video queue")
        videoQueue.async(group: group, qos: DispatchQoS.userInitiated, flags: DispatchWorkItemFlags.detached) {
            print("download video")
        }
        group.wait()
        group.notify(queue: DispatchQueue.main) {
            print("download completed,refresh UI")
        }
    }
    
    func barrierAsync() {
        writeFile(5)
        let globalQueue = DispatchQueue.global(qos: DispatchQoS.QoSClass.default)
        let group = DispatchGroup()
        globalQueue.async { [weak self] in
            self?.readFile()
        }
        
        globalQueue.async { [weak self] in
            self?.readFile()
        }
        
        globalQueue.async { [weak self] in
            self?.readFile()
        }
        globalQueue.async { [weak self] in
            self?.readFile()
        }
        globalQueue.async(group: group, qos: DispatchQoS.userInitiated, flags: DispatchWorkItemFlags.barrier) { [weak self] in
            self?.writeFile(9)
            self?.readFile()
        }
        
        globalQueue.async { [weak self] in
            self?.readFile()
        }
        
        globalQueue.async { [weak self] in
            self?.readFile()
        }
        globalQueue.async { [weak self] in
            self?.readFile()
        }
    }
    
    func applyAsync() {
//        let globalQueue = DispatchQueue.global(qos: DispatchQoS.QoSClass.default)
//        let array = ["sb", "ssdbsd", "liCHun", "Fang", "Michael"]
//        globalQueue.async(execute: { () -> Void in
//            globalQueue.apply(attributes: 10, iterations: globalQueue) { (index) -> Void in
//                print(index)
//            }
//            print("completed")
//        })
        
    }
    
    private func writeFile(_ num: Int) {
        UserDefaults.standard.set(num, forKey: "Integer_Key")
    }
    
    private func readFile() {
        print(UserDefaults.standard.integer(forKey: "Integer_Key"))
    }
    
    func semaphore() {//The latest time to wait for a signal.
        let semaphore = DispatchSemaphore(value: 5)
        semaphore.signal()
        print(semaphore)
        let delay = semaphore.wait(wallTimeout: DispatchWallTime.distantFuture)
        if delay == DispatchTimeoutResult.success {
            print("success")
            
        }
    }
    
}

