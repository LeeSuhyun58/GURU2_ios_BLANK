//
//  MusicView.swift
//  GURUiosproject_BLANK
//
//  Created by Jake on 2022/01/27.
//

import UIKit
import YouTubePlayer

class MusicView: UIViewController{
    
    @IBOutlet weak var videoPlayer: YouTubePlayerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let musicVideoURL = NSURL(string: "https://youtu.be/4iFP_wd6QU8")
        if videoPlayer != nil {
            videoPlayer.loadVideoURL(musicVideoURL! as URL)
        }
        
        /*Play0.tag = 0
        Play0.addTarget(self, action: #selector(PlayYouTube), for: .touchUpInside)
        
        Play1.tag = 1
        Play1.addTarget(self, action: #selector(PlayYouTube1), for: .touchUpInside)*/
    }
    
    //@objc func PlayYouTube() { }
}
