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
        //mainQueueAsync()
        //globalQueueAsync()
        //globalQueueSync()
        //customizeDefalutQueueAsync()
        //customizeDefalutQueueSync()
        //customizeQueueAsync()
        //delayQueue()
        //groupQueue()
        barrierAsync()
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
    func groupQueue() {
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
    
}

