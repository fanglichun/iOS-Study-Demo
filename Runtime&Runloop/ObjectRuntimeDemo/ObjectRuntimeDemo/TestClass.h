//
//  TestClass.h
//  ObjectRuntimeDemo
//
//  Created by mfang032 on 26/03/2017.
//  Copyright © 2017 mfang032. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TestClass : NSObject<NSCopying, NSCoding>

@property (nonatomic, strong) NSArray *publicProperty1;
@property (nonatomic, strong) NSString *publicProperty12;

+ (void)classethod: (NSString *)value;
- (void)publicTestMethod1: (NSString *)value1 Second: (NSString *)value2;
- (void)publicTestMethod2;
- (void)method1;

@end
