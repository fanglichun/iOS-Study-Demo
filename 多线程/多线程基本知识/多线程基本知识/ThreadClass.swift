//
//  ThreadClass.swift
//  多线程基本知识
//
//  Created by mfang032 on 31/03/2017.
//  Copyright © 2017 mfang032. All rights reserved.
//

import UIKit

/*
 Thread需要手工管理线程的生命周期
 */
class ThreadClass: NSObject {
    
    func createThread(){
        
        let thread = Thread(target: self, selector: #selector(run), object: nil)
        
        thread.start()
        print("current Thread:\(Thread.current)")
        print(thread.name ?? "")
        
    }
    
    
    func createThread1() {
        let thread1 = Thread {
            print("current thread1: \(Thread.current)")
        }
        thread1.start()
        print(thread1.name ?? "")
        
        Thread.detachNewThread {
            print("current thread3:\(Thread.current)")
        }
    }
    
    
    func run() {
        print("run")
    }

}
