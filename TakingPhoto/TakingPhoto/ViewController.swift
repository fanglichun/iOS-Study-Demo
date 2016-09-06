//
//  ViewController.swift
//  TakingPhoto
//
//  Created by mfang032 on 11/14/15.
//  Copyright © 2015 mfang032. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    var imagePickerController: UIImagePickerController = UIImagePickerController()


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.imagePickerController.delegate = self
        self.imagePickerController.allowsEditing = true
        self.selectOption()
    }
    
    // MARK: whether the device'camera is avaliable
     func isCameraAvailable() -> Bool {
        return UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera)
    }
    
    // MARK: whether the PhotoLibrary is avaliable
     func isPhotoLibraryAvailable() -> Bool {
        return UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.PhotoLibrary)
    }
    
    func selectOption() {
        
        let actionSheetController: UIAlertController = UIAlertController(title: nil, message: nil, preferredStyle: UIAlertControllerStyle.ActionSheet)
        actionSheetController.view.tintColor = UIColor.orangeColor()
        
        // Create and add action of opening photo library
        let takePhotoAction: UIAlertAction = UIAlertAction(title: "Choose Photo", style: UIAlertActionStyle.Default) { action -> Void in
            
            if self.isPhotoLibraryAvailable() {
                let sourceType = UIImagePickerControllerSourceType.PhotoLibrary
                self.imagePickerController.mediaTypes = UIImagePickerController.availableMediaTypesForSourceType(sourceType)!
                self.presentViewController(self.imagePickerController, animated: true, completion: nil)
            }
        }
        actionSheetController.addAction(takePhotoAction)
        
        // Create and add action of opening camera
        if self.isCameraAvailable()  {
            let chooseFromCameraAction: UIAlertAction = UIAlertAction(title: "Take Photo", style: UIAlertActionStyle.Default) { action -> Void in
                let sourceType = UIImagePickerControllerSourceType.PhotoLibrary
                self.imagePickerController.sourceType = sourceType
                self.presentViewController(self.imagePickerController, animated: true, completion: nil)
                //self.imagePicker.showsCameraControls = true
            }
            actionSheetController.addAction(chooseFromCameraAction)
            
        } else {
            let chooseFromCameraAction: UIAlertAction = UIAlertAction(title: "Take Photo", style: UIAlertActionStyle.Default) { action -> Void in
                let sourceType = UIImagePickerControllerSourceType.PhotoLibrary
                self.imagePickerController.sourceType = sourceType
                self.presentViewController(self.imagePickerController, animated: true, completion: nil)
            }
            actionSheetController.addAction(chooseFromCameraAction)
            
        }
        
        //Create and add the Cancel action
        let cancelAction: UIAlertAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel) { action -> Void in
            //Just dismiss the action sheet
            self.dismissViewControllerAnimated(true, completion: nil)
        }
        actionSheetController.addAction(cancelAction)
        
        // Present the AlertController
        self.presentViewController(actionSheetController, animated: true, completion: nil)
    }
    

    
    
    }

    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        
        
        
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        
        
    }
    
    func navigationController(navigationController: UINavigationController, willShowViewController viewController: UIViewController, animated: Bool) {
        
    }
    
    func navigationController(navigationController: UINavigationController, didShowViewController viewController: UIViewController, animated: Bool) {
     
        
        
    }
    





