//
//  ViewController.swift
//  自定义音乐播放器
//
//  Created by mfang032 on 3/4/16.
//  Copyright © 2016 mfang032. All rights reserved.
//

import UIKit
import AVFoundation
class ViewController: UIViewController, AVAudioPlayerDelegate {
    
    var audioPlayer: AVAudioPlayer
    var pNames: NSMutableArray = []
    var hNames: NSMutableArray = []
    var processTimer: NSTimer
    var volumeSlider: UISlider
    var time1: NSTimer
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

