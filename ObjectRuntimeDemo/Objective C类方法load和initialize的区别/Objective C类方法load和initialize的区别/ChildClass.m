//
//  ChildClass.m
//  Objective C类方法load和initialize的区别
//
//  Created by mfang032 on 2017/7/8.
//  Copyright © 2017年 mfang032. All rights reserved.
//

#import "ChildClass.h"
#import "Insideinitialize.h"



#ifdef DEBUG

# define DLog(fmt, ...) NSLog((@"[文件名:%s]\n" "[函数名:%s]\t" "[行号:%d] \n" fmt), __FILE__, __FUNCTION__, __LINE__, ##__VA_ARGS__);

#else

# define DLog(...);

#endif

//http://www.cnblogs.com/ider/archive/2012/09/29/objective_c_load_vs_initialize.html

@implementation ChildClass

//+ (void)initialize {
//    NSLog(@"%@ %s", [self class], __FUNCTION__);
//    Insideinitialize * obj = [[Insideinitialize alloc] init];
//    [obj objectMethod];
//}

+ (void)load {
    NSLog(@"%@ %s", [self class], __FUNCTION__);
    DLog(@"%@", [self class])
    
}
@end
