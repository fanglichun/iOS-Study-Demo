//
//  ViewController.swift
//  WebImage
//
//  Created by mfang032 on 2/2/16.
//  Copyright © 2016 mfang032. All rights reserved.
//

import UIKit
import SDWebImage

class ViewController: UIViewController {

    @IBOutlet weak var avatarImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // 1
        //avatarImageView.sd_setImageWithURL(NSURL(string: "http://upload4.hlgnet.com/bbsupfile/2010/2010-11-06/20101106091537_43.jpg"), placeholderImage: UIImage(named: "head"))
        
        //avatarImageView.sd_setImageWithURL(NSURL(string: "http://upload4.hlgnet.com/bbsupfile/2010/2010-11-06/20101106091537_43.jpg"), placeholderImage: UIImage(named: "head"), options: .RefreshCached)
        
        // 2
//        avatarImageView.sd_setImageWithURL(NSURL(string: "http://upload4.hlgnet.com/bbsupfile/2010/2010-11-06/20101106091537_43.jpg"), placeholderImage: UIImage(named: "head")) { (image, error, cacheType, imageURL) -> Void in
//            print(cacheType)
//            print(imageURL)
//        }
        // 3
        let manager = SDWebImageManager.sharedManager()
        let imageUrl = NSURL(string: "http://upload4.hlgnet.com/bbsupfile/2010/2010-11-06/20101106091537_43.jpg")
//        manager.downloadImageWithURL(imageUrl, options: .RefreshCached, progress: { (receivedSize, expectedSize) -> Void in
//            }) { (image, error, cacheType, finished, imageURL) -> Void in
//                if let avatar = image {
//                    self.avatarImageView.image = avatar
//                }
//        }
        
        //4 Using Asynchronous Image Downloader Independently
        manager.downloadImageWithURL(imageUrl, options: .RefreshCached, progress: { (receivedSize, expectedSize) -> Void in
            }) { (image, error, cacheType, finished, imageURL) -> Void in
                guard finished else { return }
                if let avatar = image  {
                    self.avatarImageView.image = avatar
                }
        }
        
        // 5
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

