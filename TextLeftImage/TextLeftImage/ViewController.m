//
//  ViewController.m
//  TextLeftImage
//
//  Created by mfang032 on 12/13/15.
//  Copyright © 2015 mfang032. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *text;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImageView *imgView2=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"logo-60@3x.png"]];
    imgView2.frame=CGRectMake(0, 0, 50, 10);
    _text.leftView=imgView2;
    _text.rightViewMode=UITextFieldViewModeAlways;

    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
