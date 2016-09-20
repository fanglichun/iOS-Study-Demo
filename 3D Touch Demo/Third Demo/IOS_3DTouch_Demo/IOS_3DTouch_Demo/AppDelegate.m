//
//  AppDelegate.m
//  IOS_3DTouch_Demo
//
//  Created by NickyTsui on 16/1/3.
//  Copyright © 2016年 com.nickyTsui. All rights reserved.
//

#import "AppDelegate.h"

#import "ViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (void)setting3DTouchModule{
    // 判断系统版本大于9.0再设置 (若不判断 在低版本系统中会崩溃)
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 9.0){
        
        // 自定义图标
        UIApplicationShortcutIcon *icon1 = [UIApplicationShortcutIcon iconWithTemplateImageName:@"图片名称"];
        
        UIApplicationShortcutItem *shortItem1 = [[UIApplicationShortcutItem alloc] initWithType:@"item类型1" localizedTitle:@"item标题1" localizedSubtitle:@"子标题1" icon:icon1 userInfo:nil];
        
        UIApplicationShortcutItem *shortItem2 = [[UIApplicationShortcutItem alloc] initWithType:@"item类型2" localizedTitle:@"item标题2" localizedSubtitle:@"子标题2" icon:[UIApplicationShortcutIcon iconWithType: UIApplicationShortcutIconTypeCompose] userInfo:nil];
        
        // item 数组
        NSArray *shortItems = [[NSArray alloc] initWithObjects: shortItem1,shortItem2, nil];
        
        // 设置按钮
        [[UIApplication sharedApplication] setShortcutItems:shortItems];
    }
    
}
// 通过3dtouch菜单启动 后回调
- (void)application:(UIApplication *)application performActionForShortcutItem:(UIApplicationShortcutItem *)shortcutItem completionHandler:(void (^)(BOOL))completionHandler{
    // 可以通过标题 字符串判断 来确认 是哪个item
    if ([shortcutItem.localizedTitle  isEqualToString: @"item标题1"]){

    }
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    ViewController *vc = [[ViewController alloc]init];
    UINavigationController *naviVc = [[UINavigationController alloc]initWithRootViewController:vc];
    self.window.backgroundColor = [UIColor whiteColor];
    self.window.rootViewController = naviVc;
    [self.window makeKeyAndVisible];
    
    
    [self setting3DTouchModule];
    // Override point for customization after application launch.
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
