/*
    Copyright (C) 2016 Apple Inc. All Rights Reserved.
    See LICENSE.txt for this sample’s licensing information
    
    Abstract:
    The primary view controller listing the mutable shortcuts registered for this sample.
*/

import UIKit

class ShortcutsTableViewController: UITableViewController {
    // MARK: Properties
    
    /// Pre-defined shortcuts; retrieved from the Info.plist, lazily.
    lazy var staticShortcuts: [UIApplicationShortcutItem] = {
        // Obtain the `UIApplicationShortcutItems` array from the Info.plist. If unavailable, there are no static shortcuts.
        guard let shortcuts = Bundle.main.infoDictionary?["UIApplicationShortcutItems"] as? [[String: NSObject]] else { return [] }
        
        // Use `flatMap(_:)` to process each dictionary into a `UIApplicationShortcutItem`, if possible.
        let shortcutItems = shortcuts.flatMap { shortcut -> [UIApplicationShortcutItem] in
            // The `UIApplicationShortcutItemType` and `UIApplicationShortcutItemTitle` keys are required to successfully create a `UIApplicationShortcutItem`.            
            guard let shortcutType = shortcut["UIApplicationShortcutItemType"] as? String,
                let shortcutTitle = shortcut["UIApplicationShortcutItemTitle"] as? String else { return [] }

            // Get the localized title.
            var localizedShortcutTitle = shortcutTitle
            if let localizedTitle = Bundle.main.localizedInfoDictionary?[shortcutTitle] as? String {
                localizedShortcutTitle = localizedTitle
            }

            /*
                The `UIApplicationShortcutItemSubtitle` key is optional. If it
                exists, get the localized version.
            */
            var localizedShortcutSubtitle: String?
            if let shortcutSubtitle = shortcut["UIApplicationShortcutItemSubtitle"] as? String {
                localizedShortcutSubtitle = Bundle.main.localizedInfoDictionary?[shortcutSubtitle] as? String
            }

            return [
                UIApplicationShortcutItem(type: shortcutType, localizedTitle: localizedShortcutTitle, localizedSubtitle: localizedShortcutSubtitle, icon: nil, userInfo: nil)
            ]
        }
        
        return shortcutItems
    }()
    
    /// Shortcuts defined by the application and modifiable based on application state.
    lazy var dynamicShortcuts = UIApplication.shared.shortcutItems ?? []
    
    // MARK: UITableViewDataSource
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return ["Static", "Dynamic"][section]
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section == 0 ? staticShortcuts.count : dynamicShortcuts.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellID", for: indexPath as IndexPath)
        
        let shortcut: UIApplicationShortcutItem
        
        if indexPath.section == 0 {
            // Static shortcuts (cannot be edited).
            shortcut = staticShortcuts[indexPath.row]
            cell.accessoryType = .none
            cell.selectionStyle = .none
        }
        else {
            // Dynamic shortcuts.
            shortcut = dynamicShortcuts[indexPath.row]
        }
        
        cell.textLabel?.text = shortcut.localizedTitle
        cell.detailTextLabel?.text = shortcut.localizedSubtitle
        
        return cell

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowShortcutDetail" {
            guard let indexPath = tableView.indexPathForSelectedRow,
                let controller = segue.destination as? ShortcutDetailViewController else { return }
            
            controller.shortcutItem = dynamicShortcuts[indexPath.row]
        }

    }
    
    // MARK: Navigation
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        guard let selectedIndexPath = tableView.indexPathForSelectedRow else { return false }
        return selectedIndexPath.section > 0
    }
    
    // MARK: Actions
    // Unwind segue action called when the user taps 'Done' after navigating to the detail controller.
    @IBAction func done(sender: UIStoryboardSegue) {
        // Obtain the edited shortcut from our source view controller.
        guard let sourceViewController = sender.source as? ShortcutDetailViewController,
              let selected = tableView.indexPathForSelectedRow,
              let updatedShortcutItem = sourceViewController.shortcutItem else { return }
        
        // Update our data source.
        dynamicShortcuts[selected.row] = updatedShortcutItem
        
        // Update the application's `shortcutItems`.
        UIApplication.shared.shortcutItems = dynamicShortcuts
        
        tableView.reloadRows(at: [selected], with: .automatic)
    }
    
    // Unwind segue action called when the user taps 'Cancel' after navigating to the detail controller.
    @IBAction func cancel(sender: UIStoryboardSegue) {
        
    }
}
