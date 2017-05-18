//
//  BNRContainer.h
//  Party
//
//  Created by mfang032 on 2017/5/9.
//  Copyright © 2017年 mfang032. All rights reserved.
//

#import "BNRItem.h"

@interface BNRContainer : BNRItem {
    NSMutableArray *subitems;
    
}

-(NSArray *)subitems;




@end
