//: Playground - noun: a place where people can play

import UIKit
import Foundation
import Dispatch

/*
 获取当前线程
 */
func getCurrentThread() -> Thread {
    
    let currentThread = Thread.current
    return currentThread
}

/*
 当前线程休眠
 */
func currentThreadSleep(time: TimeInterval) {
    Thread.sleep(forTimeInterval: time)
}

/*
 获取主队列
 */
func getMainQueue() ->DispatchQueue {
    return DispatchQueue.main
}

/*
 获取全局队列
 para: priority
 desc: 优先级从高到低userInteractive > userInitiated > default > utility > background > unspecified
 */

func getGlobalQueue(priority: DispatchQoS.QoSClass = .default) -> DispatchQueue {
  //Cannot convert value of type 'DispatchQoS' to expected argument type 'DispatchQoS.QoSClass'
    
    return DispatchQueue.global(qos: priority)
    
}

/*
 创建串行队列
 Serial Queue中要等到前面的任务出队列并执行完后，下一个任务才能出队列进行执行;
 串行队列就是认准一个线程，一条道走到黑，比较专注
 */

func getSerialQueue(label: String) ->DispatchQueue {
    return DispatchQueue(label: label)
}

/*
 创建并行队列
 Concurrent Queue则不然，只要是队列前面的任务出队列了，并且还有有空余线程，不管前面的任务是否执行完了，下一任务都可以进行出队列;
 并行队列就是能利用其他线程就利用，比较灵活，不钻牛角尖
 */

func getConcurrentQueue(label: String) -> DispatchQueue {
    return DispatchQueue(label: label, attributes: DispatchQueue.Attributes.concurrent)
}

func performQueuesUseSynchronization(queue: DispatchQueue) {
    
    for i in 1...3 {
        queue.sync {
            currentThreadSleep(time: 1)
            print("当前执行的线程:\(getCurrentThread())")
            print("执行\(i)")
        }
    }
    print("all queues使用同步方式执行完毕")
}

func performQueuesUseAsynchronization(queue: DispatchQueue) {
    
    let serialQueue = getSerialQueue(label: "serialQueue")
    for i in 0..<3 {
        queue.async {
            currentThreadSleep(time: 1)//Double(arc4random() % 3)
            let currentThread = getCurrentThread()
            serialQueue.async {
                print("Sleep的线程:\(currentThread)")
                print("当前输出内容的线程:\(getCurrentThread())")
                print("执行\(i): \(queue)\n")
            }

        }
        print("\(i)添加完毕\n")
    }
    print("使用异步方式添加队列")
    
}

//print("同步执行串行队列:\n")
//performQueuesUseSynchronization(queue: getSerialQueue(label: "syn.serial.queue"))
//print("同步执行并行队列:\n")

//performQueuesUseSynchronization(queue: getConcurrentQueue(label: "syn.concurrent.queue"))

//串行队列和并行队列同步执行的效果是一样的,即不会开辟新的线程来执行，会在当前的线程中执行执行任务(如果当前线程是主线程,就会阻塞主线程,因为主线程被阻塞了,就会造成UI卡死现象);
//也就是说现在可以供队列使用的线程只有一个，所以串行队列与并行队列使用同步执行的结果是一样的，都必须等到上一个任务出队列并执行完毕后才可以去执行下一个任务;
//可以使用同步执行的这个特点来为一些代码块加同步锁





//print("异步执行串行队列:\n")
//performQueuesUseAsynchronization(queue: getSerialQueue(label: "asyn.serial.queue"))
//print("异步执行串行队列.\n")
//异步执行并没有阻塞当前线程

//print("异步执行并行队列:\n")
//performQueuesUseAsynchronization(queue: getConcurrentQueue(label: "asyn.concurrent.queue"))
//print("异步执行并行队列.\n")
//异步队列的特点是只要有可用的线程，任务就会出队列进行执行，而不关心之前出队列的任务（Block）是否执行完毕;
//并行队列异步执行中每个任务结束时间有主要由任务本身的复杂度而定的;
//总结：并行队列异步执行时会开辟多个新的线程来执行队列中的任务，队列中的任务出队列的顺序仍然是FIFO，只不过是不需要等到前面的任务执行完而已，只要是有空余线程可以使用就可以按FIFO的顺序出队列进行执行。

