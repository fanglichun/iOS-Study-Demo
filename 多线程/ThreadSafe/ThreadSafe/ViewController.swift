//
//  ViewController.swift
//  ThreadSafe
//
//  Created by mfang032 on 2017/4/6.
//  Copyright © 2017年 mfang032. All rights reserved.
//


/*
 
 链接：https://www.nowcoder.com/questionTerminal/5f6d704427424a1cb30eeb56af5d5b1f?toCommentId=150578
 来源：牛客网
 
 互斥锁(mutexlock)：
 最常使用于线程同步的锁；标记用来保证在任一时刻，只能有一个线程访问该对象，同一线程多次加锁操作会造成死锁；临界区和互斥量都可用来实现此锁，通常情况下锁操作失败会将该线程睡眠等待锁释放时被唤醒

 自旋锁(spinlock)：
 同样用来标记只能有一个线程访问该对象，在同一线程多次加锁操作会造成死锁；使用硬件提供的swap指令或test_and_set指令实现；同互斥锁不同的是在锁操作需要等待的时候并不是睡眠等待唤醒，而是循环检测保持者已经释放了锁，这样做的好处是节省了线程从睡眠状态到唤醒之间内核会产生的消耗，在加锁时间短暂的环境下这点会提高很大效率
 
 读写锁(rwlock)：
 高级别锁，区分读和写，符合条件时允许多个线程访问对象。处于读锁操作时可以允许其他线程和本线程的读锁， 但不允许写锁，
 处于写锁时则任何锁操作都会睡眠等待；常见的操作系统会在写锁等待时屏蔽后续的读锁操作以防写锁被无限孤立而等待，在操作系统不支持情况下可以用引用计数加写优先等待来用互斥锁实现。 读写锁适用于大量读少量写的环境，但由于其特殊的逻辑使得其效率相对普通的互斥锁和自旋锁要慢一个数量级；值得注意的一点是按POSIX标准 在线程申请读锁并未释放前本线程申请写锁是成功的，但运行后的逻辑结果是无法预测

 递归锁(recursivelock)：
 严格上讲递归锁只是互斥锁的一个特例，同样只能有一个线程访问该对象，但允许同一个线程在未释放其拥有的锁时反复对该锁进行加锁操作； windows下的临界区默认是支持递归锁的，而linux下的互斥量则需要设置参数PTHREAD_MUTEX_RECURSIVE_NP，默认则是不支持
 
 */
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

