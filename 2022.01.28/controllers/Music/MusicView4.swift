//
//  MusicView4.swift
//  GURUiosproject_BLANK
//
//  Created by Jake on 2022/01/28.
//

import UIKit
import YouTubePlayer

class MusicView4:UIViewController {
    
    @IBOutlet weak var MusicPlay4: YouTubePlayerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let musicVideoURL4 = NSURL(string: "https://www.youtube.com/watch?v=iQWBGD0YP5A")
        if MusicPlay4 != nil {
            MusicPlay4.loadVideoURL(musicVideoURL4! as URL)
        }
    }
    
}
