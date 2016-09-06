//
//  ViewController.swift
//  UIImagePickerController实现头像选择
//
//  Created by mfang032 on 10/28/15.
//  Copyright © 2015 mfang032. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    
    @IBOutlet weak var headPortrait: UIImageView!
    
    var imagePickerController: UIImagePickerController = UIImagePickerController()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        headPortrait.layer.cornerRadius = headPortrait.frame.width/2
        headPortrait.layer.masksToBounds = true
        
        headPortrait.userInteractionEnabled = true
        let iconTap = UITapGestureRecognizer()
        iconTap.addTarget(self, action: Selector("selectIcon"))
        headPortrait.addGestureRecognizer(iconTap)
        
    }
    
    
    func selectIcon() {
        
        let userIconAlert = UIAlertController(title: "请选择操作", message: nil, preferredStyle: UIAlertControllerStyle.ActionSheet)
        
        let chooseFromPhotoAlbum = UIAlertAction(title: "从相册中选择", style: UIAlertActionStyle.Default) { (UIAlertAction) -> Void in
            
            userIconAlert.addAction(chooseFromPhotoAlbum)
            
        }
        
        
        
        
    }
   
    
    
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

