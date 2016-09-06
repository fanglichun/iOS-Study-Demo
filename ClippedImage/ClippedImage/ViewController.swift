//
//  ViewController.swift
//  ClippedImage
//
//  Created by mfang032 on 12/14/15.
//  Copyright © 2015 mfang032. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.orangeColor()
        let image = UIImage(named: "image.jpn")
        print(image?.size)
        let croppedImage = image?.cropToCircleWithBorderColor(UIColor.orangeColor(), width: 0)
        self.savaImage(croppedImage!, imageName: "image.jpg")
        print(croppedImage?.size)

        imageView.image = croppedImage
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
   
    
    func documentFolderPath() -> String {
        
        return NSHomeDirectory().stringByAppendingString("/Documents")
    }
    
    func savaImage(tempImage: UIImage, imageName: String) -> String {
        let imageData: NSData = UIImagePNGRepresentation(tempImage)!
        let fullPath: String = self.documentFolderPath().stringByAppendingString("/").stringByAppendingString(imageName)
        print(fullPath)
        imageData.writeToFile(fullPath, atomically: false)
        return fullPath
    }
    


}

