    //
    //  PublicTableViewCell.swift
    //  MVVM
    //
    //  Created by mfang032 on 25/03/2017.
    //  Copyright © 2017 mfang032. All rights reserved.
    //

    import UIKit
    import AFNetworking

    class PublicTableViewCell: UITableViewCell {
        
        @IBOutlet weak var headImageView: UIImageView!
        @IBOutlet weak var userNameLabel: UILabel!
        @IBOutlet weak var dateTimeLabel: UILabel!
        @IBOutlet weak var descTextView: UITextView!
        
        var publicModel: PublicModel? {
            didSet {
                if let model = publicModel {
                    if let imgUrl = model.inageUrl {
                        headImageView.setImageWith(imgUrl, placeholderImage: UIImage(named: "_MG_4508.jpg"))
                    }
                    userNameLabel.text = model.userName ?? ""
                    dateTimeLabel.text = model.date ?? ""
                    descTextView.text = model.descString ?? "'"
                }
            }
        }
        

        override func awakeFromNib() {
            super.awakeFromNib()
            // Initialization code
        }

        override func setSelected(_ selected: Bool, animated: Bool) {
            super.setSelected(selected, animated: animated)

            // Configure the view for the selected state
        }

    }
