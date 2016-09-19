//
//  NewFeatureCell.swift
//  AppNewFeature
//
//  Created by flc on 16/9/17.
//  Copyright © 2016年 flc. All rights reserved.
//

import UIKit

class NewFeatureCell: UICollectionViewCell {
    
    var index: Int = 0 {
        didSet{
            let imageName = "start\(index + 1)Background"
            itemImageView.image = UIImage(named: imageName)
            switchBtn.transform = CGAffineTransform(translationX: 0, y: bounds.size.height)
        }
    }
    
    
    var switchMainControllerCallback: ( () -> Void)?
    
    
    lazy var itemImageView: UIImageView = {
        let itemImageView = UIImageView()
        self.contentView.addSubview(itemImageView)
        return itemImageView
    }()
    
    lazy var switchBtn: UIButton = {
        let btn = UIButton()
        btn.backgroundColor = UIColor.orange
        btn.sizeToFit()
        btn.addTarget(self, action: #selector(switchBtnClick), for: .touchUpInside)
        self.contentView.addSubview(btn)
        return btn
    }()
    
    func switchMainController() {
        UIView.animate(withDuration: 0.8, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0, options: UIViewAnimationOptions.curveEaseIn, animations: { 
            }, completion: nil)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        itemImageView.frame = bounds
        let centerX = bounds.size.width / 2
        let centerY = bounds.size.height / 2
        switchBtn.center = CGPoint(x: centerX, y: centerY)
        
    }
    
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    @objc private func switchBtnClick() {
        
        switchMainControllerCallback?()
        
    }

}
