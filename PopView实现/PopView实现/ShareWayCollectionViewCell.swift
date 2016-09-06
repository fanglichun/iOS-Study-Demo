//
//  ShareWayCollectionViewCell.swift
//  PopView实现
//
//  Created by mfang032 on 4/23/16.
//  Copyright © 2016 mfang032. All rights reserved.
//

import UIKit

class ShareWayCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var bottomView: UIView!
    @IBOutlet weak var wayNameLabel: UILabel!
    @IBOutlet weak var wayImageView: UIImageView!
//    var jumpSharePlatAction: ( (String) -> Void)?
//    
//    var tapGestureRecognizer: UITapGestureRecognizer {
//        let tap = UITapGestureRecognizer(target: self, action: #selector(ShareWayCollectionViewCell.shareAction))
//        bottomView.addGestureRecognizer(tap)
//        return tap
//    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }
    
    func populateData(wayName wayName: String, wayImageName: String) {
        wayNameLabel.text = wayName
        wayImageView.image = UIImage(named: wayImageName)
    }
    
//    func shareAction() {
//        jumpSharePlatAction?(wayNameLabel.text!)
//    }
    
}
