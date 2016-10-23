//
//  MFSwitchProfileTypeTableViewCell.swift
//  DelegateChangeDifferentViewControllers
//
//  Created by mfang032 on 16/10/21.
//  Copyright © 2016年 mfang032. All rights reserved.
//

import UIKit

class MFSwitchProfileTypeTableViewCell: UITableViewCell {

    @IBOutlet weak var segmentControl: UISegmentedControl!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func switchChanged(_ sender: UISegmentedControl) {
        
    }
}
