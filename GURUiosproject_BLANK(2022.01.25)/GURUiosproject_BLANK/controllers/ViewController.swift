//
//  ViewController.swift
//  GURUiosproject_BLANK
//
//  Created by swuad_21 on 2022/01/21.
//

import UIKit
import FSCalendar

class ViewController: UIViewController{
    //Login 화면에서 사용자 정보 입력받기
    @IBOutlet weak var NameBlank: UITextField! //사용자 이름
    @IBOutlet weak var MBTIBlank: UITextField! //성격유형
    @IBOutlet weak var ColorBlank: UITextField! //좋아하는색
    @IBOutlet weak var MusicBlank: UITextField! //좋아하는 음악
    @IBOutlet weak var MovieBlank: UITextField! //인생영화
    @IBOutlet weak var HobbyBlank: UITextField! //취미
    @IBOutlet weak var GoalBlank: UITextField! //올해 목표
    
    //달력 구현
    //@IBOutlet weak var calendar: FSCalendar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //self.CalendarColor()
        //self.CalendarText()
        //self.CalendarEvent()
    }
    
    //키보드 제스쳐
    @IBAction func LoginGesture(_ sender: Any) {
        view.endEditing(true)
    }

    @IBAction func BLANK(_ sender: Any) {
        let alert = UIAlertController(title: "BLANK", message: "당신의 BLANK가 채워졌어요.", preferredStyle: .alert)
        
        let ok = UIAlertAction(title: "확인", style: .default) { (ok) in
            //홈화면으로 이동
            //스토리보드 보기1
            let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
            //(화면에 보일)홈화면 스토리보드
            let settingboard = storyboard.instantiateViewController(withIdentifier: "Main")
            //설정한 뷰 컨트롤러 보여주기 -> present
            settingboard.modalPresentationStyle = .fullScreen
            self.present(settingboard,animated: true,completion: nil)
        }
        
        alert.addAction(ok)
        
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func checkPopUp(_ sender: Any) {
        let alert = UIAlertController(title: "BLANK", message: "오늘의 BLANK를 채울 노래가 추천되었어요. 지금 들어보시는거 어떠세요?", preferredStyle: .alert)
        
        let ok = UIAlertAction(title: "지금 듣기", style: .default) { (ok) in
            //code
        }
        
        let cancel = UIAlertAction(title: "나중에 듣기", style: .default){ (cancel) in
            //스토리보드 보기2
            let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
            //(화면에 보일)홈화면 스토리보드
            let settingboard = storyboard.instantiateViewController(withIdentifier: "Main")
            //설정한 뷰 컨트롤러 보여주기 -> present
            settingboard.modalPresentationStyle = .fullScreen
            self.present(settingboard,animated: true,completion: nil)
        }
        
        alert.addAction(cancel)
        
        alert.addAction(ok)
        
        self.present(alert, animated: true, completion: nil)
    }

}
