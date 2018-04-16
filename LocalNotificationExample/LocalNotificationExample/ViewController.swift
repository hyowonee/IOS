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

    override func viewDidLoad() {
        super.viewDidLoad()
        
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge], completionHandler: {didAllow, error in
        }) // 권한 체크
    }
    
    @IBAction func sendNotification() {
        let content = UNMutableNotificationContent() // 노티피케이션 메세지 객체
        content.title = NSString.localizedUserNotificationString(forKey: "알림!", arguments: nil)
        content.body = NSString.localizedUserNotificationString(forKey: "짜증나!", arguments: nil)
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false) // 얼마 후 실행?
        
        let request = UNNotificationRequest(identifier: "LocalNotification", content: content, trigger: trigger) // 노티피케이션 전송 객체
        
        let center = UNUserNotificationCenter.current() // 노티피케이션 센터
        center.add(request) { (error : Error?) in // 노티피케이션 객체 추가 -> 전송
            if let theError = error {
                print(theError.localizedDescription)
            }
        }
    }
}

