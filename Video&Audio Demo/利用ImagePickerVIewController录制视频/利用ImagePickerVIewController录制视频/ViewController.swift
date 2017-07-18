//
//  ViewController.swift
//  利用ImagePickerVIewController录制视频
//
//  Created by mfang032 on 2017/7/8.
//  Copyright © 2017年 mfang032. All rights reserved.
//

import UIKit
import MobileCoreServices
import  MediaPlayer
import AVKit


class ViewController: UIViewController {
    
    var currentVideoUrl : URL?
    
    
    lazy var picker: UIImagePickerController = {
       let picker = UIImagePickerController()
        picker.delegate = self
        picker.mediaTypes = [kUTTypeMovie as String]
        picker.sourceType = .camera
        picker.cameraCaptureMode = .video
        return picker
    }()
 
    lazy var player: AVPlayerViewController = {
       let player = AVPlayerViewController()
        player.delegate = self
        return player
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func transcribe(_ sender: UIButton) {
        
        self.present(picker, animated: true, completion: nil);
        
    }
    @IBAction func playAction(_ sender: UIButton) {
        guard let videoUrl = currentVideoUrl else {
            return
        }
        let avPlayer = AVPlayer(url: videoUrl)
        player.player = avPlayer
        present(player, animated: true, completion: nil)
        
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        currentVideoUrl = info[UIImagePickerControllerMediaURL] as? URL
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
     picker.dismiss(animated: true, completion: nil)
    }
}

extension ViewController: AVPlayerViewControllerDelegate {
    
}

