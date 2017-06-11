//
//  Person.h
//  ARC模式
//
//  Created by mfang032 on 2017/6/11.
//  Copyright © 2017年 mfang032. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, assign) NSInteger age;
@end
