//
//  ViewController.swift
//  AVAudioPlayer+音乐播放
//
//  Created by mfang032 on 2017/4/18.
//  Copyright © 2017年 mfang032. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    fileprivate var isPlaying = false
    
    @IBOutlet weak var playerProgress: UIProgressView!
    @IBOutlet weak var playPauseButton: UIButton!
    
    
    lazy var timer: Timer? = {
        let timer = Timer(timeInterval: 0.5, target: self, selector: #selector(updateProgress), userInfo: nil, repeats: true)
        return timer
    }()
    
    lazy var audioPlayer: AVAudioPlayer? = {//通过一个文件路径来加载音乐
        guard let urlPath = Bundle.main.path(forResource: "1724.mp3", ofType: nil) else {
            return nil
        }
        
        let url = URL(fileURLWithPath: urlPath)
        print("url:\(url)")
        do {
            let audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer.numberOfLoops = 0//设置为0不循环
            audioPlayer.delegate = self
            audioPlayer.prepareToPlay()
            return audioPlayer
        } catch {
            print(error.localizedDescription)
            return nil
        }
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        audioPlayer?.play()
        //set background play mode
        setBackgroundPlay()
       
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        audioPlayer?.stop()
    }
    
    @IBAction func playClicked(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        if sender.isSelected {
            playPauseButton.setImage(UIImage(named: "pause"), for: UIControlState.normal)
            pause()
            removeProgressTimer()
        } else {
            playPauseButton.setImage(UIImage(named: "play-button"), for: UIControlState.normal)
            play()
            addProgressTimer()
        }
        
    }
    
    @IBAction func favoriate(_ sender: UIButton) {
        
    }
    
    @IBAction func download(_ sender: UIButton) {
        
    }
    
    @IBAction func back(_ sender: UIButton) {
        
    }
    
    @IBAction func forward(_ sender: UIButton) {
        
    }
    
    @objc func updateProgress() {
        if let audioPlayer = audioPlayer {
            print("是否正在播放:\(audioPlayer.isPlaying)")
            print("current time:\(audioPlayer.currentTime)")
            print("duration:\(audioPlayer.duration)")
            let currentProgress = audioPlayer.currentTime / audioPlayer.duration
            playerProgress.setProgress(Float(currentProgress), animated: true)
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    deinit {
        timer?.invalidate()
        timer = nil
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.AVAudioSessionRouteChange, object: nil)
    }
    
}

extension ViewController {
    
    func addProgressTimer() {
        timer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(updateProgress), userInfo: nil, repeats: true)
        RunLoop.main.add(timer!, forMode: RunLoopMode.commonModes)
    }
    
    func removeProgressTimer() {
        timer?.invalidate()
        timer = nil
    }
    
    func play() {
        if let audioPlayer = audioPlayer {
            if !audioPlayer.isPlaying {
                audioPlayer.play()
                self.timer?.fireDate = Date.distantPast
            }
        }
        
    }
    
    func pause() {
        if let audioPlayer = audioPlayer {
            if audioPlayer.isPlaying {
                audioPlayer.pause()
                timer?.fireDate = Date.distantFuture
            }
        }
    }
    
    func setBackgroundPlay() {
        let audioSession = AVAudioSession.sharedInstance()
        do {
            try audioSession.setCategory(AVAudioSessionCategoryPlayback)
            try audioSession.setActive(true)
            //add notification and after pulled out headphones and audio play stoped
            NotificationCenter.default.addObserver(self, selector: #selector(routeChange(_:)), name: NSNotification.Name.AVAudioSessionRouteChange, object: nil)
        } catch {
            fatalError(error.localizedDescription)
        }
    }
    
    /*
     输出改变通知对象
     */
    func routeChange(_ notification: Notification) {
        guard let userInfoDic = notification.userInfo as? [String: Any]  else {
            return
        }
        
        guard let changeReason = userInfoDic[AVAudioSessionRouteChangeReasonKey] as? UInt else {
            return
        }
        guard changeReason == AVAudioSessionRouteChangeReason.oldDeviceUnavailable.rawValue else {//
            return
        }
        
        guard  let routeDescription = userInfoDic[AVAudioSessionRouteChangePreviousRouteKey]  as? AVAudioSessionRouteDescription else {
            return
        }
        let portDescription = routeDescription.outputs.first
        if portDescription?.portType == "Headphones" {
            self.pause()
        }
    }
    
}

extension ViewController: AVAudioPlayerDelegate {
    
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        if flag {
            print("音乐播放完成")
            do {
                try AVAudioSession.sharedInstance().setActive(false)

            } catch {
                fatalError(error.localizedDescription)
            }
        }
        
    }
    
    func audioPlayerDecodeErrorDidOccur(_ player: AVAudioPlayer, error: Error?) {
        print(error?.localizedDescription ?? "")
    }
    
    
}

