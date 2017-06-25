//
//  Record&PlayAudio.swift
//  AVAudioRecorder+ AVAudioPlayer
//
//  Created by mfang032 on 2017/4/19.
//  Copyright © 2017年 mfang032. All rights reserved.
//

import UIKit
import AVFoundation

class Record_PlayAudio: NSObject {
    
    static let kRecordAudioFile = "myRecord.caf"
    var progress: Float = 0.0
    
    lazy var audioRecorder: AVAudioRecorder? = {
        //创建录音保存路径
        let url = Record_PlayAudio.getSavePath()
        //创建录音格式设置
        let settings = Record_PlayAudio.getAudioSettings()
        do {
            let audioRecorder = try AVAudioRecorder(url: url, settings: settings)
            audioRecorder.delegate = self
            audioRecorder.isMeteringEnabled = true
            return audioRecorder

        } catch {
            print(error)
        }
        return nil
    }()
    
    
    lazy var audioPlayer: AVAudioPlayer? = {
        let url = Record_PlayAudio.getSavePath()
        do {
             let audioPlayer = try AVAudioPlayer(contentsOf: url)
            /*
             A value of zero means to play the sound just once.
             A value of one will result in playing the sound twice, and so on..
             Any negative number will loop indefinitely until stopped.
             */
            audioPlayer.numberOfLoops = 0
            audioPlayer.prepareToPlay()
            return audioPlayer
        } catch {
            print(error.localizedDescription)
        }
        return nil
    }()
    
    lazy var timer: Timer? = {
        let timer = Timer(timeInterval: 0.1, target: self, selector: #selector(audioPowerChange), userInfo: nil, repeats: true)
        RunLoop.main.add(timer, forMode: RunLoopMode.commonModes)
        return timer
    }()
    
    deinit {
        timer?.invalidate()
        timer = nil
    }
    
}

extension Record_PlayAudio: AVAudioRecorderDelegate {
    
    func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder, successfully flag: Bool) {
        if let isPlaying = audioPlayer?.isPlaying {
            if !isPlaying {
                audioPlayer?.play()
            }
        }
    }
    
    func audioRecorderEncodeErrorDidOccur(_ recorder: AVAudioRecorder, error: Error?) {
        
    }
}

extension Record_PlayAudio {
    
    class func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentsDirectory = paths[0]
        return documentsDirectory
    }
    
    class func getSavePath() -> URL {
        return getDocumentsDirectory().appendingPathComponent(kRecordAudioFile)
    }
    
    class func getAudioSettings() ->[String: Any] {
        var dict: [String: Any] = [:]
        dict[AVFormatIDKey] = kAudioFormatLinearPCM //设置录音格式
        dict[AVSampleRateKey] = 8000 //设置录音采样率
        dict[AVNumberOfChannelsKey] = 1//设置为单声道
        dict[AVLinearPCMBitDepthKey] = 8
        dict[AVLinearPCMIsFloatKey] = true
        dict[AVEncoderAudioQualityKey] = AVAudioQuality.high
        
        return dict
    }
    
    func audioPowerChange() {
        audioRecorder?.updateMeters()
        if let power = audioRecorder?.averagePower(forChannel: 0) {////取得第一个通道的音频，注意音频强度范围时-160到0
            let progress = (1.0 / 160.0) * (power + 160.0)
            self.progress = progress
        }
        
    }
    
    class func setAudioSession() {
        let audioSession = AVAudioSession.sharedInstance()
        //设置为播放和录音状态，以便可以在录制完之后播放录音
        do {
            try audioSession.setCategory(AVAudioSessionCategoryPlayAndRecord)
            try audioSession.setActive(true)
        } catch {
            print(error)
        }
    }
}
