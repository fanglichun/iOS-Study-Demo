//
//  ViewController.swift
//  AVAudioRecorder+ AVAudioPlayer
//
//  Created by mfang032 on 2017/4/19.
//  Copyright © 2017年 mfang032. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var audioProgress: UIProgressView!
    
    @IBOutlet weak var record: UIButton!
    
    @IBOutlet weak var pause: UIButton!
    
    @IBOutlet weak var resume: UIButton!
    
    @IBOutlet weak var stop: UIButton!
    
    lazy var recordAndPlayAudio: Record_PlayAudio = Record_PlayAudio()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func record(_ sender: UIButton) {
        if let isRecording = recordAndPlayAudio.audioRecorder?.isRecording {
            if !isRecording {
                recordAndPlayAudio.audioRecorder?.record()
                recordAndPlayAudio.timer?.fireDate = Date.distantPast
            }
        }
    }
    
    @IBAction func pause(_ sender: UIButton) {
        if let isRecording = recordAndPlayAudio.audioRecorder?.isRecording {
            if isRecording {
                recordAndPlayAudio.audioRecorder?.pause()
                recordAndPlayAudio.timer?.fireDate = Date.distantFuture
            }
        }
    }
    
    @IBAction func resume(_ sender: UIButton) {
        record(sender)
        
    }
    
    @IBAction func stop(_ sender: UIButton) {
        recordAndPlayAudio.audioRecorder?.stop()
        recordAndPlayAudio.timer?.fireDate = Date.distantFuture
        audioProgress.progress = 0.0
        
        
    }

}

