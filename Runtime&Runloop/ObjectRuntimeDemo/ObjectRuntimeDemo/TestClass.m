//
//  TestClass.m
//  ObjectRuntimeDemo
//
//  Created by mfang032 on 26/03/2017.
//  Copyright © 2017 mfang032. All rights reserved.
//

#import "TestClass.h"

@interface TestClass()
{
    NSInteger _var1;
    int _var2;
    BOOL _var3;
    double _var4;
    float _var5;
}

@property (nonatomic, strong) NSMutableArray *privateProperty1;
@property (nonatomic, strong) NSNumber *privateProperty2;
@property (nonatomic, strong) NSDictionary *privateProperty3;

@end

@implementation TestClass

- (void)privateTestMethod1 {
    NSLog(@"privateTestMethod1");
}

- (void)privateTestMethod2 {
    NSLog(@"privateTestMethod2");
    
}

- (void)method1 {
    
}



@end
