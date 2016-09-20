//
//  DemoCollectionViewCell.h
//  IOS_3DTouch_Demo
//
//  Created by NickyTsui on 16/1/3.
//  Copyright © 2016年 com.nickyTsui. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DemoCollectionViewCell : UICollectionViewCell

/**
 *  设置3dtouch代理
 */
@property (weak,nonatomic) id<UIViewControllerPreviewingDelegate> previewingDelegate;

@end
