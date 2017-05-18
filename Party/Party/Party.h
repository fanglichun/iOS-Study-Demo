//
//  Party.h
//  Party
//
//  Created by mfang032 on 2017/5/9.
//  Copyright © 2017年 mfang032. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Party : NSObject

@property(nonatomic, copy) NSString *name;
@property (nonatomic, assign) int budget;
@property (nonatomic, strong) NSDate *date;

- (void)sendReminder;
- (void)cancel;



@end
