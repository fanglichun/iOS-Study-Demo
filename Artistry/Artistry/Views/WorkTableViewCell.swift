//
//  AppDelegate.swift
//  Artistry
//
//  Created by flc on 16/10/15.
//  Copyright © 2016年 Michael. All rights reserved.
//

import UIKit

class WorkTableViewCell: UITableViewCell {
    
    @IBOutlet weak var workImageView: UIImageView!
    @IBOutlet weak var workTitleLabel: UILabel!
    @IBOutlet weak var moreInfoTextView: UITextView!
    
    var work: Work? {
        didSet {
            selectionStyle = .none
            workImageView.image = work?.image
            workTitleLabel.text = work?.title
            moreInfoTextView.text = work?.isExpanded ?? false ? work?.info : moreInfoText
            moreInfoTextView.textAlignment = work?.isExpanded ?? false ? .left : .center
            workTitleLabel.backgroundColor = UIColor(white: 204/255, alpha: 1)
            workTitleLabel.textAlignment = .center
            moreInfoTextView.textColor = UIColor(white: 114 / 255, alpha: 1)
            workTitleLabel.font = UIFont.preferredFont(forTextStyle: .headline)
            moreInfoTextView.font = UIFont.preferredFont(forTextStyle: .footnote)
            
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        moreInfoTextView.isUserInteractionEnabled = false
        moreInfoTextView.isScrollEnabled = false
    }
    
}
