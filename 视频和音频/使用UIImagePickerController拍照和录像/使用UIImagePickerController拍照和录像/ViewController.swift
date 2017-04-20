//
//  ViewController.swift
//  使用UIImagePickerController拍照和录像
//
//  Created by mfang032 on 2017/4/17.
//  Copyright © 2017年 mfang032. All rights reserved.
//

import UIKit
import  AVFoundation
import MobileCoreServices

class ViewController: UIViewController {
    
    @IBOutlet weak var photoImageView: UIImageView!
    
    
    //var imagePicker: UIImagePickerController = UIImagePickerController()
    var player: AVPlayer?
    
    lazy var imagePicker: REXCustomImagePickerController = {
        let imagePicker = REXCustomImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = ViewController.isAVailabelForCameralSource() ? .camera : .photoLibrary
        print(imagePicker.sourceType)
//        if ViewController.isAvailabelForRearCameal() {
//            imagePicker.cameraDevice = UIImagePickerControllerCameraDevice.rear
//        } else if ViewController.isAvailabelForFrontCameal() {
//            imagePicker.cameraDevice = UIImagePickerControllerCameraDevice.front
//        }
        return imagePicker
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        photoImageView.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer()
        tapGesture.addTarget(self, action: #selector(tappedAvatar))
        photoImageView.addGestureRecognizer(tapGesture)
    }
    
    func tappedAvatar() {
        
        guard ViewController.isAVailabelForCameralSource() || ViewController.isAVailabelForPhotoLibrarySource() else {
            let alertView = UIAlertController(title: "", message: "Photo Library or Cameral isn't availableq", preferredStyle: UIAlertControllerStyle.alert)
            let cancelAction = UIAlertAction(title: "", style: UIAlertActionStyle.destructive, handler: { (action) in
                self.dismiss(animated: true, completion: nil)
            })
            alertView.addAction(cancelAction)
            return
        }
        
        
        let alertController: UIAlertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        if ViewController.isAVailabelForPhotoLibrarySource() {
            let choosePhotoAction = UIAlertAction(title: "Choose from Library", style: .default, handler: { (action) in
                self.imagePicker.navigationBar.tintColor = UIColor.black
                self.imagePicker.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
                self.imagePicker.allowsEditing = true
                self.imagePicker.sourceType = .photoLibrary
                self.imagePicker.beginAppearanceTransition(true, animated: true)
                self.imagePicker.modalPresentationStyle = .formSheet
                self.imagePicker.preferredContentSize = CGSize(width: 300, height: 600)
                let popVC = self.imagePicker.popoverPresentationController
                popVC?.barButtonItem = UIBarButtonItem(customView: self.photoImageView!)
                self.present(self.imagePicker, animated: true, completion: nil)
            })
            
            alertController.addAction(choosePhotoAction)
        }
        if ViewController.isAVailabelForCameralSource() {
            let takePhotoAction = UIAlertAction(title: "Take new Photo", style: UIAlertActionStyle.default, handler: { (action) in
                self.imagePicker.sourceType = .camera
                self.imagePicker.allowsEditing = true
                self.present(self.imagePicker, animated: true, completion: nil)
            })
            alertController.addAction(takePhotoAction)
        }
        
        if !DeviceType.IS_IPAD {
            let cancelAction: UIAlertAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel) { action -> Void in
            }
            
            alertController.addAction(cancelAction)
        }
        if DeviceType.IS_IPAD {
            alertController.popoverPresentationController?.sourceView = self.photoImageView
            alertController.popoverPresentationController?.sourceRect = self.photoImageView!.frame
            alertController.popoverPresentationController?.permittedArrowDirections = .up
            self.present(alertController, animated: true, completion: nil)
        } else {
            self.present(alertController, animated: true, completion: nil)
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func takePhoto(_ sender: UIButton) {
        /*
        if ViewController.isAVailabelForCameralSource() {
//            imagePicker.cameraCaptureMode = .photo
//            imagePicker.sourceType = .camera
        } else if ViewController.isAVailabelForPhotoLibrarySource() {
            imagePicker.sourceType = .photoLibrary
        }*/
        imagePicker.sourceType = .camera
        self.present(imagePicker, animated: true, completion: nil)
    }
    
    
    @IBAction func recordVideoes(_ sender: UIButton) {
        if ViewController.isAvailabelForFrontCameal() || ViewController.isAvailabelForRearCameal() {
            imagePicker.mediaTypes = [kUTTypeMovie as String]
            imagePicker.videoQuality = .typeIFrame1280x720
            //imagePicker.cameraCaptureMode = .video
            self.present(imagePicker, animated: true, completion: nil)
        } else {
            let alertController = UIAlertController(title: "", message: "Your cameral device is not availabel", preferredStyle: UIAlertControllerStyle.alert)
            let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel, handler: { (alertAction) in
                self.dismiss(animated: true, completion: nil)
            })
            alertController.addAction(cancelAction)
            self.present(alertController, animated: true, completion: nil)
        }
    }
    
}

extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate  {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        guard let mediaType = info[UIImagePickerControllerMediaType] as? String  else {
            return
        }
        if mediaType == kUTTypeImage as String {
            
            var img: UIImage?
            if imagePicker.allowsEditing {
                img = (info[UIImagePickerControllerEditedImage] as? UIImage)
                
            } else {
                img = (info[UIImagePickerControllerOriginalImage] as? UIImage)
            }
            self.photoImageView.image = img
            if img != nil {
                UIImageWriteToSavedPhotosAlbum(img!, nil, nil, nil)
            }
            
        } else if mediaType == kUTTypeMovie as String {
            guard let url = info[UIImagePickerControllerMediaURL] as? URL else {
                return
            }
            let urlPath = url.path
            if UIVideoAtPathIsCompatibleWithSavedPhotosAlbum(urlPath) {
                UISaveVideoAtPathToSavedPhotosAlbum(urlPath, nil, nil, nil)
                //UISaveVideoAtPathToSavedPhotosAlbum(urlPath, self, #selector(saveVideoCallback(_:_:)), nil)
                
            }
        }
        
        picker.dismiss(animated: true, completion: nil)
        
        
        
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
}

extension ViewController {
    
    class func isAVailabelForCameralSource() ->Bool {
        return UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.camera)
    }
    
    class func isAVailabelForPhotoLibrarySource() ->Bool {
        return UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.photoLibrary)
    }
    
    class func isAvailabelForRearCameal() ->Bool {
        return UIImagePickerController.isCameraDeviceAvailable(UIImagePickerControllerCameraDevice.rear)
    }
    
    class func isAvailabelForFrontCameal() ->Bool {
        return UIImagePickerController.isCameraDeviceAvailable(UIImagePickerControllerCameraDevice.front)
    }
    
    func saveVideoCallback(_ urlPath: String, _ error: Error) {
        if error.localizedDescription.characters.count > 0 {
            print("保存食品發生錯誤：\(error.localizedDescription)")
        } else {
            if let url = URL(string: urlPath) {
                player = AVPlayer(url: url)
                let playerLayer = AVPlayerLayer(player: player)
                playerLayer.frame = photoImageView.frame
                self.photoImageView.layer.addSublayer(playerLayer)
                player?.play()
            }
        }
    }
    
    
    
}

