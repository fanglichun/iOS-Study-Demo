//
//  ViewController.m
//  AOP
//
//  Created by mfang032 on 28/03/2017.
//  Copyright © 2017 mfang032. All rights reserved.
//

#import "ViewController.h"
#import "TestClass.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)tapTestButton:(UIButton *)sender {
    
    TestClass *test = [[TestClass alloc]init];
    [test testMethod];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
