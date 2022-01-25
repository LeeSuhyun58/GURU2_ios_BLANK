//
//  EmotionView.swift
//  GURUiosproject_BLANK
//
//  Created by Jake on 2022/01/24.
//

import UIKit

class EmotionView:UIViewController {
    var date: String!
    
    @IBOutlet weak var myLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //달력에서 클릭한 날짜를 가져옴
        self.myLabel.text = date
    }
}
