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
            Timer.scheduledTimer(timeInterval: interval, target: self, selector: minSelector, userInfo: nil, repeats: true)
        }
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

