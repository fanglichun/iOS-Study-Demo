//
//  ViewController.m
//  ObjectRuntimeDemo
//
//  Created by mfang032 on 26/03/2017.
//  Copyright © 2017 mfang032. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) NSArray *dataArray;


@end


@implementation ViewController

//@synthesize的作用就是让编译器为你自动生成setter与getter方法。
//编译器会自动生成dataArray的实例变量，以及相应的getter和setter方法。注意：_myButton这个实例变量是不存在的，因为自动生成的实例变量为dataArray而不是_dataArray，所以现在@synthesize的作用就相当于指定实例变量；
//如果.m文件中写了@synthesize dataArray;那么生成的实例变量就是dataArray；如果没写@synthesize dataArray;那么生成的实例变量就是_dataArray
@synthesize dataArray;




- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self->name = @"sdsd";
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
