//
//  ViewController.swift
//  PracticeAlarmClock
//
//  Created by 유저 on 2021. 1. 29..
//  Copyright © 2021년 유저. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // 타이머가 구동되면 실행하는 함수
    let timeSelector: Selector = #selector(ViewController.updateTime)
    // 타이머가 구동되면 실행하는 함수
    let minSelector : Selector = #selector(ViewController.minTime)
    // 타이머를 킬 것인지 끌 것인지
    var isTimerState = false
    // 타이머 간격
    let interval = 1.0
    var count = 0
    
    var curTime: String? = nil
    var picTime: String? = nil
    
    @IBOutlet var lblCurrentTime: UILabel!
    @IBOutlet var lblPickerTime: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // 1초 동안 구동되는 타이머 함수
        Timer.scheduledTimer(timeInterval: interval, target: self, selector: timeSelector, userInfo: nil, repeats: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func changeDatePicker(_ sender: UIDatePicker) {
        let formatter = DateFormatter()
        
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss EEE"
        
        picTime = formatter.string(from: sender.date)
        
        lblPickerTime.text = "select time:"+formatter.string(from: sender.date)
    }

    // 1씩 증가하는 함수 - 현재시간
    @objc func updateTime(){
        let date = NSDate()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss EEE"
        
        curTime = formatter.string(from: date as Date)

        lblCurrentTime.text = "current time: "+formatter.string(from: date as Date)
        
        
        if picTime == curTime {
            isTimerState = true
            
            let alert = UIAlertController(title: "알림", message: "설정된 시간입니다 !!!", preferredStyle: UIAlertControllerStyle.alert)
            
            let onAction = UIAlertAction(title: "네, 알겠습니다.", style: .default, handler: {
                ACTION in
                // 60초 후에 알림을 다시 켜주는 타이머
                Timer.scheduledTimer(timeInterval: 60.0, target: self, selector: #selector(self.timerOn), userInfo: nil, repeats: true)
            })
            
            alert.addAction(onAction)
            present(alert, animated: true, completion: nil)
        }
    }
    
    @objc func timerOn(){
        isTimerState = false
        // 실제로 켜지는지 확인하려고 넣은 코드
        print("알람 기능이 켜졌습니다")
    }
    
    // 1분동안 알림이 안열릴 수 있게
    // 아예 얼럿 기능이 진행되지 않게는 못하는 코드
    // 얼럿이 켜지면 바로 무시만 되는 ...
    @objc func noAlert(){
        count+=1
        if count < 60 {
            dismiss(animated: true, completion: nil)
        }
        print(count)
    }
    
    // 1분마다 바뀔 수 있게
    @objc func minTime(){
        count+=1
        if count < 60 {
            view.backgroundColor = UIColor.blue
        } else if(count > 60) {
            view.backgroundColor = UIColor.white
        }
    }
}

