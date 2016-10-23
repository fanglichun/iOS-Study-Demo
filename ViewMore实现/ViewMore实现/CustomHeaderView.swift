//
//  CustomHeaderView.swift
//  ViewMore实现
//
//  Created by mfang032 on 16/10/21.
//  Copyright © 2016年 mfang032. All rights reserved.
//

import UIKit

class CustomHeaderView: UITableViewHeaderFooterView {

    @IBOutlet weak var titleLabel: UILabel!

    @IBOutlet weak var editButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundView = UIView(frame: self.bounds)
        self.backgroundView?.backgroundColor = UIColor.white
    }
}
