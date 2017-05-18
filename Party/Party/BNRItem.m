//
//  BNRItem.m
//  Party
//
//  Created by mfang032 on 2017/5/9.
//  Copyright © 2017年 mfang032. All rights reserved.
//

#import "BNRItem.h"

@implementation BNRItem

- (instancetype)init {
    return  [self initWithItemName:@"Item"];
}

- (instancetype)initWithItemName:(NSString *)name valueDollars:(int)value serialNumber:(NSString *)sNumber {
    if (self = [super init]) {
        _itemName = name;
        _serialNumber = sNumber;
        _valueDollars = value;
        _dateCreated = [[NSDate alloc] init];
    }
    return  self;
}

- (instancetype)initWithItemName:(NSString *)sName {
    return  [self initWithItemName:sName valueDollars:0 serialNumber:@""];
}

- (instancetype)initWithzitemName: (NSString *)name serialNumber: (NSString *)sNumber {
    return  [self initWithItemName:name valueDollars:0 serialNumber:sNumber];
}

+ (instancetype)randomItem {
    NSArray *randomAdjectiveList = @[@"Lovely", @"Shinly", @"Rusty"];
    NSArray *randomNounList = @[@"Mac", @"Windows", @"Bear"];
    NSInteger randomAdjectiveIndex = arc4random() % randomAdjectiveList.count;
    NSInteger nounIndex = arc4random() %randomNounList.count;
    NSString *randomItemName = [NSString stringWithFormat:@"%@ %@ ", [randomAdjectiveList objectAtIndex:randomAdjectiveIndex], [randomNounList objectAtIndex:nounIndex]];
    int randomValue = arc4random() % 100;
    NSString *randomSerialNumber = [NSString stringWithFormat:@"%c%c%c%c", '0' + arc4random() % 10, 'A' + arc4random() % 26, 'B' + arc4random() % 10, 'D' + arc4random() % 26];
    BNRItem * randomItem = [[BNRItem alloc] initWithItemName:randomItemName valueDollars:randomValue serialNumber:randomSerialNumber];
    return  randomItem;
}

- (void)setItemName:(NSString *)name {
    _itemName = name;
}

- (NSString *)itemName {
    return  _itemName;
}

- (NSString *)serialNumber {
    return  _serialNumber;
}

- (void)setSerialNumber:(NSString *)serialNumber {
    _serialNumber = serialNumber;
}

- (void)setValueDollars:(int)valueDollars {
    _valueDollars = valueDollars;
}

- (int)valueDollars {
    return  _valueDollars;
}

- (NSDate *)dateCreated {
    return  _dateCreated;
}
- (NSString *)description {
    NSString *descString =  [[NSString alloc]initWithFormat:@"%@ (%@): Worth $%d, recorded on %@",self.itemName, self.serialNumber, self.valueDollars, self.dateCreated];
    return  descString;
}




@end
