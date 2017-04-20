//
//  ViewController.swift
//  MPMusicPlayerController播放音乐
//
//  Created by mfang032 on 2017/4/19.
//  Copyright © 2017年 mfang032. All rights reserved.
//

import UIKit
import MediaPlayer

class ViewController: UIViewController {
    
    lazy var musicPlayer: MPMusicPlayerController = {
        let musicPlayController = MPMusicPlayerController.systemMusicPlayer()//应用停止后不会退出播放状态。applicationMusicPlayer在应用退出后音乐播放会自动停止
        musicPlayController.beginGeneratingPlaybackNotifications()//开启通知
        self.addNotification()
        //如果不使用MPMediaPickerController可以使用如下方法获得音乐库媒体队列
//        let mediaItemCollection = self.getLocalMediaItemCollection()
//        musicPlayController.setQueue(with: mediaItemCollection)
        return musicPlayController
    }()
    
    lazy var mediaPicker: MPMediaPickerController = {
       let mediaPicker = MPMediaPickerController(mediaTypes: MPMediaType.any)
        mediaPicker.allowsPickingMultipleItems = true
        mediaPicker.prompt = "请选择要播放的音乐"
        mediaPicker.showsCloudItems = true
        mediaPicker.delegate = self
        return mediaPicker
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    deinit {
        musicPlayer.endGeneratingPlaybackNotifications()
    }
    
    @IBAction func selectAction(_ sender: UIButton) {
        //must add a key named "NSAppleMusicUsageDescription" to info,plist then can prensent to the mediapicker
        present(mediaPicker, animated: true, completion: nil)
    }
    
    @IBAction func play(_ sender: UIButton) {
        musicPlayer.play()
    }
    
    @IBAction func pause(_ sender: UIButton) {
        musicPlayer.pause()
    }
    
    @IBAction func stop(_ sender: UIButton) {
        musicPlayer.stop()
    }
    
    @IBAction func next(_ sender: UIButton) {
        musicPlayer.skipToNextItem()
    }
    
    @IBAction func previous(_ sender: UIButton) {
        musicPlayer.skipToPreviousItem()
    }

}

extension ViewController: MPMediaPickerControllerDelegate {
    
    
    //MARK: 选择完成
    func mediaPicker(_ mediaPicker: MPMediaPickerController, didPickMediaItems mediaItemCollection: MPMediaItemCollection) {
        if let mediaItem = mediaItemCollection.items.first {
            if let title = mediaItem.title, let albumArtist = mediaItem.albumArtist, let artist = mediaItem.artist, let albumTitle = mediaItem.albumTitle {
                print("标题:\(title),专辑艺术家:\(albumArtist) 艺术家:\(artist), 专辑:\(albumTitle)")
            }
            
        }
        
        musicPlayer.setQueue(with: mediaItemCollection)
        dismiss(animated: true, completion: nil)
    }
    //MARK： 选择取消
    func mediaPickerDidCancel(_ mediaPicker: MPMediaPickerController) {
        dismiss(animated: true, completion: nil)
    }
}

extension ViewController {
    
    func playbackStateChange(_ notification: Notification) {
        
        switch musicPlayer.playbackState {
        case .playing:
            print("正在播放")
        case .paused:
            print("播放暂停")
        case .interrupted:
            print("播放被打断")
        case .stopped:
            print("播放停止")
        case .seekingBackward:
            print("播放后退")
        case .seekingForward:
            print("播放前进")
        }
    }
    
    //MARK: add notification
    func addNotification() {
        NotificationCenter.default.addObserver(self, selector: #selector(playbackStateChange(_:)), name: NSNotification.Name.MPMusicPlayerControllerPlaybackStateDidChange, object: musicPlayer)
    }
    
    //MARK: get local media queue - songs
    func getLocalMediaQueue() ->MPMediaQuery {
        let mediaQueue = MPMediaQuery.songs()
        return mediaQueue
    }
    
    //MARK: get local media collections
    func getLocalMediaItemCollection() ->MPMediaItemCollection {
        let mediaQueue = MPMediaQuery.songs()
        var mediaItems: [MPMediaItem] = []
        if let items = mediaQueue.items {
            for item in items {
                mediaItems.append(item)
            }
        }
        let mediaItemCollection = MPMediaItemCollection(items: mediaItems)
        return mediaItemCollection
    }
}

