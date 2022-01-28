//
//  MyPageView.swift
//  GURUiosproject_BLANK
//
//  Created by Jake on 2022/01/26.
//

import UIKit
import FMDB

class MyPageView:UIViewController, UITextFieldDelegate {
    var databasePath=String()
    var userinfo = Array<String>()
    var info = Array<Array<String>>()
    
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var mbti: UITextField!
    @IBOutlet weak var color: UITextField!
    @IBOutlet weak var music: UITextField!
    @IBOutlet weak var movie: UITextField!
    @IBOutlet weak var hobby: UITextField!
    @IBOutlet weak var goal: UITextField!
    
    override func viewWillAppear(_ animated: Bool) {
        self.readDB()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        //디비 열기 함수
        self.openDB()
        //디비 열어서 읽는 함수
        self.readDB()
    }
    
    //아직 구현중..절대 누르지마
    @IBAction func remove(_ sender: Any) {
        let dirPaths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        
        let docDir = dirPaths[0]
        databasePath = docDir + "/userinfo.db"
        let db=FMDatabase(path:databasePath)
        if db.open(){
            db.executeStatements("delete from userinfo")
            
        }
    }
    
    @IBAction func update(_ sender: Any) {
        let db = FMDatabase(path: databasePath)
        
        if db.open(){
                    //try! db.executeUpdate("delete from userinfo", values: [])
            let query = "update userinfo set name = '\(name.text!)', MBTI = '\(mbti.text!)', color = '\(color.text!)', music = '\(music.text!)', movie = '\(movie.text!)', hobby = '\(hobby.text!)', goal = '\(goal.text!)'"
                    if !db.executeUpdate(query, withArgumentsIn: []){
                        NSLog("업데이트 실패")
                    }else{
                        NSLog("업데이트 성공")
                    }
                } else{
                    NSLog("db connection error")
                }
    }
    
    //디비 파일 열기
    func openDB(){
        let fileMgr = FileManager.default
        let dirPaths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        let docDir = dirPaths[0]
        
        databasePath = docDir + "/userinfo.db"
        if !fileMgr.fileExists(atPath: databasePath){
            let db = FMDatabase(path: databasePath)
            if db.open() {
                
            }
        } else{
            NSLog("디비파일 열기 성공")
        }
    }
    
    //디비 읽어서 텍스트 필드에 디비 내용 채우는 함수
    func readDB(){
        info = Array<Array<String>>()
        
        let db = FMDatabase(path: databasePath)
        if db.open(){
            let query = "select * from userinfo"
            if let result = db.executeQuery(query, withArgumentsIn: []){
                while result.next(){
                    var columnArray = Array<String>()
                    columnArray.append(result.string(forColumn: "name")!)
                    columnArray.append(result.string(forColumn: "MBTI")!)
                    columnArray.append(result.string(forColumn: "color")!)
                    columnArray.append(result.string(forColumn: "music")!)
                    columnArray.append(result.string(forColumn: "movie")!)
                    columnArray.append(result.string(forColumn: "hobby")!)
                    columnArray.append(result.string(forColumn: "goal")!)
                    
                    info.append(columnArray)
                }
                self.name.text=info[0][0]
                self.mbti.text=info[0][1]
                self.color.text=info[0][2]
                self.music.text=info[0][3]
                self.movie.text=info[0][4]
                self.hobby.text=info[0][5]
                self.goal.text=info[0][6]
            } else{
                NSLog("결과 없음")
            }
        } else{
            NSLog("db connection error")
        }
    }
}

