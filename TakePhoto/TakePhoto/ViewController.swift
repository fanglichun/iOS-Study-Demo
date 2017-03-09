//
//  ViewController.swift
//  TakePhoto
//
//  Created by flc on 2017/3/2.
//  Copyright © 2017年 Michael. All rights reserved.
//

import UIKit

import MobileCoreServices


class ViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //check whether cameral is availabel
        
        //config pickerController
        
        configPickerController()
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func configPickerController() {
        let pickerController = UIImagePickerController()
        pickerController.sourceType = .camera
        let requiredMediaString = kUTTypeImage as String
        pickerController.mediaTypes.append(requiredMediaString)
        
        //set whether image can edited
        pickerController.allowsEditing = false
        pickerController.delegate = self
        pickerController.cameraFlashMode = .on
        pickerController.cameraDevice = .rear
        navigationController?.present(pickerController, animated: true, completion: nil)
        
        
        
        
    }


}

extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        guard let mediaType = info[UIImagePickerControllerMediaType] as? String else { return }
        
        if mediaType == (kUTTypeImage as String) {
            guard let image = info[UIImagePickerControllerOriginalImage] as? UIImage else {
                return
            }
            
            imageView.image = image
            imageView.contentMode = .scaleToFill
            
            UIImageWriteToSavedPhotosAlbum(image, self, nil, nil)
        }
        
    }
    
    func imageWasSavedSuccessfully(_ paraImage: UIImage, didFinishedSavedError error: Error, contextInfo paraInfo: ()->Void?) {
        
    }
    
}

