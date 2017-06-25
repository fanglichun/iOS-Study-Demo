//
//  PlayWhistleViewController.swift
//  AVAudioRecorder实现录音和播放
//
//  Created by mfang032 on 2017/4/17.
//  Copyright © 2017年 mfang032. All rights reserved.
//

import UIKit
import  AVFoundation

class PlayWhistleViewController: UIViewController {
    
    var stackView: UIStackView!
    var playButton: UIButton!
    var stopButton: UIButton!
    var audioPlayer: AVAudioPlayer!
    fileprivate var playAudioRepeatedly = true

    
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
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "play", style: .plain, target: nil, action: nil)
        
        playButton = UIButton()
        playButton.translatesAutoresizingMaskIntoConstraints = false
        playButton.setTitle("Tap to play", for: UIControlState.normal)
        playButton.titleLabel?.font = UIFont.preferredFont(forTextStyle: UIFontTextStyle.title1)
        playButton.addTarget(self, action: #selector(playAudio), for: UIControlEvents.touchUpInside)
        stackView.addArrangedSubview(playButton)
        
        stopButton = UIButton()
        stopButton.translatesAutoresizingMaskIntoConstraints = false
        stopButton.setTitle("Tap to stop", for: UIControlState.normal)
        stopButton.titleLabel?.font = UIFont.preferredFont(forTextStyle: UIFontTextStyle.title1)
        stopButton.addTarget(self, action: #selector(stopAudio), for: UIControlEvents.touchUpInside)
        stackView.addArrangedSubview(stopButton)
    }
    
    func playAudio() {
        //Get URL of the sound using NSURL and store it to soundURL.
        let soundUrl = RecordWhistleViewController.getWhistleURL()
        do {
            //Create object of AVAudioPlayer and assign it to audioPlayer.
            audioPlayer = try AVAudioPlayer(contentsOf: soundUrl)
            audioPlayer.delegate = self
            
            //If audioPlayer is prepared to play, then it will play audio using audioPlayer!.play() method.
            if audioPlayer.prepareToPlay() {
                audioPlayer.play()
            }
        } catch {
            print(error)
        }
    }
    
    func stopAudio() {
        audioPlayer.stop()
        playButton.isEnabled = false
        playAudioRepeatedly = false
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

extension PlayWhistleViewController: AVAudioPlayerDelegate {
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        if playAudioRepeatedly {
            player.play()
        }
    }
}
