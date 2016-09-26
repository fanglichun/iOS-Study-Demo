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
        textView.scrollEnabled = false
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}


extension TextViewCell: UITextViewDelegate {
    
    func textViewShouldBeginEditing(textView: UITextView) -> Bool {
        beginEditCallback?()
        return true
    }
    
    func textViewDidChange(textView: UITextView) {
        let size = textView.sizeThatFits(CGSize(width: frame.size.width, height: CGFloat(MAXFLOAT)))
        let height = size.height
        if height < 14 {
            heightConstraint.constant = 14
        } else {
            heightConstraint.constant = height
        }
        tableView.beginUpdates()
        tableView.endUpdates()
    }
    
}