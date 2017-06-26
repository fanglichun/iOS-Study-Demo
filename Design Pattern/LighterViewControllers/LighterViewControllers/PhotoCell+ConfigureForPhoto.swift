//
//  PhotoCell+ConfigureForPhoto.swift
//  LighterViewControllers
//
//  Created by mfang032 on 2017/6/25.
//  Copyright © 2017年 mfang032. All rights reserved.
//

import Foundation
import UIKit
extension PhotoCell {
    
//    private static var  dateFormatter: DateFormatter?
    
    func configureForPhoto(_ photo:Photo) {
        self.photoTitleLabel.text = photo.name ?? ""
        if let creationDate = photo.creationDate {
            self.photoDateLabel.text = dateFormatter().string(from: creationDate)
        } else {
            self.photoDateLabel.text = ""
        }
        self.photo = photo
    }
    
    func dateFormatter() ->DateFormatter {
        var dateFormatter: DateFormatter?
        if dateFormatter == nil {
            dateFormatter = DateFormatter()
            dateFormatter?.timeStyle = .medium
            dateFormatter?.dateStyle = .medium
        }
        return dateFormatter!
    }
    
    func height(_ photo: Photo?) ->CGFloat {
        guard let photo = photo else {
            return 0.0
        }
        
        print(photo)
        return 0.0
       
    }

}
