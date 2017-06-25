//
//  ViewController.swift
//  AVKit播放视频和音频
//
//  Created by mfang032 on 2017/4/17.
//  Copyright © 2017年 mfang032. All rights reserved.
//

import UIKit
import AVFoundation
import AVKit

class ViewController: UIViewController {
    
    var pickerController: UIImagePickerController = UIImagePickerController()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        pickerController.delegate  = self
        
    }

    @IBAction func getPhotos(_ sender: UIButton) {
        self.present(pickerController, animated: true, completion: nil)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
}

