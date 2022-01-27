//
//  MusicView1.swift
//  GURUiosproject_BLANK
//
//  Created by Jake on 2022/01/27.
//

import UIKit
import YouTubePlayer

class MusicView1:UIViewController{
    
    @IBOutlet weak var MusicPlay: YouTubePlayerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let musicVideoURL1 = NSURL(string: "https://youtu.be/v3SaQZypZ_U")
        if MusicPlay != nil {
            MusicPlay.loadVideoURL(musicVideoURL1! as URL)
        } else {
            print("nil")
        }
    }
}
