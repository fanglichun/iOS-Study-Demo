//
//  ViewController.swift
//  音频会话
//
//  Created by mfang032 on 2017/4/18.
//  Copyright © 2017年 mfang032. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var timer: Timer?
    
    var audioSession: AVAudioSession = {
        let audioSession = AVAudioSession.sharedInstance()
        do {
            try audioSession.setCategory(AVAudioSessionCategoryPlayback)
            try audioSession.setActive(true)
        } catch {
            print(error)
        }
        return audioSession
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    deinit {
        timer?.invalidate()
        timer = nil
    }


}

extension ViewController {
    
    func addProgressTimer() {
        timer = Timer(timeInterval: 0.5, target: self, selector: #selector(updateProgress), userInfo: nil, repeats: true)
        RunLoop.main.add(timer!, forMode: RunLoopMode.commonModes)
    }
    
    func removeProgressTimer() {
        timer?.invalidate()
        timer = nil
    }
    
    func updateProgress() {
        
    }
}

