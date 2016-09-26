//
//  AppDelegate.swift
//  3DTouchDeskClickedEffect
//
//  Created by flc on 16/9/24.
//  Copyright © 2016年 Michael. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    enum ShortcutIdentifier: String {
        case First
        case Second
        case Third
        case Fourth
        
        // MARK: Initializers
        init?(fullType: String) {
            let last = fullType.components(separatedBy: ".").last ?? ""
            self.init(rawValue: last)
        }
        // MARK: Properties
        var type: String {
            return Bundle.main.bundleIdentifier! + ".\(self.rawValue)"
        }
    }


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        if (launchOptions?[UIApplicationLaunchOptionsKey.shortcutItem] as? UIApplicationShortcutItem) != nil {
            
            
            // This will block "performActionForShortcutItem:completionHandler" from being called.
        }
        
        if let shortcutItems = application.shortcutItems, shortcutItems.isEmpty  {
            let shortcutItem1 = UIApplicationShortcutItem.init(type: ShortcutIdentifier.First.type, localizedTitle: "收藏", localizedSubtitle: nil, icon: UIApplicationShortcutIcon.init(type: .favorite), userInfo: nil)
            
            let shortcutItem2 = UIApplicationShortcutItem.init(type: ShortcutIdentifier.Second.type, localizedTitle: "搜索", localizedSubtitle: "App Name", icon: UIApplicationShortcutIcon.init(type: .search), userInfo: nil)
            application.shortcutItems = [shortcutItem1, shortcutItem2]
        }
        
        return true
    }
    

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    func application(_ application: UIApplication, performActionFor shortcutItem: UIApplicationShortcutItem, completionHandler: @escaping (Bool) -> Void) {
        let handled = setDeskClicked3DTouchModel(shortcutItem: shortcutItem)
        completionHandler(handled)
    }
    
    private func setDeskClicked3DTouchModel(shortcutItem: UIApplicationShortcutItem) ->Bool {
        var handled = false
        
        guard ShortcutIdentifier(fullType: shortcutItem.type) != nil else {
            return false
        }
        print(shortcutItem.type)
        switch shortcutItem.type {
        case  ShortcutIdentifier.First.type:
            handled = true
            let firstVC = FirstTableViewController()
            firstVC.title = "收藏"
            let nvc = UINavigationController(rootViewController: firstVC)
            window?.rootViewController?.present(nvc, animated: true, completion: nil)
        case ShortcutIdentifier.Second.type:
            handled = true
            let secondVC = SecondTableViewController()
            secondVC.title = "搜索"
            let nvc = UINavigationController(rootViewController: secondVC)
            window?.rootViewController?.present(nvc, animated: true, completion: nil)
        case ShortcutIdentifier.Third.type:
            handled = false
        case ShortcutIdentifier.Fourth.type:
            handled = false
        default:
            break
        }
        return handled
    }


}

