//
//  DiaryView.swift
//  GURUiosproject_BLANK
//
//  Created by Jake on 2022/01/26.
//

import UIKit

class DiaryView:UIViewController, UITextFieldDelegate {
    @IBOutlet weak var DiaryTextField: UITextField!
    @IBOutlet weak var subBtn: UIButton!{
        didSet{
            subBtn.isEnabled = false
        }
    }
    
    @IBOutlet weak var DiaryLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //버튼 비활성화
        self.DiaryTextField.delegate = self
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        print("range: ", range)
        if range.location == 0 && range.length != 0 {
            self.subBtn.isEnabled = false
        } else {
            self.subBtn.isEnabled = true
        }
        return true
    }
    
    @IBAction func DiaryCheck(_ sender: UIButton) {
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
