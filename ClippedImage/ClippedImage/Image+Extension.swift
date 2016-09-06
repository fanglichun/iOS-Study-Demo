//
//  Image+Extension.swift
//  ClippedImage
//
//  Created by mfang032 on 12/14/15.
//  Copyright © 2015 mfang032. All rights reserved.


import UIKit
extension UIImage {
    
    func cropToCircleWithBorderColor(borderColor: UIColor, width: CGFloat) -> UIImage {
        var size: CGSize!
        if self.size.width <= self.size.height {
            size = CGSize(width: self.size.width, height: self.size.width)
        } else {
            size = CGSize(width: self.size.height, height: self.size.height)
        }
        let imageSize = CGRect(origin: CGPointZero, size: size)
        UIGraphicsBeginImageContext(imageSize.size)
        let context = UIGraphicsGetCurrentContext()
        CGContextAddEllipseInRect(context, imageSize)
        CGContextClip(context)
        self.drawAtPoint(CGPointZero)
        CGContextAddEllipseInRect(context, imageSize)
        borderColor.setStroke()
        CGContextSetLineWidth(context, width)
        CGContextStrokePath(context)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        return newImage
    }
    
    var uncompressedPNGData: NSData      { return UIImagePNGRepresentation(self)!        }
    var highestQualityJPEGNSData: NSData { return UIImageJPEGRepresentation(self, 1.0)!  }
    var highQualityJPEGNSData: NSData    { return UIImageJPEGRepresentation(self, 0.75)! }
    var mediumQualityJPEGNSData: NSData  { return UIImageJPEGRepresentation(self, 0.5)!  }
    var lowQualityJPEGNSData: NSData     { return UIImageJPEGRepresentation(self, 0.25)! }
    var lowestQualityJPEGNSData:NSData   { return UIImageJPEGRepresentation(self, 0.0)!  }
    
    func imagetoBase64String() -> String{
        //var imageData = UIImagePNGRepresentation(self)!
        let imageData = self.lowQualityJPEGNSData
        return imageData.base64EncodedStringWithOptions(.Encoding64CharacterLineLength)
    }
    
    
}



