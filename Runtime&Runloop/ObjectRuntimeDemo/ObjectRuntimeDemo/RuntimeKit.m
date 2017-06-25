//
//  RuntimeKit.m
//  ObjectRuntimeDemo
//
//  Created by mfang032 on 26/03/2017.
//  Copyright © 2017 mfang032. All rights reserved.
//

#import "RuntimeKit.h"
#import "ViewController.h"
@implementation RuntimeKit

/*
 获取类名
 @para: class 相应类名
 @return NSString: 类名
 
 */
+ (NSString *)fetchClassName: (Class)class {
    const char *className = object_getClassName(class);
    return  [NSString stringWithUTF8String:className];
}

/*
 获取成员变量
 */
/*
+ (NSArray *)fetchList: (Class)class {
    unsigned int count = 0;
    Ivar * ivarList = class_copyIvarList(class, &count);
    
}*/


/*
 获取类的属性表
 */

+ (NSArray *) fetchPropertyList: (Class)class {
    
    return  NULL;
}
// Implicit declaration of function 'class_getName' is invalid in C99

@end
