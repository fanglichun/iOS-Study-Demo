//
//  TableViewController.swift
//  TableViewController实现iPad横竖屏幕切换
//
//  Created by mfang032 on 16/11/30.
//  Copyright © 2016年 mfang032. All rights reserved.
//

import UIKit


let COMMON_RATIO : CGFloat = 5/64
let COMMON_PADDING : CGFloat = 16
let REX_VIEW_BACKGROUNDCOLOR = UIColor(hexValue: 0xEDEDED)



class TableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.view.backgroundColor = REX_VIEW_BACKGROUNDCOLOR
       
    }
    
    func screenSize() -> (width: CGFloat, height: CGFloat) {
        return (UIScreen.mainScreen().bounds.size.width, UIScreen.mainScreen().bounds.height)
    }
    
    func isLandscape() -> Bool {
        if UIScreen.mainScreen().bounds.width > UIScreen.mainScreen().bounds.height {
            return true
        }
        return false
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        
        if UIDevice.currentDevice().userInterfaceIdiom  == .Pad {
            
            if isLandscape() {
                tableView.frame = CGRect(x: screenSize().width * COMMON_RATIO , y: tableView.frame.origin.y, width: screenSize().width * (1 - COMMON_RATIO * 2 ), height: screenSize().height - 64)
            } else {
                 tableView.frame = CGRect(x: COMMON_PADDING, y: tableView.frame.origin.y, width: screenSize().width-COMMON_PADDING*2, height: (screenSize().height - 64))
            }
        }
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 5
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath)
        cell.textLabel?.text = "Fang"
        cell.detailTextLabel?.text = "Michael"


        return cell
    }
 

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension UIColor {
    
    convenience init(red: Int, green: Int, blue: Int, opacity: CGFloat = 1.0) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: opacity)
    }
    
    convenience init(hexValue:Int, opacity: CGFloat = 1.0) {
        self.init(red:(hexValue >> 16) & 0xff, green:(hexValue >> 8) & 0xff, blue:hexValue & 0xff, opacity: opacity)
    }
}
