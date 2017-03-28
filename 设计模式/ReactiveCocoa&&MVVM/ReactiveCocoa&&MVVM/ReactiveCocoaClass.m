//
//  ReactiveCocoaClass.m
//  ReactiveCocoa&&MVVM
//
//  Created by mfang032 on 26/03/2017.
//  Copyright © 2017 mfang032. All rights reserved.
//

#import "ReactiveCocoaClass.h"

@implementation ReactiveCocoaClass

- (instancetype)init {
    self = [super init];
    if (self) {
    }
    return self;
}


//uppercaseString use map
- (void)uppercaseString {
    
    //    RACSequence *sequence = [@[@"you", @"are", @"beautiful"] rac_sequence];
    //
    //    RACSignal *signal =  sequence.signal;
    //
    //    RACSignal *capitalizedSignal = [signal map:^id(NSString * value) {
    //                               return [value capitalizedString];
    //                            }];
    //
    //    [signal subscribeNext:^(NSString * x) {
    //        NSLog(@"signal --- %@", x);
    //    }];
    //
    //    [NSThread sleepForTimeInterval:1.0f];
    //
    //    [capitalizedSignal subscribeNext:^(NSString * x) {
    //        NSLog(@"capitalizedSignal --- %@", x);
    //    }];
    
    
    [[[@[@"you", @"are", @"beautiful"] rac_sequence].signal
      map:^id(NSString * value) {
          return [value capitalizedString];
      }] subscribeNext:^(id x) {
          NSLog(@"capitalizedSignal --- %@", x);
      }];
}

//信号开关Switch
- (void)signalSwitch {
    //创建3个自定义信号
    RACSubject *google = [RACSubject subject];
    RACSubject *baidu = [RACSubject subject];
    RACSubject *signalOfSignal = [RACSubject subject];
    
    //获取开关信号
    RACSignal *switchSignal = [signalOfSignal switchToLatest];
    
    //对通过开关的信号量进行操作
    [[switchSignal  map:^id(NSString * value) {
        return [@"https//www." stringByAppendingFormat:@"%@", value];
    }] subscribeNext:^(NSString * x) {
        NSLog(@"%@", x);
    }];
    
    
    //通过开关打开baidu
    [signalOfSignal sendNext:baidu];
    [baidu sendNext:@"baidu.com"];
    [google sendNext:@"google.com"];
    
    //通过开关打开google
    [signalOfSignal sendNext:google];
    [baidu sendNext:@"baidu.com/"];
    [google sendNext:@"google.com/"];
}

//组合信号
- (void)combiningLatest{
    RACSubject *letters = [RACSubject subject];
    RACSubject *numbers = [RACSubject subject];
    
    [[RACSignal
      combineLatest:@[letters, numbers]
      reduce:^(NSString *letter, NSString *number){
          return [letter stringByAppendingString:number];
      }]
     subscribeNext:^(NSString * x) {
         NSLog(@"%@", x);
     }];
    
    //B1 C1 C2
    [letters sendNext:@"A"];
    [letters sendNext:@"B"];
    [numbers sendNext:@"1"];
    [letters sendNext:@"C"];
    [numbers sendNext:@"2"];
}

//合并信号
- (void)merge {
    RACSubject *letters = [RACSubject subject];
    RACSubject *numbers = [RACSubject subject];
    RACSubject *chinese = [RACSubject subject];
    
    [[RACSignal
      merge:@[letters, numbers, chinese]]
     subscribeNext:^(id x) {
         NSLog(@"merge:%@", x);
     }];
    
    [letters sendNext:@"AAA"];
    [numbers sendNext:@"666"];
    [chinese sendNext:@"你好！"];
}

- (void)doNextThen{
    //doNext, then
    RACSignal *lettersDoNext = [@"A B C D E F G H I" componentsSeparatedByString:@" "].rac_sequence.signal;
    
    [[[lettersDoNext
       doNext:^(NSString *letter) {
           NSLog(@"doNext-then:%@", letter);
       }]
      then:^{
          return [@"1 2 3 4 5 6 7 8 9" componentsSeparatedByString:@" "].rac_sequence.signal;
      }]
     subscribeNext:^(id x) {
         NSLog(@"doNextThenSub:%@", x);
     }];
    
}

- (void)flattenMap {
    //flattenMap
    RACSequence *numbersFlattenMap = [@"1 2 3 4 5 6 7 8 9" componentsSeparatedByString:@" "].rac_sequence;
    
    [[numbersFlattenMap
      flattenMap:^RACStream *(NSString * value) {
          if (value.intValue % 2 == 0) {
              return [RACSequence empty];
          } else {
              NSString *newNum = [value stringByAppendingString:@"_"];
              return [RACSequence return:newNum];
          }
      }].signal
     subscribeNext:^(id x) {
         NSLog(@"flattenMap:%@", x);
     }];
    
}

