//
//  ViewController.swift
//  GURUiosproject_BLANK
//
//  Created by swuad_21 on 2022/01/21.
//

import UIKit
import FSCalendar
import FMDB

class ViewController: UIViewController, UITextFieldDelegate { //TextFieldDelegate 상속 받음 -> textField 함수를 사용하기 위해서
    //Login 화면에서 사용자 정보 입력받기
    @IBOutlet weak var NameBlank: UITextField! //사용자 이름
    @IBOutlet weak var MBTIBlank: UITextField! //성격유형
    @IBOutlet weak var ColorBlank: UITextField! //좋아하는색
    @IBOutlet weak var MusicBlank: UITextField! //좋아하는 음악
    @IBOutlet weak var MovieBlank: UITextField! //인생영화
    @IBOutlet weak var HobbyBlank: UITextField! //취미
    @IBOutlet weak var GoalBlank: UITextField! //올해 목표
    
    //데이터베이스 생성
        var databasePath = String()
        var userinfo = Array<String>()
    
    @IBOutlet weak var fillBlank: UIButton! {
        //초기에 버튼을 false로 설정 -> 비활성화 상태
        didSet{
            self.fillBlank.isEnabled = false
        }
    }
    
    //디비 생성
        func initDB(){
            let fileMgr = FileManager.default
            let dirPaths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
            let docDir = dirPaths[0]
            
            databasePath = docDir + "/userinfo.db"
            if !fileMgr.fileExists(atPath: databasePath){
                let db = FMDatabase(path: databasePath)
                if db.open() {
                    let query = "create table if not exists userinfo (num integer not null primary key autoincrement, name TEXT, MBTI TEXT, color TEXT, music TEXT, movie TEXT, hobby TEXT, goal TEXT)"
                    if !db.executeStatements(query){
                        NSLog("디비 생성 실패")
                    } else{
                        NSLog("디비 생성 성공")
                    }
                }
            } else{
                NSLog("디비파일 있음")
            }
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //디비 생성
        self.initDB()
        
        //Calendr 커스텀
        //self.CalendarColor()
        //self.CalendarText()
        //self.CalendarEvent()
        
        //버튼 비/활성화를 위한 작업
        self.NameBlank.delegate = self
        self.MBTIBlank.delegate = self
        self.ColorBlank.delegate = self
        self.MusicBlank.delegate = self
        self.MovieBlank.delegate = self
        self.HobbyBlank.delegate = self
        self.GoalBlank.delegate = self
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        //텍스트 필드가 비어있는지에 따른 버튼 비/활성화
        //텍스트 필드가 채워지는 범위 출력
        print("range: ", range)
        //범위가 0이거나 길이가 0인 경우 -> 버튼 비활성화
        if range.location == 0 && range.length != 0 {
            self.fillBlank.isEnabled = false
        } else { //아닌 경우 -> 버튼 활성화
            self.fillBlank.isEnabled = true
        }
        return true
    }
    
    //임의 디비 삭제 버튼
    @IBAction func clear(_ sender: Any) {
        let dirPaths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        
        let docDir = dirPaths[0]
        databasePath = docDir + "/userinfo.db"
        let db=FMDatabase(path:databasePath)
        if db.open(){
            db.executeStatements("delete from userinfo")
            
        }
    }
    
    @IBAction func BLANK(_ sender: Any) {
        
        let db = FMDatabase(path: databasePath)
        
        if db.open(){
                    //try! db.executeUpdate("delete from userinfo", values: [])
                    let query = "INSERT INTO userinfo(name, MBTI, color, music, movie, hobby, goal) VALUES('\(NameBlank.text!)','\(MBTIBlank.text!)','\(ColorBlank.text!)','\(MusicBlank.text!)','\(MovieBlank.text!)','\(HobbyBlank.text!)','\(GoalBlank.text!)')"
                    if !db.executeUpdate(query, withArgumentsIn: []){
                        NSLog("저장 실패")
                    }else{
                        NSLog("저장 성공")
                    }
                } else{
                    NSLog("db connection error")
                }
        
        //팝업창
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
        //ok를 선택한 경우
        alert.addAction(ok)
        
        self.present(alert, animated: true, completion: nil)
    }
    //키보드 제스쳐
    @IBAction func LoginGesture(_ sender: Any) {
        view.endEditing(true)
    }
}
