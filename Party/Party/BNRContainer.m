//
//  BNRContainer.m
//  Party
//
//  Created by mfang032 on 2017/5/9.
//  Copyright © 2017年 mfang032. All rights reserved.
//

#import "BNRContainer.h"
#import "BNRItem.h"
@implementation BNRContainer

- (NSArray *)subitems {
    if (!self.subitems) {
        self.subitems = [NSMutableArray array];
        for (NSInteger i = 0; i < 3; i++) {
            BNRItem *item  = [[BNRItem alloc] init];
            [subitems addObject:item];
        }
    }
    return  subitems;
}

- (void)setSubitems: (NSArray *)items {
    self.subitems = items;
}

- (NSString *)description {
    return @"";
}
@end
