//
//  PlayerView.swift
//  HLS播放视频
//
//  Created by mfang032 on 2017/6/10.
//  Copyright © 2017年 mfang032. All rights reserved.
//

import UIKit
import AVFoundation

class PlayerView: UIView {
    
    static override var layerClass: AnyClass {
        return AVPlayerLayer.self
    }
    
    var player : AVPlayer? {
        set {
            let playerLayer = layer as? AVPlayerLayer
            playerLayer?.player = newValue
        }
        
        get {
            let playerLayer = layer as! AVPlayerLayer
            return playerLayer.player
        }
    }
}
