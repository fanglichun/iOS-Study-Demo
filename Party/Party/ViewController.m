//
//  ViewController.m
//  Party
//
//  Created by mfang032 on 2017/5/9.
//  Copyright © 2017年 mfang032. All rights reserved.
//

#import "ViewController.h"

#import "Party.h"
#import "BNRItem.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
  
    
    
}

- (void)test1 {
    BNRItem * item = [[BNRItem alloc]init];
    NSLog(@"default name:%@", item.itemName);
    
    NSLog(@"%@", [BNRItem randomItem]);
    NSMutableArray *items = [NSMutableArray array];
    for (NSInteger i = 0; i < 10; i ++) {
        BNRItem *item = [BNRItem randomItem];
        [items addObject:item];
    }
    
    //    id lastObject = [items lastObject];
    //某个BRNItem对象收到了count消息， 位于行首的“-”代表接收方是对象， 如果是“+”代表接收方是类
    //    [lastObject count];//Terminating app due to uncaught exception 'NSInvalidArgumentException', reason: '-[BNRItem count]: unrecognized selector sent to instance 0x600000059350'
}
- (void)test {
    //向Party类发送alloc消息，可以创建该类的对象，Party类在收到alloc消息后，会在内存中创建对象(在堆上创建)，并返回指向新对象的指针；
    Party *partyInstance = [Party alloc];
    NSLog(@"%p", partyInstance);
    //Party类收到alloc消息，alloc方法会返回指向新创建对象的指针， 最后， 未初始化的对象会受到init方法，返回初始化的对象指针，并将指针保存在变量中；
    Party *party = [[Party alloc] init];
    NSLog(@"%p", party);
    partyInstance = nil;
    party = nil;
    NSLog(@"%p", partyInstance);
    
    NSLog(@"%p", party);
    [party sendReminder];//OC中允许想某个值为nil的变量发送消息，且不会发生任何事情，在其他语言中，向空指针(值为0的指针)发送消息是非法的，通常要先检查指针是否为空
}

- (void)bianli {
    NSMutableArray *namesArray = [[NSMutableArray alloc]init];
    for (NSString *item in namesArray) {
        NSLog(@"%@", item);
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
