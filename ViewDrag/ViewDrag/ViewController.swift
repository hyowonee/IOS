//
//  ViewController.swift
//  ViewDrag
//
//  Created by Hyowon Choi on 2018. 4. 7..
//  Copyright © 2018년 Hyowon Choi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var circleView = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        circleView.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        circleView.center = CGPoint( // circleView의 가운데가 중심점이 되어 이동한다!!
            x: UIScreen.main.bounds.width / 2,
            y: UIScreen.main.bounds.height / 2
        )
        circleView.layer.cornerRadius = 25
        circleView.backgroundColor = UIColor.red
        self.view.addSubview(circleView) // 여기서 view는 ViewController가 가지고 있는 view!!
        
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(self.drag))
        circleView.addGestureRecognizer(panGesture)
    }
    
    @objc func drag(sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: self.view)
        sender.view!.center = CGPoint(x: sender.view!.center.x + translation.x, y: sender.view!.center.y + translation.y)
        sender.setTranslation(.zero, in: self.view)
    }
}
