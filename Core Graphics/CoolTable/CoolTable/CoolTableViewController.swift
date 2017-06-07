//
//  CoolTableViewController.swift
//  CoolTable
//
//  Created by mfang032 on 2017/5/21.
//  Copyright © 2017年 mfang032. All rights reserved.
//

import UIKit

class CoolTableViewController: UITableViewController {
    
    var thingsToLearn = Array<String>()
    var thingsLearned = Array<String>()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Core Graphics"
        thingsToLearn = ["Drawing Rects", "Drawing Gradients", "Drawing Arcs"]
        thingsLearned = ["Table Views", "UIKit", "Objective-C"]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return section == 0 ? thingsToLearn.count : thingsLearned.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        // Configure the cell...
        var entry: String = ""
        if !(cell.backgroundView is CustomCellBackground) {
            cell.backgroundView = CustomCellBackground()
        }
        if !(cell.selectedBackgroundView is CustomCellBackground) {
            cell.selectedBackgroundView = CustomCellBackground()
        }
        if indexPath.section == 0 {
            entry = thingsToLearn[indexPath.row]
        } else {
            entry = thingsLearned[indexPath.row]
        }
        cell.textLabel?.text = entry
        cell.textLabel?.backgroundColor = UIColor.clear

        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return section == 0 ? "Things We'll Learn" : "Things Already Covered"
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = CustomHeader()
        headerView.titleLabel.text =  (section == 0 ? "Things We'll Learn" : "Things Already Covered")
        if section == 1 {
            headerView.lightColor = UIColor(colorLiteralRed: 147.0/255.0, green: 105.0/255.0, blue: 216.0/255.0 , alpha: 1.0)
        } else {
            headerView.darkColor = UIColor(colorLiteralRed: 72.0/255.0, green: 22.0/255.0, blue: 137.0/255.0 , alpha: 1.0)
        }
        return headerView
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }

}
