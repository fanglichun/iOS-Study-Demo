//
//  PlayerViewController.swift
//  AVFoundation基本使用-播放视频
//
//  Created by mfang032 on 2017/6/8.
//  Copyright © 2017年 mfang032. All rights reserved.
//

import UIKit
import AVFoundation
import AVKit

class PlayerViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var timeSlider: UISlider!
    @IBOutlet weak var startTimeLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var rewindButton: UIButton!
    @IBOutlet weak var playPauseButton: UIButton!
    @IBOutlet weak var fastForwardButton: UIButton!
    @IBOutlet weak var pictureInPictureButton: UIButton!
    @IBOutlet weak var playerView: PlayerView!
    @IBOutlet fileprivate weak var leftContainerView: UIView!
    @IBOutlet fileprivate weak var rightContainerView: UIView!
    
    //MARK: define some attributes
    static let assetKeysRequiredToPlay = [
        "playable",
        "hasProtectedContent"
    ]
    
    fileprivate var timeObserverToken: Any?
    fileprivate var playerViewControllerKVOContext = 0
    
    let player = AVPlayer()
    var pictureInPictureController: AVPictureInPictureController?
    
    //MARK: palyerLayer
    var playerLayer: AVPlayerLayer? {
        return playerView.playerLayer
    }
    
    var playerItem: AVPlayerItem? {
        didSet {
            player.replaceCurrentItem(with: playerItem)
            if playerItem == nil {
                cleanUpPlayerPeriodicTimeObserver()
            } else {
                setupPlayerPeriodicTimeObserver()
            }
        }
    }
    
    var currentTime: Double {
        get {
            return CMTimeGetSeconds(player.currentTime())
        }
        set {
            let newTime = CMTimeMakeWithSeconds(newValue, 1)
            player.seek(to: newTime, toleranceBefore: kCMTimeZero, toleranceAfter: kCMTimeZero)
        }
    }
    
    var duration: Double {
        guard let currentItem = player.currentItem else {
            return 0.0
        }
        return CMTimeGetSeconds(currentItem.duration)
    }
    
    var rate: Float {
        get {
            return player.rate
        }
        set {
            player.rate = newValue
        }
    }
    
    var asset: AVURLAsset? {
        didSet {
            guard let asset = asset else {
                return
            }
            asynchronouslyLoadURLAsset(asset)
            
        }
    }
    
    let timeRemainingFormatter: DateComponentsFormatter = {
        let formatter = DateComponentsFormatter()
        formatter.zeroFormattingBehavior = .pad
        formatter.allowedUnits = [.minute, .second]
        
        return formatter
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //add observer
        addObserver(self, forKeyPath: #keyPath(PlayerViewController.player.currentItem.duration), options: [.initial, .new], context: &playerViewControllerKVOContext)
        addObserver(self, forKeyPath: #keyPath(PlayerViewController.player.rate), options: [.initial, .new], context: &playerViewControllerKVOContext)
        addObserver(self, forKeyPath: #keyPath(PlayerViewController.player.currentItem.status), options: [.initial, .new], context: &playerViewControllerKVOContext)
        
        playerView.playerLayer.player = player
        setupPlayback()
        
        pictureInPictureButton.setImage(AVPictureInPictureController.pictureInPictureButtonStartImage(compatibleWith: nil), for: UIControlState.normal)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)

        cleanUpPlayerPeriodicTimeObserver()
        player.pause()
        
        removeObserver(self, forKeyPath: #keyPath(PlayerViewController.player.currentItem.duration), context: &playerViewControllerKVOContext)
        removeObserver(self, forKeyPath: #keyPath(PlayerViewController.player.currentItem.status), context: &playerViewControllerKVOContext)
        removeObserver(self, forKeyPath: #keyPath(PlayerViewController.player.rate), context: &playerViewControllerKVOContext)
    }
    
    //MARK: KVO Observation
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        guard context == &playerViewControllerKVOContext else {
            super.observeValue(forKeyPath: keyPath, of: object, change: change, context: context)
            return
        }
        guard let keyPath = keyPath else {
            return
        }
        repond(keyPath, change?[NSKeyValueChangeKey.newKey])
    }
    
    // Trigger KVO for anyone observing our properties affected by player and player.currentItem
    override class func keyPathsForValuesAffectingValue(forKey key: String) -> Set<String> {
        let affectedKeyPathsMappingByKey: [String: Set<String>] = [
            "duration":     [#keyPath(PlayerViewController.player.currentItem.duration)],
            "rate":         [#keyPath(PlayerViewController.player.rate)]
        ]
        
        return affectedKeyPathsMappingByKey[key] ?? super.keyPathsForValuesAffectingValue(forKey: key)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

extension PlayerViewController: AVPictureInPictureControllerDelegate {
    
    func pictureInPictureControllerDidStartPictureInPicture(_ pictureInPictureController: AVPictureInPictureController) {
        leftContainerView.isHidden = true
        rightContainerView.isHidden = true
    }
    
    func pictureInPictureControllerDidStopPictureInPicture(_ pictureInPictureController: AVPictureInPictureController) {
        leftContainerView.isHidden = false
        rightContainerView.isHidden = false
    }
    
    func picture(_ pictureInPictureController: AVPictureInPictureController, failedToStartPictureInPictureWithError error: Error) {
        leftContainerView.isHidden = false
        rightContainerView.isHidden = false
        handleErrorWithMessage(error.localizedDescription)
    }
    
}

//MARK: Action Event
private extension PlayerViewController {
    
    @IBAction func playPauseButtonPressed(_ sender: UIButton) {
        if player.rate != 1.0 {
            player.play()
            if currentTime == duration {
                currentTime = 0.0
            }
        } else {
            player.pause()
        }
    }
    
    @IBAction func backButtonPressed(_ sender: UIButton) {
        rate = max(player.rate - 2.0, -2.0)
    }
    
    @IBAction func forwardButtonPressed(_ sender: UIButton) {
        rate = max(player.rate + 2.0, 2.0)
    }
    
    @IBAction func timeSliderChanged(_ sender: UISlider) {
        currentTime = Double(sender.value)
    }
    
    @IBAction func togglePictureInPictureMode(_ sender: UIButton) {
        guard let pictureInPictureController = pictureInPictureController else  {
            return
        }
        if pictureInPictureController.isPictureInPictureActive {
            pictureInPictureController.stopPictureInPicture()
        } else {
            pictureInPictureController.startPictureInPicture()
        }
    }
    
}

//MARK: some private customized function
private extension PlayerViewController {
    
    func setupPictureInPicturePlayback() {
        if AVPictureInPictureController.isPictureInPictureSupported() {
            pictureInPictureController = AVPictureInPictureController(playerLayer: playerView.playerLayer)
            pictureInPictureController?.delegate = self
            addObserver(self, forKeyPath: #keyPath(PlayerViewController.pictureInPictureController.isPictureInPicturePossible), options: [.new, .initial], context: &playerViewControllerKVOContext)
        } else {
            pictureInPictureButton.isEnabled = false
        }
    }
    
    func setupPlayerPeriodicTimeObserver() {
        guard timeObserverToken == nil else {
            return
        }
        
        let interval = CMTimeMake(1, 1)
        timeObserverToken = player.addPeriodicTimeObserver(forInterval: interval, queue: DispatchQueue.main, using: { [unowned self] (time) in
            let timeElapsed = Float(CMTimeGetSeconds(time))
            self.timeSlider.value = timeElapsed
            self.startTimeLabel.text = self.createTimeString(timeElapsed)
        })
    }
    
    func cleanUpPlayerPeriodicTimeObserver() {
        if let timeObserverToken = timeObserverToken {
            player.removeTimeObserver(timeObserverToken)
            self.timeObserverToken = nil
        }
    }
    
    func setupPlayback() {
        
        if let movieUrl =  Bundle.main.url(forResource: "ElephantSeals", withExtension: "mov") {
            asset = AVURLAsset(url: movieUrl, options: nil)
        }
    }
    
    func repond(_ keyPath: String, _ value: Any?) {
        switch keyPath {
        case #keyPath(PlayerViewController.player.currentItem.duration):
            let newDuration: CMTime
            if let newValue = value as? NSValue {
                newDuration = newValue.timeValue
            } else {
                newDuration = kCMTimeZero
            }
            let isValidDuration = newDuration.isNumeric && newDuration.value != 0
            let newDurationSeconds = isValidDuration ? CMTimeGetSeconds(newDuration) : 0.0
            let currentTime = isValidDuration ? Float(CMTimeGetSeconds(player.currentTime())) : 0.0
            timeSlider.maximumValue = Float(newDurationSeconds)
            timeSlider.value = currentTime
            playPauseButton.isEnabled = isValidDuration
            rewindButton.isEnabled = isValidDuration
            fastForwardButton.isEnabled = isValidDuration
            timeSlider.isEnabled = isValidDuration
            startTimeLabel.isEnabled = isValidDuration
            durationLabel.isEnabled = isValidDuration
            startTimeLabel.text = createTimeString(currentTime)
            durationLabel.text = createTimeString(Float(newDurationSeconds))
        case #keyPath(PlayerViewController.player.rate):
            if let newRateNumber = value as? NSNumber  {
                let newRate = newRateNumber.doubleValue
                let buttonImageName = newRate == 1 ? "PauseButton" : "PlayButton"
                let buttonImage = UIImage(named: buttonImageName)
                playPauseButton.setImage(buttonImage, for: UIControlState())
            }
        case #keyPath(PlayerViewController.player.currentItem.status):
            let newStatus:AVPlayerItemStatus
            if let newStatusAsNumber = value as? NSNumber {
                newStatus = AVPlayerItemStatus(rawValue: newStatusAsNumber.intValue)!
            } else {
                newStatus = .unknown
            }
            if newStatus == .failed {
                handleErrorWithMessage(player.currentItem?.error?.localizedDescription, error: player.currentItem?.error)
            } else if newStatus == .readyToPlay {
                if pictureInPictureController == nil {
                    setupPictureInPicturePlayback()
                }
            }
        case #keyPath(PlayerViewController.pictureInPictureController.isPictureInPicturePossible):
            if let newValue = value as? NSNumber {
                let isPictureInPicturePossible = newValue.boolValue
                pictureInPictureButton.isEnabled = isPictureInPicturePossible
            }
        default:
            break
        }
    }
    
    func asynchronouslyLoadURLAsset(_ newAsset: AVURLAsset) {
        newAsset.loadValuesAsynchronously(forKeys: PlayerViewController.assetKeysRequiredToPlay) {
            DispatchQueue.main.async {
                guard newAsset == self.asset else { return }
                
                for key in PlayerViewController.assetKeysRequiredToPlay {
                    var error: NSError?
                    if newAsset.statusOfValue(forKey: key, error: &error) == .failed {
                        let stringFormat = NSLocalizedString("error.asset_key_%@_failed.description",
                                                             comment: "Can't use this AVAsset because one of it's keys failed to load")
                        
                        let message = String.localizedStringWithFormat(stringFormat, key)
                        self.handleErrorWithMessage(message)
                        return
                    }
                }
                if !newAsset.isPlayable || newAsset.hasProtectedContent {
                    let message = NSLocalizedString("error.asset_not_playable.description",
                                                    comment: "Can't use this AVAsset because it isn't playable or has protected content")
                    self.handleErrorWithMessage(message)
                    return
                }
                self.playerItem = AVPlayerItem(asset: newAsset)
            }
        }
    }
    
    func handleErrorWithMessage(_ message: String?, error: Error? = nil) {
        NSLog("Error occured with message: \(String(describing: message)), error: \(String(describing: error)).")
        
        let alertTitle = NSLocalizedString("alert.error.title", comment: "Alert title for errors")
        let defaultAlertMessage = NSLocalizedString("error.default.description", comment: "Default error message when no NSError provided")
        
        let alert = UIAlertController(title: alertTitle, message: message == nil ? defaultAlertMessage : message, preferredStyle: UIAlertControllerStyle.alert)
        
        let alertActionTitle = NSLocalizedString("alert.error.actions.OK", comment: "OK on error alert")
        
        let alertAction = UIAlertAction(title: alertActionTitle, style: .default, handler: nil)
        
        alert.addAction(alertAction)
        
        present(alert, animated: true, completion: nil)
    }
    
    func createTimeString(_ time: Float) ->String {
        let components = NSDateComponents()
        components.second = Int(max(0.0, time))
        return timeRemainingFormatter.string(from: components as DateComponents)!
    }
}
