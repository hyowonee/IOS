//
//  ViewController.swift
//  rotateView
//
//  Created by NEXT on 2018. 1. 31..
//  Copyright © 2018년 NEXT. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var rotateView: UIView!
    var degrees: Float = 45; //the value in degrees
    let screenWidth = UIScreen.main.bounds.size.width
    let screenHeight = UIScreen.main.bounds.size.height
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        rotateView = UIView(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
        rotateView.backgroundColor = UIColor.cyan
        self.view.addSubview(rotateView)
    }
    
    @IBAction func move() {
        let x = self.rotateView.frame.origin.x
        let y = self.rotateView.frame.origin.y
        
        if(y + 100 <= screenHeight && x > 0) {
            UIView.animate(withDuration: 0.5) {
                self.rotateView.frame.origin.y += 50
            }
        }
        if (y + 100 >= screenHeight && x <= screenWidth/2) {
            UIView.animate(withDuration: 0.5) {
                self.rotateView.frame.origin.x -= 100
                self.rotateView.frame.origin.y -= 100
            }
        }
        if(x <= 0 && y >= screenHeight) {
            UIView.animate(withDuration: 0.5) {
                self.rotateView.frame.origin.x += 100
                self.rotateView.frame.origin.y -= 100
            }
        }
//        UIView.animate(withDuration: 1) {
//            self.rotateView.transform = CGAffineTransform(rotationAngle: CGFloat(self.degrees * Float(M_PI/180)));
//        }
    }
}