- (void) flatten {
    //Flattening:合并两个RACSignal, 多个Subject共同持有一个Signal
    RACSubject *letterSubject = [RACSubject subject];
    RACSubject *numberSubject = [RACSubject subject];
    
    RACSignal *signal = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        [subscriber sendNext:letterSubject];
        [subscriber sendNext:numberSubject];
        [subscriber sendCompleted];
        return nil;
    }];
    
    RACSignal *flatternSignal = [signal flatten];
    [flatternSignal subscribeNext:^(id x) {
        NSLog(@"%@", x);
    }];
    
    //发信号
    [numberSubject sendNext:@(1111)];
    [numberSubject sendNext:@(1111)];
    [letterSubject sendNext:@"AAAA"];
    [numberSubject sendNext:@(1111)];
}

- (void)subscribeNext {
    RACSignal *letters = [@"A B C D E F G H I" componentsSeparatedByString:@" "].rac_sequence.signal;
    // Outputs: A B C D E F G H I
    [letters subscribeNext:^(NSString *x) {
        NSLog(@"subscribeNext: %@", x);
    }];
    
}

- (void)subscribeCompleted {
    
    //Subscription
    __block unsigned subscriptions = 0;
    
    RACSignal *loggingSignal = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        subscriptions ++;
        [subscriber sendCompleted];
        return nil;
    }];
    
    [loggingSignal subscribeCompleted:^{
        NSLog(@"Subscription1: %d", subscriptions);
    }];
    
    [loggingSignal subscribeCompleted:^{
        NSLog(@"Subscription2: %d", subscriptions);
    }];
    
    
}

- (void)sequence {
    //Map：映射
    RACSequence *letter = [@"A B C D E F G H I" componentsSeparatedByString:@" "].rac_sequence;
    
    // Contains: AA BB CC DD EE FF GG HH II
    RACSequence *mapped = [letter map:^(NSString *value) {
        return [value stringByAppendingString:value];
    }];
    [mapped.signal subscribeNext:^(id x) {
        NSLog(@"Map: %@", x);
    }];
    
    
    //Filter：过滤器
    RACSequence *numberFilter = [@"1 2 3 4 5 6 7 8" componentsSeparatedByString:@" "].rac_sequence;
    //Filter: 2 4 6 8
    [[numberFilter.signal
      filter:^BOOL(NSString * value) {
          return (value.integerValue) % 2 == 0;
      }]
     subscribeNext:^(NSString * x) {
         NSLog(@"filter: %@", x);
     }];
    
    //Combining streams:连接两个RACSequence
    //Combining streams: A B C D E F G H I 1 2 3 4 5 6 7 8
    RACSequence *concat = [letter concat:numberFilter];
    [concat.signal subscribeNext:^(NSString * x) {
         NSLog(@"concat: %@", x);
    }];
    
    
    //Flattening:合并两个RACSequence
    //A B C D E F G H I 1 2 3 4 5 6 7 8
    RACSequence * flattened = @[letter, numberFilter].rac_sequence.flatten;
    [flattened.signal subscribeNext:^(NSString * x) {
        NSLog(@"flattened: %@", x);
    }];
    
}


/*
//映射和过滤
- (void)mapAndFilter {
    //映射
    [[[_userNameTextField.rac_textSignal
       map:^id(NSString * value) {
           return @(value.length);
       }]
      filter:^BOOL(NSNumber * value) {
          return [value integerValue] > 5;
      }]
     subscribeNext:^(id x) {
         NSLog(@"%@", x);
     }];
}

//RAC的使用
- (void)userRACSetValue {
    //当输入长度超过5时，使用RAC()使背景颜色变化
    RAC(self.view, backgroundColor) = [_userNameTextField.rac_textSignal map:^id(NSString * value) {
        return value.length > 5 ? [UIColor yellowColor] : [UIColor greenColor];
    }];
}

- (void)combineLatestTextField {
    __weak ViewController *copy_self = self;
    //把两个输入框的信号合并成一个信号量，并把其用来改变button的可用性
    RAC(self.loginButton, enabled) = [RACSignal
                                      combineLatest:@[copy_self.userNameTextField.rac_textSignal,
                                                      copy_self.passwordTextField.rac_textSignal]
                                      reduce:^(NSString *userName, NSString *password) {
                                          return @(userName.length > 0 && password.length > 0);
                                      }];
    
}*/




@end