//延迟执行： dispatch_after()是异步执行队列中的任务的，也就是说使用dispatch_after()来执行队列中的任务不会阻塞当前任务

/*
 一个是使用dispatch_time()来创建延迟时间，另一个是使用dispatch_walltime()来创建时间;
 前者是取的是当前设备的时间，后者去的是挂钟的时间，也就是绝对时间，如果设备休眠了那么前者也就休眠了；
 而后者是是根据挂钟时间不会有当前设备的状态而左右的。
 */
func delayPerform(seconds: Double) {

    let delayTime = DispatchTime.now() + seconds
    getGlobalQueue().asyncAfter(deadline: delayTime) { 
        
    }
    getGlobalQueue().asyncAfter(deadline: delayTime) {
        print("当前线程:\(getCurrentThread())\n dispatchTime: 延迟\(seconds)秒执行")
    }
    
    let nowInterval = Date().timeIntervalSince1970
    let nowStruct = timespec(tv_sec: Int(nowInterval), tv_nsec: 0)
    let delayWallTime = DispatchWallTime(timespec: nowStruct)
    getGlobalQueue().asyncAfter(wallDeadline: delayWallTime) {
        print("执行线程:\(getCurrentThread())\n dispatchWallTime: 延迟\(seconds)秒执行\n")
    }

    
}


//delayPerform(seconds: 1)

/*维权局队列指定优先级*/
func globalQueuePriority() {
    /*userInteractive
     userInitiated
     default
     utility
     background
     unspecified*/
    let queueUserInteractive = getGlobalQueue(priority: DispatchQoS.QoSClass.userInteractive)
    let queueuUerInitiated = getGlobalQueue(priority: DispatchQoS.QoSClass.userInitiated)
    let queueDefault = getGlobalQueue(priority: DispatchQoS.QoSClass.default)
    let queueUtility = getGlobalQueue(priority: DispatchQoS.QoSClass.utility)
    let queueBackground = getGlobalQueue(priority: DispatchQoS.QoSClass.utility)
    let queueUnspecified = getGlobalQueue(priority: DispatchQoS.QoSClass.unspecified)
    
    queueUserInteractive.async {
        print("queueUserInteractive: \(getCurrentThread())")
    }
    
    queueuUerInitiated.async {
        print("userInteractive: \(getCurrentThread())")
    }
    
    queueDefault.async {
        print("queueDefault: \(getCurrentThread())")
    }
    
    queueUtility.async {
        print("queueUtility: \(getCurrentThread())")
    }
    
    queueBackground.async {
        print("queueBackground: \(getCurrentThread())")
    }
    
    queueUnspecified.async {
        print("queueUnspecified: \(getCurrentThread())")
    }
    
   }



//globalQueuePriority()

let queueBackground = getGlobalQueue(priority: DispatchQoS.QoSClass.utility)

let serialQueue = DispatchQueue(label: "", qos: DispatchQoS.default, attributes: DispatchQueue.Attributes.concurrent, autoreleaseFrequency: DispatchQueue.AutoreleaseFrequency.inherit, target: queueBackground)
queueBackground.setTarget(queue: serialQueue)
queueBackground.setTarget(queue: serialQueue)
//dispatch_set_target_queue(serialQueue, getGlobalQueue(priority: DispatchQoS.QoSClass.userInteractive))

//print(queueBackground.qos)
//print(serialQueue.qos)


/*
 将队列放到任务组中执行有两种方式，一种是使用dispatch_group_async()函数，将队列与任务组进行关联并自动执行队列中的任务。另一种方式是手动的将队列与组进行关联然后使用异步将队列进行执行，也就是dispatch_group_enter()与dispatch_group_leave()方法的使用
 */

