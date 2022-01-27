//
//  CalendarView.swift
//  GURUiosproject_BLANK
//
//  Created by Jake on 2022/01/24.
//

import UIKit
import FSCalendar

//FSCalendar 사용
//Class에 FSCalendarDataSource, FSCalendarDelegate 상속 받아 사용
class CalendarView:UIViewController,FSCalendarDataSource, FSCalendarDelegate {
    
    //storyboard에 view를 사용하지 않고 코드로 구현
    //fileprivate weak var calendar:FSCalendar!
    
    @IBOutlet weak var calendarView: FSCalendar!
    @IBOutlet weak var headerLabel: UILabel!
    
    //이전 달로 이동하는 버튼
    @IBAction func prevBtn(_ sender: UIButton) {
        scrollCurrentPage(isPrev:true)
    }
    //다음 달로 이동하는 버튼
    @IBAction func nextBtn(_ sender: UIButton) {
        scrollCurrentPage(isPrev:false)
    }
    
    //현재 페이지에 대한 날짜
    private var currentPage: Date?
    private lazy var today: Date = {
        return Date()
    }()
    
    //레이블 날짜 형식변환
    private lazy var dateformatter: DateFormatter = {
        let df = DateFormatter()
        df.locale = Locale(identifier: "ko_KR")
        df.dateFormat = "yyyy년 M월"
        return df
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setCalendar()
    }
    
    private func scrollCurrentPage(isPrev: Bool){
        let cal = Calendar.current
        var dateComponents = DateComponents()
        dateComponents.month = isPrev ? -1 : 1
        
        self.currentPage = cal.date(byAdding: dateComponents, to: self.currentPage ?? self.today)
        self.calendarView.setCurrentPage(self.currentPage!, animated: true)
    }
    
    func setCalendar() {
        calendarView.delegate = self
        //FSCalendar의 기본 상단바 제거
        calendarView.headerHeight = 0
        //주간, 월간 설정 -> 월간으로 설정
        calendarView.scope = .month
        headerLabel.text = self.dateformatter.string(from: calendarView.currentPage)
    }
    
    func calendarCurrentPageDidChange(_ calendar: FSCalendar) {
        self.headerLabel.text = self.dateformatter.string(from: calendar.currentPage)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //calendar 사이즈 설정
        //let calendar = FSCalendar(frame: CGRect(x: 48, y:200 ,width: 320, height: 320))
        calendarView.dataSource = self
        calendarView.delegate = self
        //코드로 화면에 달력 보이게 구현
        //view.addSubview(calendarView)
        //self.calendarView = calendarView
        
        //옆에 보이는 년,월,날짜 보이지 않게 변경
        calendarView.appearance.headerMinimumDissolvedAlpha = 0
    }
    
    //화면 전환 -> 감정선택 화면으로 전환
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        //EmotionView 가 있는 경우 화면 전환
        guard let modalPresentView = self.storyboard?.instantiateViewController(identifier: "EmotionView") as? EmotionView else {return}
        
        //날짜 형식 설정
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        modalPresentView.date = dateFormatter.string(from: date)
        
        //navigationController 코드로 구현 -> 화면 전환
        self.navigationController?.pushViewController(modalPresentView, animated: true)
        //self.present(modalPresentView, animated: true, completion:nil)
    }
    
    //func CalendarColor() {
        
    //}
    //func CalendarText() {
    //    calendar.appearance.headerMinimumDissolvedAlpha = 0
    //}
    //func CalendarEvent() {
        
    //}
    
}
