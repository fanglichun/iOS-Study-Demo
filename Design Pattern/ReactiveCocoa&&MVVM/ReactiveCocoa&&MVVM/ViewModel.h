//
//  ViewModel.h
//  ReactiveCocoa&&MVVM
//
//  Created by mfang032 on 25/03/2017.
//  Copyright © 2017 mfang032. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ViewModel : NSObject

@property (nonatomic, strong) NSString *userName;
@property (nonatomic, strong) NSString *password;
@property (nonatomic, strong) RACSubject *successObject;
@property (nonatomic, strong) RACSubject *failureObject;
@property (nonatomic, strong) RACSubject *errorObject;

- (id) buttonIsValid;
- (void)login;


@end
