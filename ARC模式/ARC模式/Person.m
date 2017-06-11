
//
//  Person.m
//  ARC模式
//
//  Created by mfang032 on 2017/6/11.
//  Copyright © 2017年 mfang032. All rights reserved.
//

#import "Person.h"

@implementation Person

- (void)dealloc {
    //ARC模式是无法调用[super dealloc]
    //ARC下不能使用retain, release
    //ARC下只要一个对象没有被强指针引用就会被销毁，换而言之 只要还有一个强引用指针变量指向对象，那么这个对象就会存在内存中，弱指针指向的对象，会被自动变成空指针（nil指针），从而不会引发野指针错误
    //MRC没有strong,weak,局部变量对象就是相当于基本数据类型
    //MRC给成员属性赋值,一定要使用set方法,不能直接访问下划线成员属性赋值，因为使用下划线是直接赋值(如_name = name)，而是用set方法会先判断旧值和新值是否相等，若相等就不需要release和retain，若不同先对旧值release在对新值retain
//    [super dealloc];
    NSLog(@"%p", __func__);
    NSLog(@"对象被释放");
}

@end
