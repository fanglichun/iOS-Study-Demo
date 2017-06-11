//
//  ViewController.m
//  ARC模式
//
//  Created by mfang032 on 2017/6/11.
//  Copyright © 2017年 mfang032. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    Person *person = [[Person alloc] init];
    person = [[Person alloc] init];
    __weak Person *person2 = person;
    person2 = nil;

    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
