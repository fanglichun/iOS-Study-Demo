//
//  ViewModel.m
//  ReactiveCocoa&&MVVM
//
//  Created by mfang032 on 25/03/2017.
//  Copyright © 2017 mfang032. All rights reserved.
//

#import "ViewModel.h"

@interface ViewModel()

@property(nonatomic, strong) RACSignal *userNameSignal;
@property(nonatomic, strong) RACSignal *passwordSignal;
@property(nonatomic, strong) NSArray *requestData;

    


@end

@implementation ViewModel

- (instancetype)init {
    self = [super init];
    if (self) {
        [self initialize];
    }
    return self;
}


- (void)initialize {
    
    self.userNameSignal = RACObserve(self, userName);
    self.passwordSignal = RACObserve(self, password);
    
    self.successObject = [RACSubject subject];
    self.failureObject = [RACSubject subject];
    self.errorObject = [RACSubject subject];
}

- (id)buttonIsValid {
    
    RACSignal *isValid = [RACSignal combineLatest:@[_userNameSignal, _passwordSignal]
                          reduce:^id(NSString *userName, NSString *password){
                              return @(userName.length >= 3 && password.length >= 3);
                          }];
    return  isValid;
    
}

- (void)login {
    
    self.requestData = @[_userName, _password];
    [_successObject sendNext:_requestData];
}


@end
