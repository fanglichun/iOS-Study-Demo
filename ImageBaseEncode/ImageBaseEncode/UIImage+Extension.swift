//
//  UIImage+Extension.swift
//  ImageBaseEncode
//
//  Created by mfang032 on 10/30/15.
//  Copyright © 2015 mfang032. All rights reserved.
//

import Foundation
import UIKit

extension UIImage{
    func imagetoBase64String() -> String{
        let imageData = UIImagePNGRepresentation(self)!
        return imageData.base64EncodedStringWithOptions(.Encoding64CharacterLineLength)
    }
    class func  base64StringToImage(strEncodeData: String) -> UIImage {
        let baseData = NSData(base64EncodedString: strEncodeData, options: .IgnoreUnknownCharacters)
        let image = UIImage(data: baseData!)
        return image!
        
    }
    
}

