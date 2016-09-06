//
//  REXReferOthersViewController.swift
//  REX
//
//  Created by mfang032 on 3/29/16.
//  Copyright © 2016 PwC Inc. All rights reserved.
//

import UIKit

class REXReferOthersViewController: UIViewController {
    let rowMargain: CGFloat = 15
    let columnMargain : CGFloat = 15
    let textMargain : CGFloat = 5
    var requiredSkillsArr: Array<String> = []
    var selectedSkillsArr: Array<Bool> = []
    @IBOutlet weak var topViewHeight: NSLayoutConstraint!
    @IBOutlet weak var middleViewHeight: NSLayoutConstraint!
    @IBOutlet weak var bottomViewHeight: NSLayoutConstraint!
    
    @IBOutlet weak var referOtherReasonView: UITextView!
    @IBOutlet weak var tagCloudView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        requiredSkillsArr = ["医德高尚","非常耐心","回复非常及时、满意","意见很有帮助","非常认真敬业","非常清楚","回复非常及时、满意","由衷的感谢您老师","非常专业的","德医双vgghvghgvvghhgvvghvhg好"]
        for _ in requiredSkillsArr {
            selectedSkillsArr.append(false)
        }
        layoutTagCloudView()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func layoutTagCloudView() {
        tagCloudView.backgroundColor = UIColor.yellowColor()
        bottomViewHeight.constant = 400
        var width: CGFloat = 0
        var row: CGFloat = 0
        var column: CGFloat = 0
        var rowWidth: CGFloat = columnMargain
        
        for i in 0..<requiredSkillsArr.count {
            let btn = UIButton(type: .Custom)
            btn.tag = 300 + i
            btn.setTitleColor(UIColor.blackColor(), forState: .Normal)
            let str = requiredSkillsArr[i] as NSString
            var titleSize = str.boundingRectWithSize(CGSizeMake(999, 25), options: NSStringDrawingOptions(rawValue: NSStringDrawingOptions.UsesLineFragmentOrigin.rawValue|NSStringDrawingOptions.TruncatesLastVisibleLine.rawValue|NSStringDrawingOptions.UsesFontLeading.rawValue), attributes: [NSFontAttributeName: UIFont.systemFontOfSize(15)], context: nil).size
            
            titleSize.width += textMargain
            // 自动换行
            rowWidth = rowWidth + titleSize.width + columnMargain
            if rowWidth >= UIScreen.mainScreen().bounds.width {
                rowWidth = columnMargain
                rowWidth = rowWidth + titleSize.width
                row += 1
                width = 0
                width = width + titleSize.width
                column = 0
                btn.frame = CGRectMake(columnMargain, rowMargain + 50 * row, titleSize.width, 40)
            } else {
                btn.frame = CGRectMake(width + columnMargain + (column * 15), rowMargain + 50 * row, titleSize.width, 40)
                width  += titleSize.width
            }
            column += 1
            btn.titleLabel?.font = UIFont.systemFontOfSize(14)
            btn.backgroundColor = UIColor.lightGrayColor()
            btn.setTitleColor(UIColor.whiteColor(), forState: .Normal)
            btn.setTitle(requiredSkillsArr[i], forState: .Normal)
            self.tagCloudView.addSubview(btn)
        }
    }
}
