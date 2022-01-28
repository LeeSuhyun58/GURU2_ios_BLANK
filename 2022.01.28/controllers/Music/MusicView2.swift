//
//  MusicView2.swift
//  GURUiosproject_BLANK
//
//  Created by Jake on 2022/01/28.
//

import UIKit
import YouTubePlayer

class MusicView2:UIViewController {
    
    @IBOutlet weak var MusicPlay2: YouTubePlayerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let musicVideoURL2 = NSURL(string: "https://youtu.be/_ItqdBB26fQ")
        if MusicPlay2 != nil {
            MusicPlay2.loadVideoURL(musicVideoURL2! as URL)
        }
    }
}
