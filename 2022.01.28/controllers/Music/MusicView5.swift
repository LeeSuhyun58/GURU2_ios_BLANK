//
//  MusicView5.swift
//  GURUiosproject_BLANK
//
//  Created by Jake on 2022/01/28.
//

import UIKit
import YouTubePlayer

class MusicView5:UIViewController {
    @IBOutlet weak var MusicPlay5: YouTubePlayerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let musicVideoURL5 = NSURL(string: "https://youtu.be/dboaFYdUxFs")
        if MusicPlay5 != nil {
            MusicPlay5.loadVideoURL(musicVideoURL5! as URL)
        }
    }
}
