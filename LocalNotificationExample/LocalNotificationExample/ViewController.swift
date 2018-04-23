//
//  ViewController.swift
//  LocalNotificationExample
//
//  Created by Hyowon Choi on 2018. 4. 15..
//  Copyright © 2018년 Hyowon Choi. All rights reserved.
//

import UIKit
import UserNotifications

class ViewController: UIViewController {

    @IBOutlet var timeTextField: UITextField!
    @IBOutlet var realTimeLabel: UILabel!
    let dateFormatter = DateFormatter()
    var currentDateTime = Date()
    var timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector:#selector(self.tick) , userInfo: nil, repeats: true)
        
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge], completionHandler: {didAllow, error in
        }) // 권한 체크
        
        self.dismissKeyboard()
    }
    
    @objc func tick() {
        realTimeLabel.text = DateFormatter.localizedString(from: Date(), dateStyle: .none, timeStyle: .medium)
    }
    
    @IBAction func sendNotification() {
        print("시작이다")
        
        guard let timeText = timeTextField.text else {
            return
        }
        
        let date = Date()
        let calendar = Calendar.current
        let realHour = calendar.component(.hour, from: date)
        let realMinute = calendar.component(.minute, from: date)
        let realSecond = calendar.component(.second, from: date)
        
        let time = timeText.split(separator: ":").map { val -> Int in
            return Int(val)!
        }
        
        let timeDiffer = Double((time[0] - realHour) * 3600 + (time[1] - realMinute) * 60 + (time[2] - realSecond))
        print("timeDiffer : \(timeDiffer)")
        let content = UNMutableNotificationContent() // 노티피케이션 메세지 객체
        content.title = NSString.localizedUserNotificationString(forKey: "알림!", arguments: nil)
        content.body = NSString.localizedUserNotificationString(forKey: "\(time[0]):\(time[1]) 입니다!", arguments: nil)

        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: timeDiffer, repeats: false) // 얼마 후 실행?

        let request = UNNotificationRequest(
            identifier: "LocalNotification",
            content: content,
            trigger: trigger
        ) // 노티피케이션 전송 객체

        let center = UNUserNotificationCenter.current() // 노티피케이션 센터
        center.add(request) { (error : Error?) in // 노티피케이션 객체 추가 -> 전송
            if let theError = error {
                print(theError.localizedDescription)
            }
        }
        print("yes!!")
    }
    
    @IBAction func dismissKeyboard() {
        view.endEditing(true)
    }
    
}
