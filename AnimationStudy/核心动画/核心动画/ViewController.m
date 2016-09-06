//
//  ViewController.m
//  核心动画
//
//  Created by mfang032 on 4/20/16.
//  Copyright © 2016 mfang032. All rights reserved.
//

#import "ViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "CoreAnimationEffect.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *redView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    [CoreAnimationEffect animationCurlUp:self.redView];
//    [CoreAnimationEffect animationPushUp:self.redView];
//    [CoreAnimationEffect animationPushDown:self.redView];
    [CoreAnimationEffect showAnimationType:@"rippleEffect" withSubType:kCATransitionFromRight duration:0.5 timingFunction:kCAMediaTimingFunctionEaseInEaseOut view:self.redView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
