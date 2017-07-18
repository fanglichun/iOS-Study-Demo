//
//  CustomBarbuttonItem.swift
//  自定义导航栏
//
//  Created by mfang032 on 2017/7/8.
//  Copyright © 2017年 mfang032. All rights reserved.
//

import UIKit

class CustomBarbuttonItem: UIView {
    
    @IBOutlet  weak var titleLabel: UILabel!
    @IBOutlet private weak var categoryLabel: UILabel!
    @IBOutlet private weak var backgroundButton: UIButton!

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    
    class func createBarButtonItem(_ model:BarButtonItemModel) ->UIView {
        let view = Bundle.main.loadNibNamed("CustomBarbuttonItem".components(separatedBy: ".").last!, owner: nil, options: nil)?.first as! CustomBarbuttonItem
        view.titleLabel.text = model.title
        view.categoryLabel.text = model.category
        view.backgroundButton.setImage(UIImage(named: model.backgroundImgName), for: UIControlState.normal)
        view.backgroundButton.setImage(UIImage(named: model.backgroundSelectedImgName), for: .highlighted)
        return view
    }
}
