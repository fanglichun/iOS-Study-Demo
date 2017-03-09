//
//  ViewController.swift
//  SearchImage
//
//  Created by flc on 2017/3/2.
//  Copyright © 2017年 Michael. All rights reserved.
//

import UIKit

import MobileCoreServices
import AssetsLibrary

import Photos

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let assert = ALAssetsLibrary()
        let queue = DispatchQueue.global(qos: DispatchQoS.QoSClass.default)
        queue.async {
            assert.enumerateGroupsWithTypes(ALAssetsGroupAll, usingBlock: { (group, stop) in
                
                group?.enumerateAssets({ (result, index, stop) in
                    let assetType = result?.value(forProperty: ALAssetPropertyType) as! String
                    if assetType == ALAssetTypePhoto {
                        
                        let  assetRepresentation = result?.defaultRepresentation()
                        let imageScale = CGFloat((assetRepresentation?.scale())!)
                        let orientation = assetRepresentation?.orientation()
                        DispatchQueue.main.async {
                            let imageRef = assetRepresentation?.fullScreenImage()
                            let image = UIImage(cgImage: imageRef as! CGImage, scale: imageScale, orientation: orientation as! UIImageOrientation)
                            self.imageView.image = image
                        }
                        
                        
                    }
                })
                
            }, failureBlock: { (error) in
                
            })
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

