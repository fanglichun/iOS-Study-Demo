//
//  TextViewCell.swift
//  ViewController实现TextView自动计算
//
//  Created by mfang032 on 16/9/26.
//  Copyright © 2016年 mfang032. All rights reserved.
//

import UIKit

class TextViewCell: UITableViewCell {
    @IBOutlet weak var textView: UITextView!
    weak var tableView: UITableView!
    var  beginEditCallback: ( ()-> Void)?
    
    @IBOutlet weak var heightConstraint: NSLayoutConstraint!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        textView.delegate = self
        textView.isScrollEnabled = false
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
}


extension TextViewCell: UITextViewDelegate {
    
    func textViewShouldBeginEditing(_ textView: UITextView) -> Bool {
        beginEditCallback?()
        return true
    }
    
    func textViewDidChange(_ textView: UITextView) {
        let size = textView.sizeThatFits(CGSize(width: frame.size.width, height: CGFloat(MAXFLOAT)))
        let height = size.height
        if height < 75 {
            heightConstraint.constant = 75
        } else {
            heightConstraint.constant = height
        }
        if (UIDevice.current.systemVersion as NSString).doubleValue >= 9.0 {
            tableView.beginUpdates()
            tableView.endUpdates()
        } else {
            tableView.reloadData()
        }
    }
    
}
