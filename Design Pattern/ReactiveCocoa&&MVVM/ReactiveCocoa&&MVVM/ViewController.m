//
//  ViewController.m
//  ReactiveCocoa&&MVVM
//
//  Created by mfang032 on 25/03/2017.
//  Copyright © 2017 mfang032. All rights reserved.
//

#import "ViewController.h"
#import "ViewModel.h"
#import "LoginViewController.h"
#import "ReactiveCocoaClass.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *userNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (weak, nonatomic) IBOutlet UIButton *loginButton;

@property (strong, nonatomic) ViewModel *viewModel;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self bindModel];
    
    [self onClick];
    
    ReactiveCocoaClass *object = [[ReactiveCocoaClass alloc]init];
    [object sequence];
    
    
    
    
}

- (void)bindModel {
    
    self.viewModel = [[ViewModel alloc]init];
    
    RAC(self.viewModel, userName) = self.userNameTextField.rac_textSignal;
    RAC(self.viewModel, password) = self.passwordTextField.rac_textSignal;
    RAC(self.loginButton, enabled) = [self.viewModel buttonIsValid];
    
    @weakify(self);
    
    //成功登录
    [self.viewModel.successObject subscribeNext:^(NSArray *x) {
        @strongify(self);
        LoginViewController *loginVC = [[UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]] instantiateViewControllerWithIdentifier:@"LoginSuccessViewController"];
        loginVC.userName = x[0];
        loginVC.password = x[1];
        [self presentViewController:loginVC animated:true completion:^{
        }];
    }];
    
    //登录失败
    [self.viewModel.failureObject subscribeNext:^(id x) {
        
    }];
    
    //error
    [self.viewModel.errorObject subscribeNext:^(id x) {
        
    }];
}

- (void)onClick {
    [[self.loginButton rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
        [_viewModel login];
    }];
    
}

- (void)inputTextFilter {
    [self.userNameTextField.rac_textSignal filter:^BOOL(NSString *value) {
        return  value.length > 5;
    }];
    
    [[self.passwordTextField.rac_textSignal filter:^BOOL(id value) {
        NSString *text = value;
        return  text.length > 5;
    }] subscribeNext:^(id x) {
        NSLog(@">=%@", x);
    }];
}

-(void)inputTextViewObserv {
    [_userNameTextField.rac_textSignal subscribeNext:^(id x) {
        NSLog(@"first---%@", x);
    }];
}

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
    
}

- (IBAction)tapGestureRecognizer:(id)sender {
    
    [self.view endEditing:true];
    
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
