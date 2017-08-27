//
//  Person.h
//  Objc-Runtime
//
//  Created by mfang032 on 2017/8/20.
//  Copyright © 2017年 mfang032. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject
@property (nonatomic, copy) NSString *name;
@property (nonatomic, assign) NSUInteger age;
- (instancetype)initWithName: (NSString *)name age: (NSUInteger)age;
+ (instancetype)initWithName: (NSString *)name age: (NSUInteger)age;


@end
