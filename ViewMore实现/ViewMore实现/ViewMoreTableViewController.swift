//
//  ViewMoreTableViewController.swift
//  ViewMore实现
//
//  Created by mfang032 on 16/10/21.
//  Copyright © 2016年 mfang032. All rights reserved.
//

import UIKit

class ViewMoreTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        var nib = UINib(nibName: "ViewMoreTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "ViewMoreTableViewCell")
        nib = UINib(nibName: "CustomHeaderView", bundle: nil)
        tableView.register(nib, forHeaderFooterViewReuseIdentifier: "CustomHeaderView")
        tableView.estimatedRowHeight = 100
        tableView.rowHeight = UITableViewAutomaticDimension
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
        return 1
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ViewMoreTableViewCell", for: indexPath) as! ViewMoreTableViewCell
        cell.content.text = "njsdkskfjdksfdkjskfdnsdfnkjskjdkjnsknjsfsjnfdjknsfjnjknsfdjknfsdjknsfdsfdjnkjknsfdnjkfsnkjknsfjnkjsfnkskfksjfnkjsfdnknskfjdknjsfdknsnfdjknsfjkdnkjsfdknjsfnknsfkdnsfdnkjsfdnjksfnjdknskfdnjksfdknjsfdnsfndkjnksjfdjnfdsnjkfsdnjksdnjksndfjksnfdjknsjfdnjsfdnnsfdnj    njnksdjknsdfksdfknsdfkjsfdnkjfsdkjskjdfjksdfnjksndfjksfdjknjksdfnjksfdjksfdjksfdkjkjsdfkjfsdnksfdkjnfskdjkjsfdkjsfdksfdkjnfsjkdnsfjkdnkjfsdnkjfsnkjsfdjksfdnksfnd"
        return cell
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "CustomHeaderView") as!CustomHeaderView
        switch section {
        case 0:
            headerView.titleLabel.text = "Summary"
        default:
            headerView.titleLabel.text = "Experience"

        }
        return headerView
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 45.0
    }
    
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.0000001
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
