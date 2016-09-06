//
//  ViewController.m
//  RadioBtn使用
//
//  Created by mfang032 on 3/7/16.
//  Copyright © 2016 mfang032. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *yesBtn;
@property (weak, nonatomic) IBOutlet UIButton *noBtn;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _yesBtn.selected = YES;
    _noBtn.selected = NO;
//    _yesBtn.titleLabel.textAlignment = NSTextAlignmentLeft;
//    _yesBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
//    _yesBtn.titleEdgeInsets = UIEdgeInsetsMake(0, 20, 0, 0);
//    _noBtn.titleLabel.textAlignment = NSTextAlignmentLeft;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)btnClicked:(UIButton *)sender {
    NSInteger overtimePreferenceId = 0;
    if (sender == _yesBtn) {
        _yesBtn.selected = YES;
        _noBtn.selected = NO;
        overtimePreferenceId = 2;
    } else {
        _yesBtn.selected = NO;
        _noBtn.selected = YES;
        overtimePreferenceId = 1;
    }
    
    printf("%ld",overtimePreferenceId);
}

@end
