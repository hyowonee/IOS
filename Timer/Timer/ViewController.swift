//
//  ViewController.swift
//  Timer
//
//  Created by Hyowon Choi on 2018. 3. 31..
//  Copyright © 2018년 Hyowon Choi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: Properties
    
    let timerLabel = UILabel()
    var timer: Timer!
    var seconds = 1000
    
    // MARK: Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.initialize()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            if self.seconds > 0 {
                self.seconds -= 1
            }
            
            let minute = self.seconds / 60
            let second = self.seconds % 60
            let minuteString = "\(minute < 10 ? "0" : "")\(minute)"
            let secondString = "\(second < 10 ? "0" : "")\(second)"
            
            self.timerLabel.text = "\(minuteString):\(secondString)"
        }
        self.timer.fire()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        self.timer = nil
    }
    
    // MARK: Initializing
    
    func initialize() {
        timerLabel.text = "00:00"
        timerLabel.font = UIFont.systemFont(ofSize: 40.0)
        timerLabel.textColor = .black
        timerLabel.sizeToFit()
        timerLabel.center = CGPoint(
            x: UIScreen.main.bounds.width / 2,
            y: UIScreen.main.bounds.height / 2
        )
        self.view.addSubview(timerLabel)
    }
}

