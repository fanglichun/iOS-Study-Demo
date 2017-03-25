//
//  ViewController.m
//  ReactiveCocoa&&MVVM
//
//  Created by mfang032 on 25/03/2017.
//  Copyright © 2017 mfang032. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //[self uppercaseString];
    //[self uppercaseString1];
    //[self signalSwitch];
    //[self combiningLatest];
    //[self merge];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)signalSwitch {
    
    //创建自定义信号
    RACSubject *google = [RACSubject subject];
    RACSubject *baidu = [RACSubject subject];
    RACSubject *signalOfSignal = [RACSubject subject];
    
    //获取开关信号
    RACSignal *switchSignal = [signalOfSignal switchToLatest];
    
    //对获得的开关信号量进行操作
    [[switchSignal map:^id(NSString *value) {
        return  [@"https//www." stringByAppendingFormat:@"%@", value];
    }] subscribeNext:^(id x) {
        NSLog(@"%@", x);
    }];
    
    //通过开关打开百度
    [signalOfSignal sendNext:google];
    [baidu sendNext:@"baidu.com"];
    [google sendNext:@"google.com"];
}

/*
function:组合信号
 desc:信号量的合并说白了就是把两个水管中的水合成一个水管中的水。但这个合并有个限制，当两个水管中都有水的时候才合并。如果一个水管中有水，另一个水管中没有水，那么有水的水管会等到无水的水管中来水了，在与这个水管中的水按规则进行合并。
 */
- (void)combiningLatest {
    RACSubject *letters = [RACSubject subject];
    RACSubject *numbers = [RACSubject subject];
    [[RACSignal combineLatest:@[letters, numbers] reduce:^(NSString *letter, NSString *number){
        return  [letter stringByAppendingString:number];
    }] subscribeNext:^(NSString  *x) {
        NSLog(@"%@", x);
    }];
    
    [letters sendNext:@"A"];
    [letters sendNext:@"B"];
    [numbers sendNext:@"1"];
    [letters sendNext:@"C"];
    [numbers sendNext:@"2"];
    
}


- (void)merge {
    RACSubject *letters = [RACSubject subject];
    RACSubject *numbers = [RACSubject subject];
    RACSubject *chinese = [RACSubject subject];
    [[RACSignal merge:@[letters, numbers, chinese]] subscribeNext:^(id x) {
        NSLog(@"%@", x);
    }];
    
    [letters sendNext:@"AAA"];
    [numbers sendNext:@"666"];
    [chinese sendNext:@"您好"];
}

- (void)uppercaseString {
    
    NSArray *tempArray = @[@"you", @"are", @"beautiful"];
    RACSequence *sequence = [tempArray rac_sequence];
    RACSignal *signal = sequence.signal;
    RACSignal *capitalizedSignal = [signal map:^id(NSString* value) {
        return  [value capitalizedString];
    }];
    
    [capitalizedSignal subscribeNext:^(NSString  *x) {
        NSLog(@"signal----%@", x);
    }];
}

- (void)uppercaseString1 {
    
    [[[@[@"you", @"are", @"beautiful"] rac_sequence].signal map:^id(NSString *value) {
        return  [value capitalizedString];
    }] subscribeNext:^(NSString *x) {
        NSLog(@"signal----%@", x);
    }];
    
}

-(void) setWord1:(NSString *) word1 setWord2:(NSString *) word2 {
    
}



@end
