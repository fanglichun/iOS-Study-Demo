//
//  ViewController.swift
//  AudioToolbox+音效播放
//
//  Created by mfang032 on 2017/4/18.
//  Copyright © 2017年 mfang032. All rights reserved.
//

import UIKit
import AudioToolbox
/*
 AudioToolbox.framework是一套基于C语言的框架，使用它来播放音效其本质是将短音频注册到系统声音服务（System Sound Service）。System Sound Service是一种简单、底层的声音播放服务，但是它本身也存在着一些限制：
 
 音频播放时间不能超过30s
 数据必须是PCM或者IMA4格式
 音频文件必须打包成.caf、.aif、.wav中的一种（注意这是官方文档的说法，实际测试发现一些.mp3也可以播放）
 */

class ViewController: UIViewController {
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    @IBAction func playAudio(_ sender: UIButton) {
        playSoundEffect("1724.wav")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension ViewController {
   //name including extension name
    func playSoundEffect(_ name: String) {
        
        guard let audioPath = Bundle.main.path(forResource: name, ofType: nil) else {
            return
        }
        let fileUrl = URL(fileURLWithPath: audioPath)
        //1、get systemID
        var soundID: SystemSoundID = 0
        //parameter1: 音频文件url, parameter2: outSystemSoundID:声音id
        AudioServicesCreateSystemSoundID(fileUrl as CFURL, &soundID)
        AudioServicesAddSystemSoundCompletion(soundID, nil, nil, { (soundID, clientData) in
            //如果需要在播放完之后执行某些操作, 可以在这里进行回调
        }, nil)
        //2、播放音频
//        AudioServicesPlayAlertSound(soundID)
        AudioServicesPlaySystemSound(soundID)
        
    }
    
    
}

