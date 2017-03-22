//
//  ViewController.swift
//  AlamofireTest
//
//  Created by mfang032 on 12/20/15.
//  Copyright © 2015 mfang032. All rights reserved.
//

import UIKit
import AlamofireImage
class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let image = UIImage(named: "head")!
        let radius: CGFloat = 20.0
        let roundedImage = image.af_imageWithRoundedCornerRadius(radius)
        let circularImage = image.af_imageRoundedIntoCircle()
        self.imageView.image = circularImage
        
//        let URL = NSBundle.mainBundle().URLForResource("head", withExtension: ".png")!
//        let data = NSData(contentsOfURL: URL)!
//        let image = UIImage(data: data, scale: UIScreen.mainScreen().scale)!
//        image.af_inflate()
//        self.imageView.image = image

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

