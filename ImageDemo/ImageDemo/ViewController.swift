//
//  ViewController.swift
//  ImageDemo
//
//  Created by mfang032 on 11/2/15.
//  Copyright © 2015 mfang032. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var imageView: UIImageView!
    
    let imagePickerController: UIImagePickerController = UIImagePickerController()
    
    var isFullScreen: Bool = false
    
    @IBAction func chooseImage(sender: AnyObject) {
        
        // 设置代理
        self.imagePickerController.delegate = self
        // 设置是否可以管理已经存在的图片或者视频
        self.imagePickerController.allowsEditing = true
        
        // 判断是否支持相机
        if(UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera)){
            let alertController: UIAlertController = UIAlertController(title: nil, message: nil, preferredStyle: UIAlertControllerStyle.ActionSheet)
            //在iPad上使用表单（ActionSheet）需要设置描点(anchor point)
            let popover = alertController.popoverPresentationController
            if (popover != nil){
                popover?.sourceView = sender as? UIView
                popover?.sourceRect = sender.bounds
                popover?.permittedArrowDirections = UIPopoverArrowDirection.Any
            }
            
            let cameraAction: UIAlertAction = UIAlertAction(title: "拍照换头像", style: .Default) { (action: UIAlertAction!) -> Void in
                // 设置类型
                self.imagePickerController.sourceType = UIImagePickerControllerSourceType.Camera
                self.presentViewController(self.imagePickerController, animated: true, completion: nil)
            }
            alertController.addAction(cameraAction)
            
            let photoLibraryAction: UIAlertAction = UIAlertAction(title: "从相册选择换头像", style: .Default) { (action: UIAlertAction!) -> Void in
                // 设置类型
                self.imagePickerController.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
                //改navigationBar背景色
                self.imagePickerController.navigationBar.barTintColor = UIColor(red: 171/255, green: 202/255, blue: 41/255, alpha: 1.0)
                //改navigationBar标题色
                self.imagePickerController.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
                //改navigationBar的button字体色
                self.imagePickerController.navigationBar.tintColor = UIColor.whiteColor()
                self.presentViewController(self.imagePickerController, animated: true, completion: nil)
            }
            alertController.addAction(photoLibraryAction)
            
            let cancelAction: UIAlertAction = UIAlertAction(title: "取消", style: .Cancel, handler: nil)
            alertController.addAction(cancelAction)
            
            presentViewController(alertController, animated: true, completion: nil)
            
        }else{
            let alertController: UIAlertController = UIAlertController(title: nil, message: nil, preferredStyle: UIAlertControllerStyle.ActionSheet)
            //设置描点(anchor point)
            let popover = alertController.popoverPresentationController
            if (popover != nil){
                popover?.sourceView = sender as? UIView
                popover?.sourceRect = sender.bounds
                popover?.permittedArrowDirections = UIPopoverArrowDirection.Any
            }
            
            let photoLibraryAction: UIAlertAction = UIAlertAction(title: "从相册选择换头像", style: .Default) { (action: UIAlertAction!) -> Void in
                // 设置类型
                self.imagePickerController.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
                //改navigationBar背景色
                self.imagePickerController.navigationBar.barTintColor = UIColor(red: 171/255, green: 202/255, blue: 41/255, alpha: 1.0)
                //改navigationBar标题色
                self.imagePickerController.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
                //改navigationBar的button字体色
                self.imagePickerController.navigationBar.tintColor = UIColor.whiteColor()
                self.presentViewController(self.imagePickerController, animated: true, completion: nil)
            }
            alertController.addAction(photoLibraryAction)
            
            let cancelAction: UIAlertAction = UIAlertAction(title: "取消", style: .Cancel, handler: nil)
            alertController.addAction(cancelAction)
            
            presentViewController(alertController, animated: true, completion: nil)
        }
    }
    
    
    //实现ImagePicker delegate 事件
         func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]) {
               picker.dismissViewControllerAnimated(true, completion: nil)
                var image: UIImage!
                 // 判断，图片是否允许修改
                 if(picker.allowsEditing){
                         //裁剪后图片
                    image = info[UIImagePickerControllerEditedImage] as! UIImage
                     }else{
                         //原始图片
                         image = info[UIImagePickerControllerOriginalImage] as! UIImage
                     }
                 /* 此处info 有六个值
        114         * UIImagePickerControllerMediaType; // an NSString UTTypeImage)
        115         * UIImagePickerControllerOriginalImage;  // a UIImage 原始图片
        116         * UIImagePickerControllerEditedImage;    // a UIImage 裁剪后图片
        117         * UIImagePickerControllerCropRect;       // an NSValue (CGRect)
        118         * UIImagePickerControllerMediaURL;       // an NSURL
        119         * UIImagePickerControllerReferenceURL    // an NSURL that references an asset in the AssetsLibrary framework
        120         * UIImagePickerControllerMediaMetadata    // an NSDictionary containing metadata from a captured photo
        121         */
                 // 保存图片至本地，方法见下文
                 self.saveImage(image, newSize: CGSize(width: 256, height: 256), percent: 0.5, imageName: "currentImage.png")
                 let fullPath: String = NSHomeDirectory().stringByAppendingPathComponent("Documents").stringByAppendingPathComponent("currentImage.png")
                 print("fullPath=\(fullPath)")
                 let savedImage: UIImage = UIImage(contentsOfFile: fullPath)!
                 self.isFullScreen = false
                 self.imageView.image = savedImage
                 //在这里调用网络通讯方法，上传头像至服务器...
             }
    
    
    // 当用户取消时，调用该方法
        func imagePickerControllerDidCancel(picker: UIImagePickerController) {
                 self.dismissViewControllerAnimated(true, completion: nil)
             }
    
    
    func saveImage(currentImage: UIImage, newSize: CGSize, percent: CGFloat, imageName: String){
                 //压缩图片尺寸
                UIGraphicsBeginImageContext(newSize)
              currentImage.drawInRect(CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height))
                 let newImage: UIImage = UIGraphicsGetImageFromCurrentImageContext()
                UIGraphicsEndImageContext()
                 //高保真压缩图片质量
                 //UIImageJPEGRepresentation此方法可将图片压缩，但是图片质量基本不变，第二个参数即图片质量参数。
                let imageData: NSData = UIImageJPEGRepresentation(newImage, percent)!
            // 获取沙盒目录,这里将图片放在沙盒的documents文件夹中
                 let fullPath: String = NSHomeDirectory().stringByAppendingPathComponent("Documents").stringByAppendingPathComponent(imageName)
                 // 将图片写入文件
                imageData.writeToFile(fullPath, atomically: false)
             }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

