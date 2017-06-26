//
//  PhotoCell.swift
//  LighterViewControllers
//
//  Created by mfang032 on 2017/6/25.
//  Copyright © 2017年 mfang032. All rights reserved.
//

import UIKit

class PhotoCell: UITableViewCell {
    
    @IBOutlet weak var photoTitleLabel: UILabel!
    @IBOutlet weak var photoDateLabel: UILabel!
    var photo: Photo? {
        didSet {
            
        }
    }
    
    class func nib() ->UINib {
        return UINib(nibName: "PhotoCell", bundle: nil)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setHighlighted(_ highlighted: Bool, animated: Bool) {
        super.setHighlighted(highlighted, animated: animated)
        if highlighted {
            photoDateLabel.shadowColor = UIColor.darkGray
            photoDateLabel.shadowOffset = CGSize(width: 3, height: 3)
        } else {
            photoDateLabel.shadowColor = nil
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        print("time:\(Date())")
    }
    
}
