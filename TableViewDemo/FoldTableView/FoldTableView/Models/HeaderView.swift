//
//  HeaderView.swift
//  FoldTableView
//
//  Created by ShaoFeng on 16/7/29.
//  Copyright © 2016年 Cocav. All rights reserved.
//

import UIKit

typealias HeaderViewClickCallBack = (Bool) -> Void

class HeaderView: UITableViewHeaderFooterView {

    var expandCallBack: HeaderViewClickCallBack?

    var sectionModel: SectionModel? {
        
        didSet {
            textLabel?.text = sectionModel?.sectionTitle
            if ((self.sectionModel!.isExpanded) == false) {
                self.directionImageView.transform = CGAffineTransform.identity
            } else {
                self.directionImageView.transform = CGAffineTransform(rotationAngle: CGFloat(M_PI))
            }
        }
    }
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        let w = UIScreen.main.bounds.size.width
        
        directionImageView = UIImageView.init(image: UIImage.init(named: "expanded"))
        directionImageView.frame = CGRect(x: w - 30, y: (44 - 8) / 2, width: 15, height: 8)
        contentView.addSubview(directionImageView)
        
        let button = UIButton.init(frame: CGRect(x: 0, y: 0, width: w, height: 44))
        contentView.addSubview(button)
        button.addTarget(self, action: #selector(clickHeader(_:)), for: UIControlEvents.touchUpInside)
        
        self.contentView.backgroundColor = UIColor.green
    }
    
    func clickHeader(_ sender: UIButton) {
        sectionModel?.isExpanded = !((sectionModel?.isExpanded)!)
        UIView.animate(withDuration: 0.25, animations: {
            if (self.sectionModel?.isExpanded == false) {
                self.directionImageView.transform = CGAffineTransform.identity
            } else {
                self.directionImageView.transform = CGAffineTransform(rotationAngle: CGFloat(M_PI))
            }
        })
        expandCallBack?((sectionModel?.isExpanded)!)
    }
    
    fileprivate lazy var directionImageView = UIImageView()
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

