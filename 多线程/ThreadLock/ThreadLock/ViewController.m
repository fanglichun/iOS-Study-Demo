//
//  ViewController.m
//  ThreadLock
//
//  Created by mfang032 on 2017/4/6.
//  Copyright © 2017年 mfang032. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    [self case1];//死锁
//    [self case2];//ok
//    [self case3];//死锁
//    [self case4];
    [self case5];
}


/*
 同步遇到了串行
 desc: 先执行任务1，接下来进入线程同步，main队列是是主队列，是串行队列；
 任务3要等待任务2执行完后才能执行，任务2排在了任务3后面，以为这任务2要在任务3执行完毕以后才能执行，所以进入相互等待的死锁局面
 
 */

- (void)case1 {
    NSLog(@"1"); // 任务1
    dispatch_sync(dispatch_get_main_queue(), ^{
        NSLog(@"2"); // 任务2
    });
    NSLog(@"3"); // 任务3
}

/*
 当同步遇到并行
 desc:
 首先执行任务1，接下来会遇到一个同步线程，程序会进入等待。等待任务2执行完成以后，才能继续执行任务3。从DispatchQueue.global可以看出，任务2被加入到了全局的并行队列中，当并行队列执行完任务2以后，返回到主队列，继续执行任务3
 */

- (void)case2 {
    NSLog(@"1"); // 任务1
    dispatch_sync(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
        NSLog(@"2"); // 任务2
    });
    NSLog(@"3"); // 任务3
}

/*
 1.执行任务1；
 2.遇到异步线程，将【任务2、同步线程、任务4】加入串行队列中。因为是异步线程，所以在主线程中的任务5不必等待异步线程中的所有任务完成；
 3.因为任务5不必等待，所以2和5的输出顺序不能确定；
 4.任务2执行完以后，遇到同步线程，这时，将任务3加入串行队列；
 5.又因为任务4比任务3早加入串行队列，所以，任务3要等待任务4完成以后，才能执行。但是任务3所在的同步线程会阻塞，所以任务4必须等任务3执行完以后再执行。这就又陷入了无限的等待中，造成死锁。
 */
- (void)case3 {
    dispatch_queue_t queue = dispatch_queue_create("com.demo.serialQueue", DISPATCH_QUEUE_SERIAL);
    NSLog(@"1"); // 任务1
    dispatch_async(queue, ^{
        NSLog(@"2"); // 任务2
        dispatch_sync(queue, ^{
            NSLog(@"3"); // 任务3
        });
        NSLog(@"4"); // 任务4
    });
    NSLog(@"5"); // 任务5
}

/*
 异步遇到同步回主线程
 desc:
 典型的异步加载数据,回调主线程更新UI那个案例;
 
 首先，将【任务1、异步线程、任务5】加入Main Queue中，异步线程中的任务是：【任务2、同步线程、任务4】。
 
 所以，先执行任务1，然后将异步线程中的任务加入到Global Queue中，因为异步线程，所以任务5不用等待，结果就是2和5的输出顺序不一定。
 
 然后再看异步线程中的任务执行顺序。任务2执行完以后，遇到同步线程。将同步线程中的任务又回调加入到Main Queue中，这时加入的任务3在任务5的后面。
 
 当任务3执行完以后，没有了阻塞，程序继续执行任务4。
 
 从以上的分析来看，得到的几个结果：1最先执行；2和5顺序不一定；4一定在3后面。
 

 
 */
- (void)case4 {
    NSLog(@"1"); // 任务1
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        NSLog(@"2"); // 任务2
        dispatch_sync(dispatch_get_main_queue(), ^{
            NSLog(@"3"); // 任务3
        });
        NSLog(@"4"); // 任务4
    });
    NSLog(@"5"); // 任务5
}

/*
 当我们典型案例4,遇到了主线程上出现无限循环的时候
 */
- (void)case5 {
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        NSLog(@"1"); // 任务1
        dispatch_sync(dispatch_get_main_queue(), ^{
            NSLog(@"2"); // 任务2
        });
        NSLog(@"3"); // 任务3
    });
    NSLog(@"4"); // 任务4
    while (1) {
    }
    NSLog(@"5"); // 任务5
}







- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
