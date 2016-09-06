//
//  ViewController.swift
//  AlertController
//
//  Created by mfang032 on 10/28/15.
//  Copyright © 2015 mfang032. All rights reserved.
//

import UIKit
import AssetsLibrary
import Photos.PHPhotoLibrary
class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    
    
    @IBOutlet weak var imageView: UIImageView!
    
    
    var imagePickerController: UIImagePickerController = UIImagePickerController()
    var isFullScreen: Bool = false
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        UIApplication.sharedApplication().keyWindow?.tintColor = UIColor.orangeColor()
        // 设置代理
        self.imagePickerController.delegate = self
        self.imagePickerController.allowsEditing = true
        
        
        
        
        self.imageView.layer.cornerRadius = 100
        self.imageView.layer.masksToBounds = true
      
        //为头像添加点击事件
        imageView.userInteractionEnabled=true
        let userIconActionGR = UITapGestureRecognizer()
        userIconActionGR.addTarget(self, action: Selector("selectIcon"))
        imageView.addGestureRecognizer(userIconActionGR)
        
    }
    
    func selectIcon() {
        
        let actionSheetController: UIAlertController = UIAlertController(title: "请选择操作", message: "Swiftly Now! Choose an option!", preferredStyle: .ActionSheet)
        
        
        //Create and add the Cancel action
        let cancelAction: UIAlertAction = UIAlertAction(title: "Cancel", style: .Cancel) { action -> Void in
            //Just dismiss the action sheet
        }
        actionSheetController.addAction(cancelAction)
        
        
        //Create and add first option action
        let takePictureAction: UIAlertAction = UIAlertAction(title: "Take Picture", style: .Default) { action -> Void in
            
            if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.PhotoLibrary) {
                
                self.imagePickerController.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
                
                self.imagePickerController.mediaTypes = UIImagePickerController.availableMediaTypesForSourceType(self.imagePickerController.sourceType)!
                self.presentViewController(self.imagePickerController, animated: true, completion: nil)
            }
        }
        actionSheetController.addAction(takePictureAction)
        
        
        //Create and add a second option action
        let choosePictureAction: UIAlertAction = UIAlertAction(title: "Choose From Camera Roll", style: .Default) { action -> Void in
            
            var sourceType = UIImagePickerControllerSourceType.Camera
            
            if !UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera) {
                
                sourceType = UIImagePickerControllerSourceType.PhotoLibrary
                self.imagePickerController.sourceType = sourceType
                self.presentViewController(self.imagePickerController, animated: true, completion: nil)
            }
        }
        
        actionSheetController.addAction(choosePictureAction)
        
        //Present the AlertController
        self.presentViewController(actionSheetController, animated: true, completion: nil)
        
        
    }
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        
        self.imageView.image = info[UIImagePickerControllerOriginalImage] as? UIImage
        
        picker.dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        picker.dismissViewControllerAnimated(true, completion: nil)
        
        
        
    }
    
    
    
    
    
    //MARK: - 保存图片至沙盒
    func saveImage(currentImage:UIImage,imageName:String){
        var imageData = NSData()
        imageData = UIImageJPEGRepresentation(currentImage, 0.5)!
        // 获取沙盒目录
        let fullPath = ((NSHomeDirectory() as NSString).stringByAppendingPathComponent("Documents") as NSString).stringByAppendingPathComponent(imageName)
        // 将图片写入文件
        imageData.writeToFile(fullPath, atomically: false)
    }
    
    @IBAction func showActionSheetTapped(sender: AnyObject) {
        let pt = PHPhotoLibrary.authorizationStatus()
        switch pt {
        case .Denied:
            print("denied")
        case .Authorized:
            print("authorized")
        case .NotDetermined:
            print("not determined")
        case .Restricted:
            print("restricted")
        }
        
      //  let status = ALAuthorizationStatus
//        switch status {
//        case ALAuthorizationStatus.Authorized:
//            print("authorized")
//        case ALAuthorizationStatus.Denied:
//            print("Denied")
//        case ALAuthorizationStatus.Restricted:
//            print("restricted")
//        case ALAuthorizationStatus.NotDetermined:
//            print("not determined")
//        }
        let actionSheetController: UIAlertController = UIAlertController(title: "请选择操作", message: "Swiftly Now! Choose an option!", preferredStyle: .ActionSheet)
        
        
        
        
        //Create and add the Cancel action
        let cancelAction: UIAlertAction = UIAlertAction(title: "Cancel", style: .Cancel) { action -> Void in
            //Just dismiss the action sheet
            
        }
        
        actionSheetController.addAction(cancelAction)
        //Create and add first option action
        
        
        
        let takePictureAction: UIAlertAction = UIAlertAction(title: "Take Picture", style: .Default) { action -> Void in
            
            if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.PhotoLibrary) {
                self.imagePickerController.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
                
                
                self.imagePickerController.mediaTypes = UIImagePickerController.availableMediaTypesForSourceType(self.imagePickerController.sourceType)!
                
                self.presentViewController(self.imagePickerController, animated: true, completion: nil)
            }
            
        }
        actionSheetController.addAction(takePictureAction)
        
        
        //Create and add a second option action
        let choosePictureAction: UIAlertAction = UIAlertAction(title: "Choose From Camera Roll", style: .Default) { action -> Void in
            
            
            var sourceType = UIImagePickerControllerSourceType.Camera
            
            if !UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera) {
                
                sourceType = UIImagePickerControllerSourceType.PhotoLibrary
                self.imagePickerController.sourceType = sourceType
            self.presentViewController(self.imagePickerController, animated: true, completion: nil)
                
            }
            
            
        }
        actionSheetController.addAction(choosePictureAction)
        
        //Present the AlertController
        self.presentViewController(actionSheetController, animated: true, completion: nil)
    }
    


}

