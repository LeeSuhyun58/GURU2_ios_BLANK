//
//  MusicView3.swift
//  GURUiosproject_BLANK
//
//  Created by Jake on 2022/01/28.
//

import UIKit
import YouTubePlayer

class MusicView3:UIViewController {
    
    @IBOutlet weak var MusicPlay3: YouTubePlayerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let musicVideoURL3 = NSURL(string: "https://youtu.be/1HCMC9eKzG0")
        if MusicPlay3 != nil {
            MusicPlay3.loadVideoURL(musicVideoURL3! as URL)
        }
    }
}
