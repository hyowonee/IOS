//
//  ViewController.swift
//  secondTodo
//
//  Created by NEXT on 2018. 1. 24..
//  Copyright © 2018년 NEXT. All rights reserved.
//

import UIKit
import GlitchLabel
import Twinkle

class ViewController: UIViewController {
    
    var squareView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        squareView = UIView(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
        squareView.backgroundColor = UIColor.black
        
        // UIScreen.main.bounds.size.width  실행된 기기의 너비
        // UIScreen.main.bounds.size.height 실행된 기기의 높이
        
        squareView.twinkle()
        self.view.addSubview(squareView)
        
        let glitchLabel = GlitchLabel()
        glitchLabel.text = "Hello, World!"
        glitchLabel.blendMode = .multiply
        glitchLabel.font = UIFont.boldSystemFont(ofSize: 50.0)
        glitchLabel.frame.origin.y = 50
        glitchLabel.frame.origin.x = 0
        glitchLabel.sizeToFit()
        view.addSubview(glitchLabel)
    }
    
    @IBAction func animate() {
        UIView.animate(withDuration: 1) {
            self.squareView.frame.origin.y += 50
        }
    }
}
