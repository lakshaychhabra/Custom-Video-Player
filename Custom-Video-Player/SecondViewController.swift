//
//  SecondViewController.swift
//  Custom-Video-Player
//
//  Created by Lakshay Chhabra on 22/04/18.
//  Copyright © 2018 Lakshay Chhabra. All rights reserved.
//

import UIKit
import AVFoundation

class SecondViewController: UIViewController {

    @IBOutlet var backwardLabel: UIButton!
    @IBOutlet var stopButtonLabel: UIButton!
    @IBOutlet var playButtonLabel: UIButton!
    @IBOutlet var forwardLabel: UIButton!
    @IBOutlet var volumeLabel: UIButton!
    @IBOutlet var videoVie: UIView!
    @IBOutlet var buttonLabel: UIButton!
    
    @IBOutlet var repCounterLabel: UILabel!
    let path2 = Bundle.main.path(forResource: "vid2", ofType: "mp4")
    var player : AVPlayer!
    var playerLayer : AVPlayerLayer!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        hideButtons()
        player = AVPlayer(url: URL(fileURLWithPath: path2!))
        playerLayer = AVPlayerLayer(player: player)
        videoVie.layer.addSublayer(playerLayer)
        button(self)


        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        player.play()
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        playerLayer.frame = videoVie.bounds
    }
    //Control The volume i.e Mute and UnMute
    @IBAction func volumeButton(_ sender: Any) {
        if(isvolumeplay){
            volumeLabel.setImage(UIImage(named: "2.png"), for: UIControlState.normal)
            player?.volume = 0
            
            isvolumeplay = false
        }
        else{
            volumeLabel.setImage(UIImage(named: "vol.png"), for: UIControlState.normal)
            player?.volume = 1
            isvolumeplay = true
         
        }
        
    }
   
    //Screen Pause Button
    @IBAction func screenButton(_ sender: Any) {
        
        player.pause()
        
        viewButtons()
        
    }
    //Hide Labels
    func hideButtons(){
        forwardLabel.isHidden = true
        backwardLabel.isHidden = true
        stopButtonLabel.isHidden = true
        playButtonLabel.isHidden = true
        
    }
    //view labels
    func viewButtons(){
        forwardLabel.isHidden = false
        backwardLabel.isHidden = false
        stopButtonLabel.isHidden = false
        playButtonLabel.isHidden = false
        
    }
    //When the play button is pressed
    @IBAction func playButtonPressed(_ sender: Any) {
        player.play()
        hideButtons()
        
    }
    @IBAction func backwardButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "toScreen1", sender: self)
    }
    
    @IBAction func forwardButtonPressed(_ sender: Any) {
        
        let alert = UIAlertController(title: "You Want to Skip This Video", message: "Your workout will not be complete", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: {
            action in
            self.performSegue(withIdentifier: "toScreen3", sender: self)
        }))
        alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
        
        
    }
    
    @IBAction func stopButtonPressed(_ sender: Any) {
        displayAlert(title: "Wanna End Session?", message: "Select Yes To end the session or No to cancel")
        
    }
    // Used to display Pop up Alerts
    func displayAlert(title: String, message: String) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: {
            action in
            self.performSegue(withIdentifier: "toScreen5From2", sender: nil)
        }))
        alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
        
    }
    @IBAction func button(_ sender: Any) {
        
        buttonLabel.frame.size =  CGSize(width: 1, height: 1)
        view.addSubview(buttonLabel)
        
    }
  

}
