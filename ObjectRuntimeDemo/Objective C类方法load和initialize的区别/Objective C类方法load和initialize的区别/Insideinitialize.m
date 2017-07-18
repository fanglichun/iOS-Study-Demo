//
//  Insideinitialize.m
//  Objective C类方法load和initialize的区别
//
//  Created by mfang032 on 2017/7/8.
//  Copyright © 2017年 mfang032. All rights reserved.
//

#import "Insideinitialize.h"

@implementation Insideinitialize

- (void)objectMethod {
    NSLog(@"%@ %s", [self class], __FUNCTION__);
}

+ (void)initialize {
    NSLog(@"%@ %s", [self class], __FUNCTION__);
}

+ (void)load {
    NSLog(@"%s", __FUNCTION__);
}

@end
