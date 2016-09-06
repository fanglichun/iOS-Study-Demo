//
//  REXStatusCell.swift
//  swift懒加载
//
//  Created by mfang032 on 16/5/13.
//  Copyright © 2016年 mfang032. All rights reserved.
//

import UIKit



class REXStatusCell: UITableViewCell {
    
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var pictureView: UIImageView!
    @IBOutlet weak var vipView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var iconView: UIImageView!
    
    var status : REXStatus? {
        didSet{
//            print("status.name filed changed form \(oldValue?.name) to \(status?.name)")
            self.populateData(self.status)
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        self.contentLabel.preferredMaxLayoutWidth = UIScreen.mainScreen().bounds.width - 20
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
//        fatalError("init(coder:) has not been implemented")
    }
    
    ///Users/mfang032/Desktop/demo/swift懒加载/swift懒加载/REXStatusCell.swift:41:15: Initializer does not override a designated initializer from its superclass
//
//    convenience init(style: UITableViewCellStyle, reuseIdentifier: String?, tableView: UITableView) {
//        self.init(style: style, reuseIdentifier: reuseIdentifier)
//        var statusCell = tableView.dequeueReusableCellWithIdentifier(REXStatusCell.cellReuseIdentifier)
//        if statusCell == nil {
//            statusCell = NSBundle.mainBundle().loadNibNamed("REXStatusCell", owner: nil, options: nil).last as? REXStatusCell
//        }        
//    }
    
    private func populateData(status1: REXStatus?) {
        print(status1)
        if let status = status1 {
            print(status)
            if (status.vip) {
                self.nameLabel.textColor = UIColor.orangeColor()
                self.vipView.hidden = false
            } else {
                self.nameLabel.textColor = UIColor.blackColor()
                self.vipView.hidden = true
            }
            
            self.nameLabel.text = status.name;
            self.iconView.image = UIImage(named: status.icon!)
            if ((status.picture) != nil) {
                self.pictureView.hidden = false
                self.pictureView.image = UIImage(named: status.picture!)
            } else {
                self.pictureView.hidden = true
            }
            self.contentLabel.text = status.text
            self.layoutIfNeeded()
            if self.pictureView.hidden {
                status.cellHeight = CGRectGetMaxY(self.contentLabel.frame) + 10
            } else {
                status.cellHeight = CGRectGetMaxY(self.pictureView.frame) + 10
            }
        }
        
    }
}
