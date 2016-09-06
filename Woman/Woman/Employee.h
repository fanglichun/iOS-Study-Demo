//
//  Employee.h
//  Woman
//
//  Created by mfang032 on 2/17/16.
//  Copyright © 2016 mfang032. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Addr,Hobby;
@interface Employee : NSObject

@property (nonatomic, copy) NSString *gender;

@property (nonatomic, assign) NSInteger age;

@property (nonatomic, strong) NSArray<Hobby *> *hobby;

@property (nonatomic, copy) NSString *name;

@property (nonatomic, copy) NSString *height;

@property (nonatomic, strong) Addr *addr;

@end
@interface Addr : NSObject

@property (nonatomic, copy) NSString *province;

@property (nonatomic, copy) NSString *city;

@property (nonatomic, copy) NSString *code;

@end

@interface Hobby : NSObject

@property (nonatomic, copy) NSString *name;

@property (nonatomic, copy) NSString *code;

@end

