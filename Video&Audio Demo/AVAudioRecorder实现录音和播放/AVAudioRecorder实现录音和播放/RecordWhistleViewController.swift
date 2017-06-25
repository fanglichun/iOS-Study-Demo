//
//  RecordWhistleViewController.swift
//  AVAudioRecorder实现录音和播放
//
//  Created by mfang032 on 2017/4/17.
//  Copyright © 2017年 mfang032. All rights reserved.
//

import UIKit
import AVFoundation

class RecordWhistleViewController: UIViewController {
    
    var recordingSession: AVAudioSession!
    var whistleRecorder: AVAudioRecorder!
    
    var stackView: UIStackView!
    var recordButton: UIButton!
   
    
    override func loadView() {
        super.loadView()
        view.backgroundColor = UIColor.gray
        
        stackView = UIStackView()
        stackView.spacing = 30
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = UIStackViewDistribution.fillEqually
        stackView.alignment = .center
        stackView.axis = .vertical
        view.addSubview(stackView)
        
        stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        title = "Record your whistle"
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "Record", style: .plain, target: nil, action: nil)
        recordingSession = AVAudioSession.sharedInstance()
        do {
            try recordingSession.setCategory(AVAudioSessionCategoryPlayAndRecord)
            try recordingSession.setActive(true)
            recordingSession.requestRecordPermission({ [unowned self] (allowed) in
                DispatchQueue.main.async {
                    if allowed {
                        self.loadRecordingUI()
                    } else {
                        self.loadFailUI()
                    }
                }
            })
        } catch {
            print(error)
        }
    }
    
    
    func loadRecordingUI() {
        recordButton = UIButton()
        recordButton.translatesAutoresizingMaskIntoConstraints = false
        recordButton.setTitle("Tap to Record", for: UIControlState.normal)
        recordButton.titleLabel?.font = UIFont.preferredFont(forTextStyle: UIFontTextStyle.title1)
        recordButton.addTarget(self, action: #selector(recordTapped), for: UIControlEvents.touchUpInside)
        stackView.addArrangedSubview(recordButton)
        
    }
    
    func loadFailUI() {
        let failLabel = UILabel()
        failLabel.font = UIFont.preferredFont(forTextStyle: .headline)
        failLabel.text = "Recording failed: please ensure the app has access to your microphone."
        failLabel.numberOfLines = 0
        stackView.addArrangedSubview(failLabel)//use stackView's addArrangedSubview() method, which is what triggers the layout work.
    }
    
    func recordTapped() {
        /*
         1、You need to tell iOS where to save the recording. This is done when you create the AVAudioRecorder object because iOS streams the audio to the file as it goes so it can write large files.
         2、Before recording begins, you need to decide on a format, bit rate, channel number and quality. We'll be using Apple's AAC format because it gets the most quality for the lowest bitrate. For bitrate we'll use 12,000Hz, which, when combined with the High AAC quality, sounds good in my testing. We'll specify 1 for the number of channels, because iPhones only have mono input.
         3、If you set your view controller as the delegate of a recording, you'll be told when recording stops and whether it finished successfully or not.
         4、Recording won't stop if your app goes into the background briefly. Instead, it's things like a call coming in that might make it stop unexpectedly.
         */
        
        if whistleRecorder == nil {
            startRecording()
        } else {
            finishRecording(success: true)
        }
    }
    
    func playing() {
        
    }
    
    func finishedPlaying() {
        
    }
    
    func startRecording() {
        //Make the view have a red background color so the user knows they are in recording mode.
        view.backgroundColor = UIColor(red: 0.6, green: 0, blue: 0, alpha: 1)
        //Change the title of the record button to say "Tap to Stop".
        recordButton.setTitle("Tap to Stop", for: UIControlState.normal)
        //Use the getWhistleURL() method we just wrote to find where to save the whistle.
        let audioUrl = RecordWhistleViewController.getWhistleURL()
        print(audioUrl.absoluteString)
        //Create a settings dictionary describing the format, sample rate, channels and quality.
        let settings = [AVFormatIDKey: Int(kAudioFormatMPEG4AAC),
                        AVSampleRateKey: 12000,
                        AVNumberOfChannelsKey: 1,
                        AVEncoderAudioQualityKey: AVAudioQuality.high.rawValue]
        
        //Create an AVAudioRecorder object pointing at our whistle URL, set ourselves as the delegate, then call its record() method.
        do {
            whistleRecorder = try AVAudioRecorder(url: audioUrl, settings: settings)
            whistleRecorder.delegate = self
            whistleRecorder.record()
        } catch {
            print(error)
        }
    }
    
    func finishRecording(success: Bool) {
        
        view.backgroundColor = UIColor(red: 0, green: 0.6, blue: 0, alpha: 1)
        
        whistleRecorder.stop()
        whistleRecorder = nil
        
        if success {
            recordButton.setTitle("Tap to Re-record", for: .normal)
            navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Next", style: .plain, target: self, action: #selector(nextTapped))
        } else {
            recordButton.setTitle("Tap to Record", for: .normal)
            let ac = UIAlertController(title: "Record failed", message: "There was a problem recording your whistle; please try again.", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .default))
            present(ac, animated: true)
        }
    }
    
    func nextTapped() {
        let playVC = PlayWhistleViewController()
        self.navigationController?.pushViewController(playVC, animated: true)
    }
    
    class func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentsDirectory = paths[0]
        return documentsDirectory
    }
    
    class func getWhistleURL() -> URL {
        return getDocumentsDirectory().appendingPathComponent("whistle.m4a")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension RecordWhistleViewController: AVAudioRecorderDelegate {
    
    func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder, successfully flag: Bool) {
        if !flag {
            finishRecording(success: false)
        }
    }
}

extension RecordWhistleViewController: AVAudioPlayerDelegate {
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        if !flag {
            
        }
    }
}
