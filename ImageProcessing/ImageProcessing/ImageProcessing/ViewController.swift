//
//  ViewController.swift
//  ImageProcessing
//
//  Created by mfang032 on 2017/5/14.
//  Copyright © 2017年 mfang032. All rights reserved.
//

import UIKit
import CoreImage

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        filterImage()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension ViewController {
    
    
    func filterImage() {
        //1、create a CIContext object with defalult options
        let context = CIContext()
        //2、Instantiate a CIFilter object representing the filter to apply, and provide values for its parameters
        let filter = CIFilter(name: "logo")
        guard let path = Bundle.main.path(forResource: "logo.png", ofType: nil) else {
            return
        }
        let url = URL(fileURLWithPath: path)
        guard let image = CIImage(contentsOf: url) else {
            return
        }
        
        //one kind of filter option
        filter?.setValue(0.8, forKey: kCIInputIntensityKey)
        guard let result = filter?.outputImage else {
            return
        }
        if  let cgImage = context.createCGImage(image, from: result.extent) {
            print(cgImage)
        }
    }
    
    func applyFilterChain(to image: UIImage) ->UIImage? {
        guard let ciImage = CIImage(image: image) else { return nil }
        guard let colorFilter = CIFilter(name: "CIPhotoEffectProcess", withInputParameters: [kCIInputImageKey: ciImage]) else {
            return nil
        }
        guard let bloomImage = colorFilter.outputImage?.applyingFilter("CIBloom", withInputParameters: [kCIInputRadiusKey: 10.0, kCIInputIntensityKey: 1.0]) else {
            return nil
        }
        let cropedImage = bloomImage.cropping(to: bloomImage.extent)
        return UIImage(ciImage: cropedImage)
    }
}
