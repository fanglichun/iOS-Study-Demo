//
//  ViewController_h+Logging.m
//  Swizzle实现
//
//  Created by mfang032 on 28/03/2017.
//  Copyright © 2017 mfang032. All rights reserved.
//


#import <objc/objc.h>
#import <objc/runtime.h>

#import "ViewController+Logging.h"

@implementation ViewController (Logging)


- (void)swizzled_viewDidAppear:(BOOL)animated {
    
    [self swizzled_viewDidAppear:animated];
    
}

@end
