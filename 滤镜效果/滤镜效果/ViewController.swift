//
//  ViewController.swift
//  滤镜效果
//
//  Created by mfang032 on 5/7/16.
//  Copyright © 2016 mfang032. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    
    //图片原图
    lazy var originalImage: UIImage = {
        if let image = UIImage(named: "head") {
            return image
        }
        return UIImage()
        }()
    
    lazy var context: CIContext = {
        return CIContext(options: nil)
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func optimizeImage(sender: UIButton) {
//        var inputImage = CIImage(image: originalImage)
//        let options: [String: AnyObject] = [CIDetectorImageOrientation: 1]// 图片方向
//        if let filters = inputImage?.autoAdjustmentFiltersWithOptions(options) {
//            //遍历所有的滤镜 依次处理图像
//            for filter in filters {
//                filter.setValue(inputImage, forKey: kCIInputImageKey)
//                inputImage = filter.outputImage
//            }
//        }
//        let cgImage = context.createCGImage(inputImage!, fromRect: (inputImage?.extent)!)
//        self.imageView.image = UIImage(CGImage: cgImage)
        var inputImage = CIImage(image: originalImage)
        let options:[String : AnyObject] = [CIDetectorImageOrientation:1] //图片方向
        let filters = inputImage!.autoAdjustmentFiltersWithOptions(options)
        //遍历所有滤镜，依次处理图像
        for filter: CIFilter in filters {
            filter.setValue(inputImage, forKey: kCIInputImageKey)
            inputImage = filter.outputImage
        }
        let cgImage = context.createCGImage(inputImage!, fromRect: inputImage!.extent)
        self.imageView.image = UIImage(CGImage: cgImage)
    }

    
    @IBAction func restoreImage(sender: UIButton) {
        self.imageView.image = originalImage
    }

}

