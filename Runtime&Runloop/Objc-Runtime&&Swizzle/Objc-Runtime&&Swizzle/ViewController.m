//
//  ViewController.m
//  Objc-Runtime&&Swizzle
//
//  Created by mfang032 on 2017/8/20.
//  Copyright © 2017年 mfang032. All rights reserved.
//

#import "ViewController.h"
#import "Objc_Runtime__Swizzle-Swift.h"
@interface ViewController ()

@end

@implementation ViewController

+ (void)load {
    [ViewController swizzleInstanceMethod:@selector(functionA) newSelector:@selector(functionB)];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self functionA];
    // Do any additional setup after loading the view, typically from a nib.
    Person *p = [[Person alloc]init];
    NSLog(@"%p", p);
}

- (void)functionA {
    NSLog(@"before exchange");
    
}

- (void)functionB {
    NSLog(@"after exchange");
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
