//
//  DetailViewController.h
//  Xcode
//
//  Created by mfang032 on 15/02/2017.
//  Copyright © 2017 mfang032. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Xcode+CoreDataModel.h"

@interface DetailViewController : UIViewController

@property (strong, nonatomic) Event *detailItem;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@end