/*
 一组队列执行完毕后再执行需要执行的东西,可以使用dispatch_group来执行对哦
 */

func performGroupQueue() {
    print("\n任务自动管理")
    let concurrentQueue = getConcurrentQueue(label: "cn.zeluli");
    let group = DispatchGroup()
    
    for i in 1...3 {
        //'dispatch_group_async' has been replaced by instance method 'DispatchQueue.asynchronously(group:qos:flags:execute:)'
      concurrentQueue.async(group: group, qos: DispatchQoS.default, flags: DispatchWorkItemFlags.assignCurrentContext, execute: {
        print("任务\(i)执行完毕\n")
      })
    }
    //'dispatch_group_notify' has been replaced by instance method 'DispatchGroup.notify(qos:flags:queue:execute:)'
    group.notify(queue: getMainQueue()) {
        print("所有的任务组执行完毕:\n")
    }
    
    /*group.notify(qos: DispatchQoS.default, flags: DispatchWorkItemFlags.assignCurrentContext, queue: getMainQueue()) {
        print("所有的任务组执行完毕:\n")
    }*/
    
    print("异步执行测试,不会阻塞当前线程")
}


//performGroupQueue()


func performGroupUseEnterAndLeave() {
    
    print("\n任务组手动管理")
    let concurrentQueue = getConcurrentQueue(label: "cn.zeluli")
    let group = DispatchGroup()
    
    for i in 1...3 {
        group.enter()
        concurrentQueue.async {
            currentThreadSleep(time: 1)
            print("任务\(i)执行完毕\n")
            group.leave()
        }
    }
    
    group.wait(wallTimeout: DispatchWallTime.distantFuture)
    print("任务组执行完毕")
    group.notify(queue: concurrentQueue) { 
        print("手动管理的队列执行结束ok")
    }
}


//performGroupUseEnterAndLeave()


/*
 信号量机制:同步锁
 使用场景：有时候多个线程对一个数据进行操作的时候，为了数据的一致性，我们只允许一次只有一个线程来操作这个数据。为了保证一次只有一个线程来修改我们的资源数据，我们就得用到信号量同步锁了。
 
 */


func useSemaphoreLock() {
    let concurrentQueue = getConcurrentQueue(label: "cn.zeluli")
    
    // 创建信号量
    let semaphoreLock = DispatchSemaphore(value: 1)
    var testNum = 0
    
    for i in 1...3 {
        concurrentQueue.async {
            semaphoreLock.wait()//上锁
            testNum += 1
            currentThreadSleep(time: Double(1))
            print(getCurrentThread())
            print("第\(i)次执行:testNumber = \(testNum)\n")
            semaphoreLock.signal()//开锁
        }
    }
    print("异步执行测试")
}

//useSemaphoreLock()

/*
 循环之星
 */

func useDisptachApply() {
    print("循环多次执行串行队列")
    let concurrentQueue = getConcurrentQueue(label: "cn.zeluli")
    concurrentQueue.suspend()
    concurrentQueue.resume()
    /*
    dispatch_apply(1, concurrentQueue) { (count) in
        
    }*/
}

func useBarrierAsync() {
    let concurrentQueue = getConcurrentQueue(label: "cn.zeluli")
    for i in 1...3 {
        concurrentQueue.async {
            currentThreadSleep(time: 1)
            print("第一批:\(i)\(getCurrentThread())")
        }
    }
    
    concurrentQueue.async(group: DispatchGroup(), qos: DispatchQoS.default, flags: DispatchWorkItemFlags.barrier) { 
        print("\n第一批执行完毕后才会执行第二批\n\(getCurrentThread())\n")
    }
    
    for i in 1...3 {
        concurrentQueue.async {
            currentThreadSleep(time: 1)
            print("第二批:\(i)\(getCurrentThread())")
        }
    }
    
    print("异步执行测试")
}

useBarrierAsync()























