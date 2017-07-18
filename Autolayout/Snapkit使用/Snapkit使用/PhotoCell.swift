//
//  PhotoCell.swift
//  Snapkit使用
//
//  Created by mfang032 on 2017/6/25.
//  Copyright © 2017年 mfang032. All rights reserved.
//

import UIKit
import SnapKit

class PhotoCell: UITableViewCell {
    
    lazy var photoTitleLabel: UILabel = {
       let label = UILabel()
        return label
    }()
    lazy var photoDateLabel: UILabel = {
       let label = UILabel()
        return label
    }()
    
    private var isDidSetupConstraints = false
    
//    override func prepareForReuse() {
//        super.prepareForReuse()
//        print("whether is reused")
//    }
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configSubViews()
    }
    
    class func dequeueReusableCell(tableView: UITableView, indexPath: IndexPath, style: UITableViewCellStyle,reuseIdentifier: String) ->PhotoCell? {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath)
        return cell as? PhotoCell
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configSubViews()
    }
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configSubViews() {
        addSubview(photoTitleLabel)
        addSubview(photoDateLabel)
    }
    
    override func layoutSubviews() {
        if !isDidSetupConstraints {
            photoTitleLabel.snp.makeConstraints { (make) in
                make.top.equalTo(contentView).inset(10)
                make.leading.equalTo(contentView).inset(16)
                make.trailing.equalTo(contentView).inset(16)
                make.bottom.equalTo(photoDateLabel).inset(10)
                
            }
            
            photoDateLabel.snp.makeConstraints { make in
                make.top.equalTo(photoTitleLabel).inset(10)
                make.leading.equalTo(contentView).inset(20)
                make.trailing.equalTo(contentView).inset(20)
                make.bottom.equalTo(contentView).inset(10)
            }
            isDidSetupConstraints = true
        }
    }

}
