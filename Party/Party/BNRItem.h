//
//  BNRItem.h
//  Party
//
//  Created by mfang032 on 2017/5/9.
//  Copyright © 2017年 mfang032. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BNRItem : NSObject {
    
    NSString *_itemName;
    NSString *_serialNumber;
    int _valueDollars;
    NSDate *_dateCreated;
}

- (instancetype)initWithItemName: (NSString *)name valueDollars: (int)value serialNumber: (NSString *)sNumber;
- (instancetype)initWithItemName: (NSString *)sName;
+ (instancetype)randomItem;
- (void)setItemName: (NSString *)name;

- (NSString *)itemName;


- (void)setSerialNumber: (NSString *)serialNumber;

- (NSString *)serialNumber;

- (void)setValueDollars: (int)valueDollars;
- (int)valueDollars;

- (NSDate *)dateCreated;



@end
