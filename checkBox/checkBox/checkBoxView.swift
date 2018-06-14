//
//  checkBoxView.swift
//  checkBox
//
//  Created by Hyowon Choi on 2018. 4. 24..
//  Copyright © 2018년 Hyowon Choi. All rights reserved.
//

import UIKit

@IBDesignable
class checkBoxView: UIView {
    
    var circleView = UIView()
    var leftCheckView = UIView()
    var rightCheckView = UIView()
    
    @IBInspectable var Checked: Bool = true
    @IBInspectable var CheckMarkColor: UIColor!
    @IBInspectable var Filled: Bool = true
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        self.circleView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        self.circleView.layer.cornerRadius = 50
        self.leftCheckView.frame = CGRect(x: 12.5, y: 57, width: 40, height: 10)
        self.leftCheckView.backgroundColor = .white
        self.leftCheckView.rotate(angle: 50)
        self.rightCheckView.frame = CGRect(x: 38.5, y: 50, width: 50, height: 10)
        self.rightCheckView.backgroundColor = .white
        self.rightCheckView.rotate(angle: 140)
        
        isOn(view: circleView)
        changeCheckColor(color: CheckMarkColor)
        isfilled(view1: leftCheckView, view2: rightCheckView)
        
        self.addSubview(circleView)
        self.addSubview(leftCheckView)
        self.addSubview(rightCheckView)
    }
    
    func isOn(view: UIView) {
        if Checked {
            self.circleView.backgroundColor = .blue
        } else {
            self.circleView.backgroundColor = .lightGray
        }
    }
    
    func changeCheckColor(color: UIColor) {
        self.leftCheckView.backgroundColor = color
        self.rightCheckView.backgroundColor = color
    }
    
    func isfilled(view1: UIView, view2: UIView) {
        if Filled {
            return
        } else { // removeFromSuperView() 를 사용했으나 안되서 꼼수 씀
            self.leftCheckView.isHidden = true
            self.rightCheckView.isHidden = true
        }
    }
}

extension UIView {
    func rotate(angle: CGFloat) {
        let radians = angle / 180.0 * CGFloat(Double.pi)
        let rotation = self.transform.rotated(by: radians)
        self.transform = rotation
    }
}
