//
//  ViewController.swift
//  FoldTableView
//
//  Created by ShaoFeng on 16/7/29.
//  Copyright © 2016年 Cocav. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        SectionModel.loadData { (models) in
            self.dataSource = models
        }
        view.addSubview(tableView)
        tableView.frame = UIScreen.main.bounds
    }
    
    
    
    /// 懒加载
    fileprivate lazy var dataSource: [SectionModel]? = nil
    fileprivate lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
    }()
}

extension ViewController: UITableViewDelegate,UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return dataSource!.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return (dataSource![section].isExpanded != false) ? dataSource![section].cellModels.count : 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "id") as? TableViewCell
        if cell == nil {
            cell = TableViewCell.init(style: UITableViewCellStyle.value1, reuseIdentifier: "id")
        }
        
        cell?.cellModel = dataSource![(indexPath as NSIndexPath).section].cellModels[(indexPath as NSIndexPath).row]
        return cell!
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        var headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "id") as? HeaderView
        if headerView == nil {
            headerView = HeaderView.init(reuseIdentifier: "id")
        }
        headerView?.sectionModel = dataSource![section]
        headerView!.expandCallBack = {
            (isExpanded: Bool) -> Void in
            headerView?.sectionModel?.isExpanded = isExpanded
            tableView.reloadSections(IndexSet.init(integer: section), with: UITableViewRowAnimation.fade)
        }
        return headerView!
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 44
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
}

