//
//  ViewController.swift
//  Custom-Video-Player
//
//  Created by Lakshay Chhabra on 22/04/18.
//  Copyright © 2018 Lakshay Chhabra. All rights reserved.
//

import UIKit
import AVFoundation


class ViewController: UIViewController {

    @IBOutlet var videoVie: UIView!
    static var isvolumeplay : Bool = true
    var player : AVPlayer!
    var playerLayer : AVPlayerLayer!
    var musicPlayer = AVAudioPlayer()
    let path = Bundle.main.path(forResource: "vid", ofType: "mp4")
    let path2 = Bundle.main.path(forResource: "vid2", ofType: "mp4")
  
    @IBOutlet var buttonLabel: UIButton!
    var pathArray : [String] = []
    
    
   
    let audioPath = Bundle.main.path(forResource: "music", ofType: "mp3")
    
    @IBOutlet var backwardLabel: UIButton!
    
    @IBOutlet var stopButtonLabel: UIButton!
    @IBOutlet var playButtonLabel: UIButton!
    @IBOutlet var forwardLabel: UIButton!
    
    @IBOutlet var volumeLabel: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        hideButtons()
        
        pathArray.append(path!)
        pathArray.append(path2!)
        
         player = AVPlayer(url: URL(fileURLWithPath: pathArray[0]))
        playerLayer = AVPlayerLayer(player: player)
      
        
    
        
      //BAckground Music
        do {
            try musicPlayer = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath!)) }
        catch{
            
        }
        musicPlayer.play()
        
        
        videoVie.layer.addSublayer(playerLayer)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        player.play()
    }
    
    @IBAction func skipIntroButton(_ sender: Any) {
        player.pause()
        player.replaceCurrentItem(with: nil)
        performSegue(withIdentifier: "toScreen2", sender: self)
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        playerLayer.frame = videoVie.bounds
    }

    @IBAction func volumeButton(_ sender: Any) {
        if(ViewController.isvolumeplay){
        volumeLabel.setImage(UIImage(named: "2.png"), for: UIControlState.normal)
            player?.volume = 0
            stop()
            ViewController.isvolumeplay = false
        }
        else{
            volumeLabel.setImage(UIImage(named: "vol.png"), for: UIControlState.normal)
            player?.volume = 1
            ViewController.isvolumeplay = true
            musicPlayer.play()
        }
        
    }
    //func to stop background Music
   func stop() {
        musicPlayer.pause()
     
        do {
            //reinitialising the song
            try musicPlayer = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath!))   }
        catch{
            
        }
        
    }
    @IBAction func screenButton(_ sender: Any) {
        
        player.pause()
        stop()
        viewButtons()
        
    }
    func hideButtons(){
        forwardLabel.isHidden = true
        backwardLabel.isHidden = true
        stopButtonLabel.isHidden = true
        playButtonLabel.isHidden = true
        
    }
    func viewButtons(){
        forwardLabel.isHidden = false
        backwardLabel.isHidden = false
        stopButtonLabel.isHidden = false
        playButtonLabel.isHidden = false
        
    }
    
    @IBAction func playButtonPressed(_ sender: Any) {
        player.play()
        musicPlayer.play()
        hideButtons()
        
    }

    @IBAction func stopButtonPressed(_ sender: Any) {
        displayAlert(title: "Wanna End Session?", message: "Select Yes To end the seesion or No to cancel")
        musicPlayer.stop()
        player.pause()
        
    }
    
    @IBAction func forwardButtonPressed(_ sender: Any) {
     
        let alert = UIAlertController(title: "You Want to Skip This Video", message: "Your workout will not be complete", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: {
            action in
            self.player.replaceCurrentItem(with: nil)
            self.player = AVPlayer(url: URL(fileURLWithPath: self.pathArray[1]))
            self.playerLayer = AVPlayerLayer(player: self.player)
            self.videoVie.layer.addSublayer(self.playerLayer)
            self.player.play()
            self.button(self)
            self.hideButtons()
        }))
        alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
       
        
    }
    @IBAction func backwardButtonPressed(_ sender: Any) {
    }
    
    func displayAlert(title: String, message: String) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: {
            action in
            self.performSegue(withIdentifier: "toScreen5", sender: self)
        }))
        alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    
    }
    
    @IBAction func button(_ sender: Any) {
     
        buttonLabel.frame.size =  CGSize(width: 1, height: 1)
        view.addSubview(buttonLabel)
       
    }
    
    
    
}

