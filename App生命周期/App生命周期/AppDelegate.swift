//
//  AppDelegate.swift
//  App生命周期
//
//  Created by flc on 16/10/1.
//  Copyright © 2016年 Michael. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        //desc: The applicationWillResignActive: method is called when your app enters an inactive state, such as when a phone call or text message comes in, or the user switches to another app and your app begins transitioning to a background state. This is a good place to pause activity, save data, and prepare for possible suspension
        
        //what to de: Halt operations, animations, and UI updates
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        //desc:  The applicationDidEnterBackground: method is called immediately after your app enters a background state. Stop any operations, animations, and UI updates immediately
        //what to de: // Halt operations, animations, and UI updates immediately
        
        // If your app needs more time to finish performing essential user initiated tasks, it should request more background execution time—the system allows up to a few more minutes of time on request. Call the beginBackgroundTaskWithExpirationHandler: method and pass it a handler, to be called if the extra time runs out. Next, run the remaining tasks on a dispatch queue or secondary thread.
        
        var bgTaskID: UIBackgroundTaskIdentifier = 0
        bgTaskID =  UIApplication.shared.beginBackgroundTask {
            // Completion handler to be performed if time runs out
        }
        // Initiate background tasks
        
        // Notify the system when the background tasks are done
        UIApplication.shared.endBackgroundTask(bgTaskID)
        
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        //desc: The applicationWillEnterForeground: method is called immediately before your app transitions from a background app to the active app. Start resuming operations, loading data, reinitializing the UI, and getting your app ready for the user
        //what to de: Prepare to resume operations, animations, and UI updates
        
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // desc: The applicationDidBecomeActive: method is called immediately after your app becomes the active app, after being launched by the system or transitioning from a background or inactive state. Fully resume any operations that were halted
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

