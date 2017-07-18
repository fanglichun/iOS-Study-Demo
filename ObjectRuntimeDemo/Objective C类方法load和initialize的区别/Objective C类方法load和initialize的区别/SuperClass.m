//
//  SuperClass.m
//  Objective C类方法load和initialize的区别
//
//  Created by mfang032 on 2017/7/8.
//  Copyright © 2017年 mfang032. All rights reserved.
//

#import "SuperClass.h"

@implementation SuperClass

+ (void)initialize {
    NSLog(@"%@ %s", [self class], __FUNCTION__);
}

+ (void)load {
    NSLog(@"%@ %s", [self class], __FUNCTION__);
}

@end
