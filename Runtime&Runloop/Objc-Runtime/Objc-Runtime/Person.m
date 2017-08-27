//
//  Person.m
//  Objc-Runtime
//
//  Created by mfang032 on 2017/8/20.
//  Copyright © 2017年 mfang032. All rights reserved.
//

#import "Person.h"

@implementation Person

- (instancetype)initWithName:(NSString *)name age:(NSUInteger)age {
    self = [super init];
    if (self = [super init]) {
        self.name = name;
        self.age = age;
    }
    return  self;
}
+ (instancetype)initWithName:(NSString *)name age:(NSUInteger)age {
    return [self initWithName:name age:age];
}

@end
