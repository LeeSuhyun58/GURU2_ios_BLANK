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
    
    //이미지에 버튼을 주기위한 사전 작업 -> outlet연결
    @IBOutlet weak var Emotion0: UIImageView!
    @IBOutlet weak var Emotion1: UIImageView!
    @IBOutlet weak var Emotion2: UIImageView!
    @IBOutlet weak var Emotion3: UIImageView!
    @IBOutlet weak var Emotion4: UIImageView!
    @IBOutlet weak var Emotion5: UIImageView!
    @IBOutlet weak var Emotion6: UIImageView!
    @IBOutlet weak var Emotion7: UIImageView!
    @IBOutlet weak var Emotion8: UIImageView!
    
    //북마크 기능 구현을 위한 변수 설정 -> 비활성화
    var isChecked: Bool = false
    var isChecked1: Bool = false
    var isChecked2: Bool = false
    var isChecked3: Bool = false
    var isChecked4: Bool = false
    var isChecked5: Bool = false
    var isChecked6: Bool = false
    var isChecked7: Bool = false
    var isChecked8: Bool = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //달력에서 클릭한 날짜를 가져옴
        self.myLabel.text = date
        
        Emotion0.tag = 0
        Emotion0.isUserInteractionEnabled = true
        Emotion0.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(ImageViewClick)))
        
        Emotion1.tag = 1
        Emotion1.isUserInteractionEnabled = true
        Emotion1.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(ImageViewClick)))
        
        Emotion2.tag = 2
        Emotion2.isUserInteractionEnabled = true
        Emotion2.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(ImageViewClick)))
        
        Emotion3.tag = 3
        Emotion3.isUserInteractionEnabled = true
        Emotion3.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(ImageViewClick)))
        
        Emotion4.tag = 4
        Emotion4.isUserInteractionEnabled = true
        Emotion4.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(ImageViewClick)))
        
        Emotion5.tag = 5
        Emotion5.isUserInteractionEnabled = true
        Emotion5.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(ImageViewClick)))
        
        Emotion6.tag = 6
        Emotion6.isUserInteractionEnabled = true
        Emotion6.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(ImageViewClick)))
        
        Emotion7.tag = 7
        Emotion7.isUserInteractionEnabled = true
        Emotion7.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(ImageViewClick)))
        
        Emotion8.tag = 8
        Emotion8.isUserInteractionEnabled = true
        Emotion8.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(ImageViewClick)))
    }
    
    @objc func ImageViewClick(sender: UITapGestureRecognizer){
        print("클릭 성공")
        
        //감정 클릭시 화면 변화 -> 이후 이미지 개선 필요
        /*isChecked.toggle()
        if isChecked {
            Emotion0.image = UIImage(named: "희열")
        } else {
            Emotion0.image = UIImage(named: "무표정")
        }*/
        
        //viewDidLoad에서 감정마다 각각 준 tag를 이용
        switch sender.view!.tag {
        case 0:
            print("0");
            isChecked.toggle()
            if isChecked {
                Emotion0.image = UIImage(named: "희열")
            } else {
                Emotion0.image = UIImage(named: "무표정")
            }
            Emotion1.image = UIImage(named: "분노")
            Emotion2.image = UIImage(named: "슬픔")
            Emotion3.image = UIImage(named: "놀람")
            Emotion4.image = UIImage(named: "희열")
            Emotion5.image = UIImage(named: "무표정")
            Emotion6.image = UIImage(named: "분노")
            Emotion7.image = UIImage(named: "슬픔")
            Emotion8.image = UIImage(named: "놀람")
            break;
        case 1:
            print("1");
            Emotion0.image = UIImage(named: "무표정")
            isChecked1.toggle()
            if isChecked1 {
                Emotion1.image = UIImage(named: "희열")
            } else {
                Emotion1.image = UIImage(named: "분노")
            }
            Emotion2.image = UIImage(named: "슬픔")
            Emotion3.image = UIImage(named: "놀람")
            Emotion4.image = UIImage(named: "희열")
            Emotion5.image = UIImage(named: "무표정")
            Emotion6.image = UIImage(named: "분노")
            Emotion7.image = UIImage(named: "슬픔")
            Emotion8.image = UIImage(named: "놀람")
            break;
        case 2:
            print("2");
            Emotion0.image = UIImage(named: "무표정")
            Emotion1.image = UIImage(named: "분노")
            isChecked2.toggle()
            if isChecked2 {
                Emotion2.image = UIImage(named: "희열")
            } else {
                Emotion2.image = UIImage(named: "슬픔")
            }
            Emotion3.image = UIImage(named: "놀람")
            Emotion4.image = UIImage(named: "희열")
            Emotion5.image = UIImage(named: "무표정")
            Emotion6.image = UIImage(named: "분노")
            Emotion7.image = UIImage(named: "슬픔")
            Emotion8.image = UIImage(named: "놀람")
            break;
        case 3:
            print("3");
            Emotion0.image = UIImage(named: "무표정")
            Emotion1.image = UIImage(named: "분노")
            Emotion2.image = UIImage(named: "슬픔")
            isChecked3.toggle()
            if isChecked3 {
                Emotion3.image = UIImage(named: "희열")
            } else {
                Emotion3.image = UIImage(named: "놀람")
            }
            Emotion4.image = UIImage(named: "희열")
            Emotion5.image = UIImage(named: "무표정")
            Emotion6.image = UIImage(named: "분노")
            Emotion7.image = UIImage(named: "슬픔")
            Emotion8.image = UIImage(named: "놀람")
            break;
        case 4:
            print("4");
            Emotion0.image = UIImage(named: "무표정")
            Emotion1.image = UIImage(named: "분노")
            Emotion2.image = UIImage(named: "슬픔")
            Emotion3.image = UIImage(named: "놀람")
            isChecked4.toggle()
            if isChecked4 {
                Emotion4.image = UIImage(named: "분노")
            } else {
                Emotion4.image = UIImage(named: "희열")
            }
            Emotion5.image = UIImage(named: "무표정")
            Emotion6.image = UIImage(named: "분노")
            Emotion7.image = UIImage(named: "슬픔")
            Emotion8.image = UIImage(named: "놀람")
            break;
        case 5:
            print("5");
            Emotion0.image = UIImage(named: "무표정")
            Emotion1.image = UIImage(named: "분노")
            Emotion2.image = UIImage(named: "슬픔")
            Emotion3.image = UIImage(named: "놀람")
            Emotion4.image = UIImage(named: "희열")
            isChecked5.toggle()
            if isChecked5 {
                Emotion5.image = UIImage(named: "희열")
            } else {
                Emotion5.image = UIImage(named: "무표정")
            }
            Emotion6.image = UIImage(named: "분노")
            Emotion7.image = UIImage(named: "슬픔")
            Emotion8.image = UIImage(named: "놀람")
            break;
        case 6:
            print("6");
            Emotion0.image = UIImage(named: "무표정")
            Emotion1.image = UIImage(named: "분노")
            Emotion2.image = UIImage(named: "슬픔")
            Emotion3.image = UIImage(named: "놀람")
            Emotion4.image = UIImage(named: "희열")
            Emotion5.image = UIImage(named: "무표정")
            isChecked6.toggle()
            if isChecked6 {
                Emotion6.image = UIImage(named: "희열")
            } else {
                Emotion6.image = UIImage(named: "분노")
            }
            Emotion7.image = UIImage(named: "슬픔")
            Emotion8.image = UIImage(named: "놀람")
            break;
        case 7:
            print("7");
            Emotion0.image = UIImage(named: "무표정")
            Emotion1.image = UIImage(named: "분노")
            Emotion2.image = UIImage(named: "슬픔")
            Emotion3.image = UIImage(named: "놀람")
            Emotion4.image = UIImage(named: "희열")
            Emotion5.image = UIImage(named: "무표정")
            Emotion6.image = UIImage(named: "분노")
            isChecked7.toggle()
            if isChecked7 {
                Emotion7.image = UIImage(named: "희열")
            } else {
                Emotion1.image = UIImage(named: "슬픔")
            }
            Emotion8.image = UIImage(named: "놀람")
            break;
        case 8:
            print("8");
            Emotion0.image = UIImage(named: "무표정")
            Emotion1.image = UIImage(named: "분노")
            Emotion2.image = UIImage(named: "슬픔")
            Emotion3.image = UIImage(named: "놀람")
            Emotion4.image = UIImage(named: "희열")
            Emotion5.image = UIImage(named: "무표정")
            Emotion6.image = UIImage(named: "분노")
            Emotion7.image = UIImage(named: "슬픔")
            if isChecked7 {
                Emotion7.image = UIImage(named: "희열")
            } else {
                Emotion1.image = UIImage(named: "놀람")
            }
            break;
        default:
            break;
        }
    }
}
