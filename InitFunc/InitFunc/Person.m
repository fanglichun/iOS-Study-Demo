
//
//  Person.m
//  InitFunc
//
//  Created by mfang032 on 3/2/16.
//  Copyright © 2016 mfang032. All rights reserved.
//

#import "Person.h"

@implementation Person
- (instancetype)init {
    if (self = [super init]) {
        _name = @"";
    }
    return self;
}

+ (instancetype)person {
    return [self init];
}
@end
