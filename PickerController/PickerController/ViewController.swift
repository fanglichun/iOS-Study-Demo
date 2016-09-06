//
//  ViewController.swift
//  PickerController
//
//  Created by mfang032 on 10/28/15.
//  Copyright © 2015 mfang032. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    
    var imgView = UIImageView()
    
    
    var img = UIImage()
    
    func goCamera(){
        
        
        //先设定sourceType为相机，然后判断相机是否可用（ipod）没相机，不可用将sourceType设定为相片库
        
        
        
        var sourceType = UIImagePickerControllerSourceType.Camera
        
        
        
        if !UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera){
            
            
            
            sourceType = UIImagePickerControllerSourceType.PhotoLibrary
            
            
            
        }
        
        
        var picker = UIImagePickerController()
        
        
        
        picker.delegate = self
        
        
        
        picker.allowsEditing = true//设置可编辑
        
        
        
        picker.sourceType = sourceType
        
        
        self.presentViewController(picker, animated: true, completion: nil)//进入照相界面
        
        
        
    }
    
    
    func goImage(){
        
        
        var pickerImage = UIImagePickerController()
        
        
        if !UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.PhotoLibrary){
            
            
            
            pickerImage.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
            
            
            
            pickerImage.mediaTypes = UIImagePickerController.availableMediaTypesForSourceType(pickerImage.sourceType)!
            
            
        }
        
        
        pickerImage.delegate = self
        
        
        
        pickerImage.allowsEditing = true
        
        
        
        self.presentViewController(pickerImage, animated: true, completion: nil)
        
        
    }

    func    imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        print(info)
        
        
        img = info[UIImagePickerControllerEditedImage] as! UIImage
        
        
        imgView.image = img
        
        
        
        picker.dismissViewControllerAnimated(true, completion: nil)

    }
    
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        
        
        picker.dismissViewControllerAnimated(true, completion: nil)

        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        var btn = UIButton()
        
        
        btn.frame = CGRectMake(50, 120, 200, 40)
        
        
        btn.backgroundColor = UIColor.orangeColor()
        
        
        
        btn.addTarget(self, action: "goCamera", forControlEvents: UIControlEvents.TouchUpInside)
        
        
        self.view.addSubview(btn)
        
        
        
        
        
        var btn1 = UIButton()
        
        
        btn1.frame = CGRectMake(50, 200, 200, 40)
        
        
        btn1.backgroundColor = UIColor.redColor()
        
        
        
        btn1.addTarget(self, action: "goImage", forControlEvents: UIControlEvents.TouchUpInside)
        
        
        self.view.addSubview(btn1)
        
        
        
        
        
        imgView.frame = CGRectMake(100, 260, 100, 100)
        
        
        self.view.addSubview(imgView)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

