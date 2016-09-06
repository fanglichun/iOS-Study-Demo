//
//  ResizeImage.swift
//  ResizeImage
//
//  Created by mfang032 on 1/10/16.
//  Copyright © 2016 mfang032. All rights reserved.
//

import UIKit
extension UIImage {
    func resizedImageWithContentMode(contentMode: UIViewContentMode, Bounds bounds:CGSize, interpolationQuality quality:CGInterpolationQuality) -> UIImage {
        let horizontalRatio: CGFloat = bounds.width / self.size.width
        let verticalRatio = bounds.height / self.size.height
        var ratio: CGFloat!
        switch contentMode {
        case .ScaleAspectFill :
            ratio = max(horizontalRatio, verticalRatio)
        case  .ScaleAspectFit :
            ratio = min(horizontalRatio, verticalRatio)
        default :
            break
        }
        let newSize : CGSize = CGSizeMake(self.size.width * ratio, self.size.height * ratio);
        return self.resiz
    }
}
