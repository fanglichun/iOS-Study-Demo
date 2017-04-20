//
//  ViewController.swift
//  ThreadSafe
//
//  Created by mfang032 on 2017/4/6.
//  Copyright © 2017年 mfang032. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    let lock = NSLock()
    let recursiveLock = NSRecursiveLock()
    let conditionalLock = NSConditionLock(condition: 10)
    let semaphore = DispatchSemaphore(value: 5)
    
    let person: Person = Person("Michael Fang", 27)
    
    
    func lockThreadSafe() {
        let queue1 = DispatchQueue(label: "serial1")
        let queue2 = DispatchQueue(label: "serical2")
        queue1.async {
            //            self.lock.lock()
            self.lock.lock()
            self.person.update(name: "Jack", age: 24)
            self.lock.unlock()
            //            self.lock.unlock()
        }
        
        queue2.async {
            self.lock.lock()
            self.person.update(name: "Lucy", age: 25)
            self.lock.unlock()
        }
        
        self.perform(#selector(printInfo), with: nil, afterDelay: 4)
        
    }
    
    /*
    1、除了NSLock之外，还提供了递归锁，递归锁解决了NSLock在同一个线程上不能多次加锁的问题。
    2、NSRecursiveLock defines a lock that may be acquired multiple times bythe same thread without causing a deadlock, a situation where a thread is permanently blocked waiting for itself to relinquish a lock. While the locking thread has oneor more locks, all other threads are prevented from accessing the code protected bythe lock.
    3、NSRecursiveLock定义了一种锁，这种锁能够在同一个线程上多次加锁，而不会引起死锁（一个线程永远的等待自己解锁）。当被锁住的线程有一个或者多个锁的时候，其他线程就不能访问被保护的代码。
 */
    func recursiveLockTreadSafe() {
        let queue1 = DispatchQueue(label: "serial1")
        let queue2 = DispatchQueue(label: "serical2")
        queue1.async {
            self.recursiveLock.lock()
            self.recursiveLock.lock()
            self.person.update(name: "Jack", age: 24)
            self.recursiveLock.unlock()
            self.recursiveLock.unlock()
        }
        
        queue2.async {
            self.lock.lock()
            self.person.update(name: "Lucy", age: 25)
            self.lock.unlock()
        }
        
        self.perform(#selector(printInfo), with: nil, afterDelay: 4)
    }
    
    
    func conditionallockThreadSafe () {
        
        let queue1 = DispatchQueue(label: "serial1")
        let queue2 = DispatchQueue(label: "serical2")
        queue1.async {
            self.conditionalLock.lock(whenCondition: 10)
            self.person.update(name: "Jack", age: 24)
            self.conditionalLock.unlock(withCondition: 10)
        }
        
        queue2.async {
            self.conditionalLock.lock(whenCondition: 10)
            self.person.update(name: "Lucy", age: 25)
            self.conditionalLock.unlock(withCondition: 10)
        }
        
        self.perform(#selector(printInfo), with: nil, afterDelay: 4)

    }
    
    func synchronizedlockThreadSafe() {
        let queue1 = DispatchQueue(label: "serial1")
        let queue2 = DispatchQueue(label: "serical2")
        queue1.async {
            self.lock.lock()
            objc_sync_enter(self)
            self.person.update(name: "Jack", age: 24)
            objc_sync_exit(self)
        }
        
        queue2.async {
            objc_sync_enter(self)
            self.person.update(name: "Lucy", age: 25)
            objc_sync_exit(self)
        }
        
        self.perform(#selector(printInfo), with: nil, afterDelay: 4)

    }
    
    /*
     从本质意义上讲，信号量与互斥锁是有区别：
     
     （1）作用域
     
     信号量：进程间或线程间(linux 仅线程间)
     
     互斥锁：线程间
     
     
     
     （2）上锁时
     
     信号量：只要信号量的 value 大于0，其他线程就可以 sem_wait 成功，成功后信号量的 value 减一。若 value 值不大于0，则 sem_wait 阻塞，直到 sem_post 释放后 value 值加一。一句话，信号量的 value>=0。
     
     互斥锁：只要被锁住，其他任何线程都不可以访问被保护的资源。如果没有锁，获得资源成功，否则进行阻塞等待资源可用。一句话，线程互斥锁的 vlaue 可以为负数。
     
     
     */
    
    func semaphoreThreadSafe() {
        let queue1 = DispatchQueue(label: "serial1")
        let queue2 = DispatchQueue(label: "serical2")
        queue1.async {
            self.semaphore.signal()
            objc_sync_enter(self)
            self.person.update(name: "Jack", age: 24)
            self.semaphore.wait()
        }
        
        queue2.async {
            self.semaphore.signal()
            self.person.update(name: "Lucy", age: 25)
            self.semaphore.wait()
        }
        
        //self.perform(#selector(printInfo), with: nil, afterDelay: 4)
        print(person.description)

    }
    
    func pThreadMutexThreadSafe() {
        var mutex = pthread_mutex_t()

        pthread_mutex_init(&mutex, nil)
        let queue1 = DispatchQueue(label: "serial1")
        let queue2 = DispatchQueue(label: "serical2")
        queue1.async {
            pthread_mutex_lock(&mutex)
            self.person.update(name: "Michael", age: 57)
            pthread_mutex_unlock(&mutex)
        }
        
        queue2.async {
            pthread_mutex_lock(&mutex)
            self.person.update(name: "Henry", age: 20)
            pthread_mutex_unlock(&mutex)
        }
        
        self.perform(#selector(printInfo), with: nil, afterDelay: 4)
        
    }
    
    func distributedLock() {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
//        lockThreadSafe()
//        recursiveLockTreadSafe()
//        conditionallockThreadSafe()
//        synchronizedlockThreadSafe()
        semaphoreThreadSafe()
//        pThreadMutexThreadSafe()
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func printInfo() {
        NSLog("%@ %d", person.name ?? "",person.age ?? 0)
        
    }
    
}

