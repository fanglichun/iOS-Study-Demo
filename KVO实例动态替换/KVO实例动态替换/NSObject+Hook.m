//
//  NSObject+Hook.m
//  KVO实例动态替换
//
//  Created by mfang032 on 27/03/2017.
//  Copyright © 2017 mfang032. All rights reserved.
//

#import "NSObject+Hook.h"
#import <objc/runtime.h>
#import <objc/message.h>
#import <objc/objc.h>
#import "LDSubclassViewController.h"


@implementation NSObject (Hook)

+ (void)hookWithInstance: (id)instance method: (SEL)selector {
    Method originMethod = class_getInstanceMethod([instance class], selector);
    if (!originMethod) {
        //exception
        
    }
    
    Class newClass = [LDSubclassViewController class];
    object_setClass(instance, newClass);
    
 
}

@end
