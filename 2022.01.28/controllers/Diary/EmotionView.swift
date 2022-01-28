//
//  EmotionView.swift
//  GURUiosproject_BLANK
//
//  Created by Jake on 2022/01/24.
//

import UIKit
import FSCalendar

class EmotionView:UIViewController {
    var date: String!
    var tag: Int!
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
        //viewDidLoad에서 감정마다 각각 준 tag를 이용
        switch sender.view!.tag {
        case 0:
            print("0");
            tag = sender.view!.tag
            isChecked.toggle()
            if isChecked {
                Emotion0.image = UIImage(named: "무표정ver2")
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
            tag = sender.view!.tag
            Emotion0.image = UIImage(named: "무표정")
            isChecked1.toggle()
            if isChecked1 {
                Emotion1.image = UIImage(named: "분노ver2")
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
            tag = sender.view!.tag
            Emotion0.image = UIImage(named: "무표정")
            Emotion1.image = UIImage(named: "분노")
            isChecked2.toggle()
            if isChecked2 {
                Emotion2.image = UIImage(named: "슬픔ver2")
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
            tag = sender.view!.tag
            Emotion0.image = UIImage(named: "무표정")
            Emotion1.image = UIImage(named: "분노")
            Emotion2.image = UIImage(named: "슬픔")
            isChecked3.toggle()
            if isChecked3 {
                Emotion3.image = UIImage(named: "놀람ver2")
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
            tag = sender.view!.tag
            Emotion0.image = UIImage(named: "무표정")
            Emotion1.image = UIImage(named: "분노")
            Emotion2.image = UIImage(named: "슬픔")
            Emotion3.image = UIImage(named: "놀람")
            isChecked4.toggle()
            if isChecked4 {
                Emotion4.image = UIImage(named: "희열ver2")
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
            tag = sender.view!.tag
            Emotion0.image = UIImage(named: "무표정")
            Emotion1.image = UIImage(named: "분노")
            Emotion2.image = UIImage(named: "슬픔")
            Emotion3.image = UIImage(named: "놀람")
            Emotion4.image = UIImage(named: "희열")
            isChecked5.toggle()
            if isChecked5 {
                Emotion5.image = UIImage(named: "무표정ver2")
            } else {
                Emotion5.image = UIImage(named: "무표정")
            }
            Emotion6.image = UIImage(named: "분노")
            Emotion7.image = UIImage(named: "슬픔")
            Emotion8.image = UIImage(named: "놀람")
            break;
        case 6:
            print("6");
            tag = sender.view!.tag
            Emotion0.image = UIImage(named: "무표정")
            Emotion1.image = UIImage(named: "분노")
            Emotion2.image = UIImage(named: "슬픔")
            Emotion3.image = UIImage(named: "놀람")
            Emotion4.image = UIImage(named: "희열")
            Emotion5.image = UIImage(named: "무표정")
            isChecked6.toggle()
            if isChecked6 {
                Emotion6.image = UIImage(named: "분노ver2")
            } else {
                Emotion6.image = UIImage(named: "분노")
            }
            Emotion7.image = UIImage(named: "슬픔")
            Emotion8.image = UIImage(named: "놀람")
            break;
        case 7:
            print("7");
            tag = sender.view!.tag
            Emotion0.image = UIImage(named: "무표정")
            Emotion1.image = UIImage(named: "분노")
            Emotion2.image = UIImage(named: "슬픔")
            Emotion3.image = UIImage(named: "놀람")
            Emotion4.image = UIImage(named: "희열")
            Emotion5.image = UIImage(named: "무표정")
            Emotion6.image = UIImage(named: "분노")
            isChecked7.toggle()
            if isChecked7 {
                Emotion7.image = UIImage(named: "슬픔ver2")
            } else {
                Emotion7.image = UIImage(named: "슬픔")
            }
            Emotion8.image = UIImage(named: "놀람")
            break;
        case 8:
            print("8");
            tag = sender.view!.tag
            Emotion0.image = UIImage(named: "무표정")
            Emotion1.image = UIImage(named: "분노")
            Emotion2.image = UIImage(named: "슬픔")
            Emotion3.image = UIImage(named: "놀람")
            Emotion4.image = UIImage(named: "희열")
            Emotion5.image = UIImage(named: "무표정")
            Emotion6.image = UIImage(named: "분노")
            Emotion7.image = UIImage(named: "슬픔")
            isChecked8.toggle()
            if isChecked8 {
                Emotion8.image = UIImage(named: "놀람ver2")
            } else {
                Emotion8.image = UIImage(named: "놀람")
            }
            break;
        default:
            break;
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.destination is DiaryView {
            let DiaryDate = segue.destination as? DiaryView
            DiaryDate?.date = self.myLabel.text ?? ""
            
            let EI = segue.destination as? DiaryView
            switch tag {
            case 0:
                EI?.EmotionImage = self.Emotion0.image
                break;
            case 1:
                EI?.EmotionImage = self.Emotion1.image
                break;
            case 2:
                EI?.EmotionImage = self.Emotion2.image
                break;
            case 3:
                EI?.EmotionImage = self.Emotion3.image
                break;
            case 4:
                EI?.EmotionImage = self.Emotion4.image
                break;
            case 5:
                EI?.EmotionImage = self.Emotion5.image
                break;
            case 6:
                EI?.EmotionImage = self.Emotion6.image
                break;
            case 7:
                EI?.EmotionImage = self.Emotion7.image
                break;
            case 8:
                EI?.EmotionImage = self.Emotion8.image
                break;
            default:
                break;
            }
            
        }
    }
}
