//
//  ViewController.m
//  KVO实例动态替换
//
//  Created by mfang032 on 27/03/2017.
//  Copyright © 2017 mfang032. All rights reserved.
//

#import "ViewController.h"
#import <UIKit/UIKit.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor redColor];
    
    ViewController *vc = [[ViewController alloc]init];
    [vc eat];
    ViewController * hookedInstance= [[ViewController alloc] init];
    NSMutableArray *array = [NSMutableArray array];
   
    
    
    
}

- (void)eat {
    NSLog(@"original eat");
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
