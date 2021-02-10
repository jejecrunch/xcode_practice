//
//  ViewController.swift
//  MoviePlayer
//
//  Created by 유저 on 2021. 2. 10..
//  Copyright © 2021년 net.macnpc. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func btnPlayInternalMovie(_ sender: UIButton) {
        let filePath:String? = Bundle.main.path(forResource: "FastTyping", ofType: ".mp4")
        let url = NSURL(fileURLWithPath: filePath!)
        
        playVideo(url: url)
    }
    
    @IBAction func btnMovPlayIn(_ sender: UIButton) {
        let filePath:String? = Bundle.main.path(forResource: "Mountaineering", ofType: ".mov")
        let url = NSURL(fileURLWithPath: filePath!)
        
        playVideo(url: url)
    }
    
    @IBAction func btnPlayExternalMovie(_ sender: UIButton) {
        let url = NSURL(string: "https://dl.dropboxusercontent.com/s/e38auz050w2mvud/Fireworks.mp4")
        
        playVideo(url: url!)
        
    }
    
    @IBAction func btnMovPlayEx(_ sender: UIButton) {
        let url = NSURL(string: "https://dl.dropboxusercontent.com/s/ijybpprsmx0bgre/Seascape.mov")
        
        playVideo(url: url!)
    }
    
    private func playVideo(url: NSURL) {
        let player = AVPlayer(url: url as URL)
        let playerController = AVPlayerViewController()
        
        playerController.player = player
        self.present(playerController, animated: true) {
            player.play()
        }
    }
}

