//: Playground - noun: a place where people can play

import UIKit
import CoreImage

extension UIImage {
    
    func resizeImage(_ image: UIImage, targetSize: CGSize) -> UIImage? {
        
        let newRect = CGRect(x: 0, y: 0, width: targetSize.width, height: targetSize.height).integral
        UIGraphicsBeginImageContextWithOptions(targetSize, false, 0)
        if let context = UIGraphicsGetCurrentContext() {
            context.interpolationQuality = .high
            let flipVertical = CGAffineTransform(a: 1, b: 0, c: 0, d: -1, tx: 0, ty: targetSize.height)
            context.concatenate(flipVertical)
            context.draw(self.cgImage!, in: newRect)
            let newImage = UIImage(cgImage: context.makeImage()!)
            UIGraphicsEndImageContext()
            return newImage
        }
        return nil
    }
}

var CIFilterNames = [Any]()
let context = CIContext()
let filter = CIFilter(name: "CISepiaTone")
filter?.setValue(0.8, forKey: kCIInputIntensityKey)



