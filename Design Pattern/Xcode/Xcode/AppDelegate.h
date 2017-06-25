//
//  AppDelegate.h
//  Xcode
//
//  Created by mfang032 on 15/02/2017.
//  Copyright © 2017 mfang032. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

