//
//  ViewController.swift
//  PopPresentController
//
//  Created by mfang032 on 11/4/15.
//  Copyright © 2015 mfang032. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var avatar: UIImageView!
    let imagePicker: UIImagePickerController = UIImagePickerController()


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.imagePicker.delegate = self
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        
        let image = info[UIImagePickerControllerEditedImage] as! UIImage
        
        self.avatar.image = image
        
    }
    
    
    
    @IBAction func btnClicked(sender: AnyObject) {
        let alertController: UIAlertController = UIAlertController(title: "Please choose", message: nil, preferredStyle: UIAlertControllerStyle.ActionSheet)
        let popover = alertController.popoverPresentationController
        if popover != nil {
            popover?.sourceView = self.view
            popover?.sourceRect = self.view.bounds
            popover?.permittedArrowDirections = UIPopoverArrowDirection.Up
        }
        
        
        let choosePhotoAction: UIAlertAction = UIAlertAction(title: "Choose From Camera Roll", style: .Default) { action -> Void in
            
            var sourceType = UIImagePickerControllerSourceType.Camera
            
            if !UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera) {
                sourceType = UIImagePickerControllerSourceType.PhotoLibrary
                self.imagePicker.sourceType = sourceType
            } else {
                
                self.imagePicker.sourceType = sourceType
            }
            self.presentViewController(self.imagePicker, animated: true, completion: nil)
            
        }
        alertController.addAction(choosePhotoAction)
        
        
        let takePhotoAction: UIAlertAction = UIAlertAction(title: "Take Photo", style: .Default) { action -> Void in
            
            if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.PhotoLibrary) {
                let sourceType = UIImagePickerControllerSourceType.PhotoLibrary
                self.imagePicker.mediaTypes = UIImagePickerController.availableMediaTypesForSourceType(sourceType)!
                self.presentViewController(self.imagePicker, animated: true, completion: nil)
                
            }
            
        }
        alertController.addAction(takePhotoAction)
        
        
        //Create and add the Cancel action
        let cancelAction: UIAlertAction = UIAlertAction(title: "Cancel", style: .Default) { action -> Void in
            //Just dismiss the action sheet
            self.dismissViewControllerAnimated(true, completion: nil)
        }
        alertController.addAction(cancelAction)
        
        // Present the AlertController
        self.presentViewController(alertController, animated: true, completion: nil)
        
    }
    

        
        

    
    
    
    

    


}

