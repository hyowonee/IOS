//
//  ViewController.swift
//  Circle
//
//  Created by Hyowon Choi on 2018. 3. 27..
//  Copyright © 2018년 Hyowon Choi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var circle: UIView = UIView()
    var centerX = UIScreen.main.bounds.size.width * 0.5
    var centerY = UIScreen.main.bounds.size.height * 0.5
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        circle.frame = CGRect(x: centerX - 50, y: centerY - 50, width: 100, height: 100)
        circle.layer.backgroundColor = UIColor.red.cgColor
        circle.layer.cornerRadius = 50
        circle.layer.shadowOpacity = 0.5
        circle.layer.shadowRadius = 7
        
        self.view.addSubview(circle)
    }
}

