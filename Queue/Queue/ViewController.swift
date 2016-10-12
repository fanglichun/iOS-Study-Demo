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
        customizeQueueAsync()
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
}

