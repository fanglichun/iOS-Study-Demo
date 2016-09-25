/*
 Copyright (C) 2016 Apple Inc. All Rights Reserved.
 See LICENSE.txt for this sample’s licensing information
 
 Abstract:
 The application delegate class used to manage this sample.
 */

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    // MARK: Application Life Cycle
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        // Override point for customization after application launch.
        var shouldPerformAdditionalDelegateHandling = true
        
        // If a shortcut was launched, display its information and take the appropriate action
        if let shortcutItem = launchOptions?[UIApplicationLaunchOptionsKey.shortcutItem] as? UIApplicationShortcutItem {
            
            launchedShortcutItem = shortcutItem
            
            // This will block "performActionForShortcutItem:completionHandler" from being called.
            shouldPerformAdditionalDelegateHandling = false
        }
        
        // Install initial versions of our two extra dynamic shortcuts.
       /* if let shortcutItems = application.shortcutItems , shortcutItems.isEmpty {
            // Construct the items.
            let shortcut3 = UIMutableApplicationShortcutItem(type: ShortcutIdentifier.Third.type, localizedTitle: "Play", localizedSubtitle: "Will Play an item", icon: UIApplicationShortcutIcon(type: .play), userInfo: [
                AppDelegate.applicationShortcutUserInfoIconKey: UIApplicationShortcutIconType.play.rawValue
                ]
            )
            
            let shortcut4 = UIMutableApplicationShortcutItem(type: ShortcutIdentifier.Fourth.type, localizedTitle: "Pause", localizedSubtitle: "Will Pause an item", icon: UIApplicationShortcutIcon(type: .pause), userInfo: [
                AppDelegate.applicationShortcutUserInfoIconKey: UIApplicationShortcutIconType.pause.rawValue
                ]
            )
            
            // Update the application providing the initial 'dynamic' shortcut items.
            application.shortcutItems = [shortcut3, shortcut4]
        }*/
        
        return shouldPerformAdditionalDelegateHandling
    }
    
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        guard let shortcut = launchedShortcutItem else { return }
        
        if !handleShortCutItem(shortcut) {
        }
        launchedShortcutItem = nil
    }
    
    
    
    /*
     Called when the user activates your application by selecting a shortcut on the home screen, except when
     application(_:,willFinishLaunchingWithOptions:) or application(_:didFinishLaunchingWithOptions) returns `false`.
     You should handle the shortcut in those callbacks and return `false` if possible. In that case, this
     callback is used if your application is already launched in the background.
     */
    func application(_ application: UIApplication, performActionFor shortcutItem: UIApplicationShortcutItem, completionHandler: @escaping (Bool) -> Void) {
        let handledShortCutItem = handleShortCutItem(shortcutItem)
        
        completionHandler(handledShortCutItem)
    }
    
    // MARK: Types
    
    enum ShortcutIdentifier: String {
        case First
        case Second
        case Third
        case Fourth
        
        // MARK: Initializers
        
        init?(fullType: String) {
            guard let last = fullType.components(separatedBy: ".").last else { return nil }
            
            self.init(rawValue: last)
        }
        
        // MARK: Properties
        
        var type: String {
            return Bundle.main.bundleIdentifier! + ".\(self.rawValue)"
        }
    }
    
    // MARK: Static Properties
    
    static let applicationShortcutUserInfoIconKey = "applicationShortcutUserInfoIconKey"
    
    // MARK: Properties
    
    var window: UIWindow?
    
    /// Saved shortcut item used as a result of an app launch, used later when app is activated.
    var launchedShortcutItem: UIApplicationShortcutItem?
    
    func handleShortCutItem(_ shortcutItem: UIApplicationShortcutItem) -> Bool {
        var handled = false
        
        // Verify that the provided `shortcutItem`'s `type` is one handled by the application.
        guard ShortcutIdentifier(fullType: shortcutItem.type) != nil else { return false }
        
        guard let shortCutType = shortcutItem.type as String? else { return false }
        
        switch (shortCutType) {
        case ShortcutIdentifier.First.type, ShortcutIdentifier.Second.type, ShortcutIdentifier.Third.type, ShortcutIdentifier.Fourth.type :
            // Handle shortcut 1 (static).
            handled = true
        default:
            break
        }
        
        // Construct an alert using the details of the shortcut used to open the application.
        let alertController = UIAlertController(title: shortcutItem.localizedTitle, message: "\"\(shortcutItem.localizedSubtitle ?? "")\"", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        
        // Display an alert indicating the shortcut selected from the home screen.
        window?.rootViewController?.present(alertController, animated: true, completion: nil)
        
        return handled
    }
    
    
    
    
}
