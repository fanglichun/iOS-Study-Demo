//
//  ViewController.swift
//  MPMoviePlayerController播放视频
//
//  Created by mfang032 on 2017/4/20.
//  Copyright © 2017年 mfang032. All rights reserved.
//

import UIKit
import MediaPlayer
import AVKit

class ViewController: UIViewController {
    
    lazy var moviePlayer: MPMoviePlayerController? = {
        
        guard let url = self.getNetworkUrl("http://www.tudou.com/listplay/pjkZ79uYk90/gRS-hC1Ggc8.html") else {
            return nil
        }
        let moviePlayer = MPMoviePlayerController(contentURL: url)
        self.view.addSubview((moviePlayer?.view)!)
        return moviePlayer
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        moviePlayer?.play()
        addNotification()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.MPMoviePlayerPlaybackStateDidChange, object: moviePlayer)
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.MPMoviePlayerPlaybackStateDidChange, object: moviePlayer)

    }
}

extension ViewController {
    
    func getFileUrl() ->URL? {
        
        guard let urlStr = Bundle.main.path(forResource: "", ofType: nil) else {
            return nil
        }
        
        let url = URL.init(fileURLWithPath: urlStr)
        return url
    }
    
    func getNetworkUrl(_ urlStr: String) -> URL? {
        
        guard let urlwithPercentEscapes = urlStr.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed) else {
            return nil
        }
        let url = URL(string: urlwithPercentEscapes)
        return url
    }
    
    /*
     添加通知监控媒体播放控制器状态
     */
    
    func addNotification() {
        
        let defaultCenter = NotificationCenter.default
        defaultCenter.addObserver(self, selector: #selector(mediaPlayerPlaybackStateChange(_:)), name: NSNotification.Name.MPMoviePlayerPlaybackStateDidChange, object: self.moviePlayer)
        defaultCenter.addObserver(self, selector: #selector(mediaPlayerPlaybackFinished(_:)), name: NSNotification.Name.MPMoviePlayerPlaybackStateDidChange, object: self.moviePlayer)
    }
    
    //播放状态改变，注意播放完成时的状态是暂停
    func mediaPlayerPlaybackStateChange(_ notification: Notification) {
        guard let playbackState = moviePlayer?.playbackState else {
            return
        }
        switch playbackState {
        case MPMoviePlaybackState.playing:
            print("正在播放")
            break
        case MPMoviePlaybackState.paused:
            print("播放暂停")
        case MPMoviePlaybackState.stopped:
            print("播放停止")
        default:
            print("播放状态:\(String(describing: playbackState.rawValue))")
        }
    }
    
    //播放完成
    func mediaPlayerPlaybackFinished(_ notification: Notification) {
        
    }
    
    func thumbnailImageRequest() {
        //获取13.0s、21.5s的缩略图
        self.moviePlayer?.requestThumbnailImages(atTimes: [13.0 , 21.5], timeOption: MPMovieTimeOption.nearestKeyFrame)
    }
    
    func thumbnailImageRequest(_ seconds: Double) {
        /*
         
         //创建URL
         NSURL *url=[self getNetworkUrl];
         //根据url创建AVURLAsset
         AVURLAsset *urlAsset=[AVURLAsset assetWithURL:url];
         //根据AVURLAsset创建AVAssetImageGenerator
         AVAssetImageGenerator *imageGenerator=[AVAssetImageGenerator assetImageGeneratorWithAsset:urlAsset];
         /*截图
         * requestTime:缩略图创建时间
         * actualTime:缩略图实际生成的时间
         */
         NSError *error=nil;
         CMTime time=CMTimeMakeWithSeconds(timeBySecond, 10);//CMTime是表示电影时间信息的结构体，第一个参数表示是视频第几秒，第二个参数表示每秒帧数.(如果要活的某一秒的第几帧可以使用CMTimeMake方法)
         CMTime actualTime;
         CGImageRef cgImage= [imageGenerator copyCGImageAtTime:time actualTime:&actualTime error:&error];
         if(error){
         NSLog(@"截取视频缩略图时发生错误，错误信息：%@",error.localizedDescription);
         return;
         }
         CMTimeShow(actualTime);
         UIImage *image=[UIImage imageWithCGImage:cgImage];//转化为UIImage
         //保存到相册
         UIImageWriteToSavedPhotosAlbum(image,nil, nil, nil);
         CGImageRelease(cgImage);
         */
    }
    
    
    
}

