//
//  ViewController.swift
//  SnapKitExample
//
//  Created by Hyowon Choi on 2018. 4. 15..
//  Copyright © 2018년 Hyowon Choi. All rights reserved.
//

import UIKit
import SnapKit // autoLayout을 코드로 정리해주는 라이브러리

class ViewController: UIViewController {

    var box = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(box) // autoLayout을 적용하기 위해 먼저 view에 추가 ^^*
        
        box.backgroundColor = .red
        
        box.snp.makeConstraints { make in
            make.width.height.equalTo(50)
            make.center.equalTo(self.view)
        }
        
        let box2 = UIView()
        self.view.addSubview(box2)
        
        box2.backgroundColor = .blue
        box2.snp.makeConstraints { make in
            make.leading.equalTo(10) // 왼
            make.trailing.equalTo(-10) // 오
            make.height.equalTo(50)
            make.top.equalTo(box.snp.bottom).offset(5)
            
        }
        
        let greenBox = UIView()
        self.view.addSubview(greenBox)
        
        greenBox.backgroundColor = .green
        greenBox.snp.makeConstraints { make in
            make.leading.equalTo(10)
            make.width.height.equalTo(50)
            make.bottom.equalTo(box.snp.top).offset(5)
        }
    }
}
