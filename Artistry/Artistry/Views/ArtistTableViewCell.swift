//
//  AppDelegate.swift
//  Artistry
//
//  Created by flc on 16/10/15.
//  Copyright © 2016年 Michael. All rights reserved.
//

import UIKit

class ArtistTableViewCell: UITableViewCell {
    
    @IBOutlet weak var bioLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var artistImageView: UIImageView!
    
    var artist: Artist? {
        didSet{
            selectionStyle = .none
            bioLabel.text = artist?.bio
            artistImageView.image = artist?.image
            nameLabel.text = artist?.name
            bioLabel.textColor = UIColor(white: 114/255, alpha: 1)
            nameLabel.backgroundColor = UIColor(red: 1, green: 152/255, blue: 0, alpha: 1)
            nameLabel.textColor = UIColor.white
            nameLabel.textAlignment = .center
            nameLabel.font = UIFont.preferredFont(forTextStyle: .headline)
            bioLabel.font = UIFont.preferredFont(forTextStyle: .body)
        }
    }
    
}
