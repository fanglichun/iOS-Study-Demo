//
//  ViewController.swift
//  swift懒加载
//
//  Created by mfang032 on 16/5/12.
//  Copyright © 2016年 mfang032. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    let  cellReuseIdentifier : String =  "status"  //利率  ①
    let  CellIdentifierNib: String = "statusNib"
    let  CellIdentifierClass: String = "statusClass"
    let  CellIdentifierStoryboard: String = "statusStoryboard"
    let CellIdentifierdSystem: String = "statusSystem"

    
    lazy var status: NSMutableArray = {
        let statusPath = NSBundle.mainBundle().pathForResource("statuses.plist", ofType: nil)!
        let statusArray = NSMutableArray(contentsOfFile: statusPath)
//        let tmpArray:Array<REXStatus> = []
        /*for tmpWineDict in statusArray! {
            //若想使用默认和自定义的构造方法的话，必须重写默认的构造方法并且自定义构造方法
            var status:REXStatus = REXStatus.init(dict: tmpWineDict as! [String : AnyObject])
            tmpArray.append(status)
            self.tableView.reloadData()
        }*/
        
        let tmpArray = NSMutableArray()
        for tmpWineDict in statusArray! {
         //若想使用默认和自定义的构造方法的话，必须重写默认的构造方法并且自定义构造方法
         var status:REXStatus = REXStatus.init(dict: tmpWineDict as! [String : AnyObject])
         tmpArray.addObject(status)
         }
        return tmpArray
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "cell"
        self.tableView.registerNib(UINib(nibName: "REXStatusCell", bundle: nil), forCellReuseIdentifier: self.CellIdentifierNib)
//        self.tableView.registerClass(REXStatusCell.self, forCellReuseIdentifier: CellIdentifierClass)
        self.tableView.tableFooterView = UIView()
        self.tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        print(status.count)
        return status.count
    }
    
    override func  tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(self.CellIdentifierNib, forIndexPath: indexPath) as! REXStatusCell
        let status = self.status[indexPath.row]
        cell.status = status as? REXStatus
//        print(cell.status?.name)
//        print(cell.status?.cellHeight)
//        print(2)
        return cell
        
//        if indexPath.row == 0 {
//            let cell = tableView.dequeueReusableCellWithIdentifier(self.CellIdentifierNib, forIndexPath: indexPath)
//            cell.textLabel?.text = "Nib"
//            return cell
//        } else if indexPath.row == 1 {
//            var cell = tableView.dequeueReusableCellWithIdentifier(CellIdentifierStoryboard)
//            if (cell == nil)
//            {
//                cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: CellIdentifierStoryboard)
//            }
//            cell?.textLabel?.text = "Storyboard"
//            return cell!
//        } else if indexPath.row == 2 {
//            let cell = tableView.dequeueReusableCellWithIdentifier(CellIdentifierClass, forIndexPath: indexPath)
//            cell.textLabel?.text = "class"
//            return cell
//        } else {
//            var cell = tableView.dequeueReusableCellWithIdentifier(CellIdentifierdSystem)
//            if (cell == nil)
//            {
//                cell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: CellIdentifierdSystem)
//            }
//            cell!.textLabel?.text = "System"
//            cell?.textLabel?.textColor = UIColor.whiteColor()
//            cell?.backgroundColor = UIColor.blackColor()
//            return cell!
//        }
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        let status = self.status[indexPath.row] as! REXStatus
//        print("3")
        return status.cellHeight
    }
    
    override func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
//        print("4")
        return 200
    }
}


    
    


