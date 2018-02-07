//
//  ViewController.swift
//  Countdown
//
//  Created by Hyowon Choi on 2018. 2. 4..
//  Copyright © 2018년 Hyowon Choi. All rights reserved.
//

import UIKit
import CountdownLabel
import LTMorphingLabel

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let countdownLabel = CountdownLabel(frame: CGRect(x: 100, y: 100, width: 200, height: 100), minutes: 60)
        countdownLabel.start()
        countdownLabel.font = UIFont.systemFont(ofSize: 30)
        countdownLabel.animationType = CountdownEffect.Sparkle
        countdownLabel.textColor = UIColor.black
        
        self.view.addSubview(countdownLabel)
    }
}