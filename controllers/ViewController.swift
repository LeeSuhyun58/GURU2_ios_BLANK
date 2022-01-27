//
//  ViewController.swift
//  GURUiosproject_BLANK
//
//  Created by swuad_21 on 2022/01/21.
//

import UIKit
import FSCalendar
import FMDB

class ViewController: UIViewController{
    
    //데이터베이스 생성
    var databasePath = String()
    var userinfo = Array<String>()
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
        self.initDB()
        //self.CalendarColor()
        //self.CalendarText()
        //self.CalendarEvent()
    }
    
    @IBAction func Clear(_ sender: Any) {
        let dirPaths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        let docDir = dirPaths[0]
        
        databasePath = docDir + "/userinfo.db"
        let db=FMDatabase(path:databasePath)
        if db.open(){
            db.executeStatements("delete from userinfo")
        }
    }
    
    //디비 만들기
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
    
    
    //키보드 제스쳐
    @IBAction func LoginGesture(_ sender: Any) {
        view.endEditing(true)
    }

    @IBAction func BLANK(_ sender: Any) {
        
        //var index = 0
        let db = FMDatabase(path: databasePath)
        
        //typealias columnArray = (Int, String, String, String, String, String, String, String)
        //var columnArray = Array<String>()
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
            //do{
            //    try db.executeUpdate(query, values: nil)
            //    NSLog("저장 성공")
            //} catch{
            //    NSLog("저장 실패")
            //}}
            //let paramDictionary=[NSObject:AnyObject]
            //paramDictionary["col1"] = NameBlank.text
            //let query = "select * from userinfo"
            /*if let result = db.executeQuery(query, withArgumentsIn: []){
                while result.next(){
                    var columnArray = Array<String>()
                    columnArray.append(result.string(forColumn: "name")!)
                    columnArray.append(result.string(forColumn: "MBTI")!)
                    columnArray.append(result.string(forColumn: "color")!)
                    columnArray.append(result.string(forColumn: "music")!)
                    columnArray.append(result.string(forColumn: "movie")!)
                    columnArray.append(result.string(forColumn: "hobby")!)
                    columnArray.append(result.string(forColumn: "goal")!)
                    print(columnArray)
                }
            } else{
                NSLog("결과 없음")
            }
        } else{
            NSLog("db connection error")
        }*/
        
        
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
