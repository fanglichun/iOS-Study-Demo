//: Playground - noun: a place where people can play

import UIKit
import Foundation


/*
 同步遇到了串行
 desc: 先执行任务1，接下来进入线程同步，main队列是是主队列，是串行队列；
 任务3要等待任务2执行完后才能执行，任务2排在了任务3后面，以为这任务2要在任务3执行完毕以后才能执行，所以进入相互等待的死锁局面
 
 */
func case1() {
    
    print("任务1")
    DispatchQueue.main.sync {
        print("任务2")
    }
    print("任务3")
}

/*
 当同步遇到并行
 desc:
 首先执行任务1，接下来会遇到一个同步线程，程序会进入等待。等待任务2执行完成以后，才能继续执行任务3。从DispatchQueue.global可以看出，任务2被加入到了全局的并行队列中，当并行队列执行完任务2以后，返回到主队列，继续执行任务3
 */

func case2() {
    print("任务1")
    DispatchQueue.global().sync {
        print("任务2")
    }
    print("任务3")
}

/*
 同步异步都存在的情况
 desc:
 1.执行任务1；
 2.遇到异步线程，将【任务2、同步线程、任务4】加入串行队列中。因为是异步线程，所以在主线程中的任务5不必等待异步线程中的所有任务完成；
 3.因为任务5不必等待，所以2和5的输出顺序不能确定；
 4.任务2执行完以后，遇到同步线程，这时，将任务3加入串行队列；
 5.又因为任务4比任务3早加入串行队列，所以，任务3要等待任务4完成以后，才能执行。但是任务3所在的同步线程会阻塞，所以任务4必须等任务3执行完以后再执行。这就又陷入了无限的等待中，造成死锁。
 */


func case3() {
    let queue = DispatchQueue(label: "serial queue")
    print("1")
    queue.async {
        print("2")
        queue.sync {
            print("3")
        }
        print("4")
    }
    print("5")
    
}
/*
 异步遇到同步回主线程
 desc:
 
 */
func case4() {
    
    print("1")
    DispatchQueue.global().async {
        print("2")
        DispatchQueue.main.sync {
            print("3")
        }
        print("4")
    }
    print("5")
}

case4()















