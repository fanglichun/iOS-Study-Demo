//
//  ArrayDataSource.swift
//  LighterViewControllers
//
//  Created by mfang032 on 2017/6/25.
//  Copyright © 2017年 mfang032. All rights reserved.
//

import UIKit

typealias TableViewCellConfigureBlock = ((PhotoCell, Photo) ->Void)
class ArrayDataSource: NSObject {
    
    fileprivate var items: Array<Photo> = Array()
    
    fileprivate var cellIdentifier: String
    
    fileprivate var configureCellBlock: TableViewCellConfigureBlock?
    
    init(_ items: [Photo],_ cellIdentifier: String, block: @escaping TableViewCellConfigureBlock ) {
        self.items = items
        self.cellIdentifier = cellIdentifier
        self.configureCellBlock = block
    }
}

fileprivate extension ArrayDataSource {
    
    func itemAtIndexPath(_ indexPath: IndexPath) ->Photo {
        return items[indexPath.row]
    }
}

extension ArrayDataSource: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as? PhotoCell
        if cell == nil {
            cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: cellIdentifier) as? PhotoCell
        }
        let item = items[indexPath.row]
        self.configureCellBlock?(cell! , item)
        return cell!
    }
}
