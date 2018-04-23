//
//  CounterView.swift
//  DesignableExample
//
//  Created by Hyowon Choi on 2018. 4. 22..
//  Copyright © 2018년 Hyowon Choi. All rights reserved.
//

import UIKit

@IBDesignable
class CounterView: UIView {
    
    var minusButton: UIButton = UIButton()
    var plusButton: UIButton = UIButton()
    var countLabel: UILabel = UILabel()
    
    @IBInspectable var count: Int = 0

    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        self.minusButton.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        self.countLabel.frame = CGRect(x: 30, y: 0, width: self.frame.size.width - 60, height: 30)
        self.plusButton.frame = CGRect(x: 30 + self.countLabel.frame.size.width, y: 0, width: 30, height: 30)
        
        self.minusButton.backgroundColor = .red
        self.countLabel.backgroundColor = .blue
        self.plusButton.backgroundColor = .green
        
        self.minusButton.setTitle("-", for: .normal)
        self.minusButton.titleLabel?.textColor = .white
        self.minusButton.titleLabel?.textAlignment = .center
        self.countLabel.text = "\(self.count)"
        self.countLabel.textColor = .white
        self.countLabel.textAlignment = .center
        self.plusButton.setTitle("+", for: .normal)
        self.plusButton.titleLabel?.textColor = .white
        self.plusButton.titleLabel?.textAlignment = .center
        
        self.minusButton.addTarget(self, action: #selector(self.minus), for: .touchUpInside)
        self.plusButton.addTarget(self, action: #selector(self.plus), for: .touchUpInside)
        
        self.addSubview(minusButton)
        self.addSubview(countLabel)
        self.addSubview(plusButton)
    }
    
    @objc func minus() {
        self.count -= 1
        self.countLabel.text = "\(self.count)"
    }
    
    @objc func plus() {
        self.count += 1
        self.countLabel.text = "\(self.count)"
    }
    
}
