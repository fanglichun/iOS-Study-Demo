//
//  PlayerView.swift
//  AVFoundation基本使用-播放视频
//
//  Created by mfang032 on 2017/6/8.
//  Copyright © 2017年 mfang032. All rights reserved.
//

import UIKit
import AVFoundation

class PlayerView: UIView {

    var player: AVPlayer? {
        get {
            return playerLayer.player
        }
        set {
            playerLayer.player = newValue
        }
    }
    
    var playerLayer: AVPlayerLayer {
        return layer as! AVPlayerLayer
    }
    
    override class var layerClass: AnyClass {
        return AVPlayerLayer.self
    }
    
}
