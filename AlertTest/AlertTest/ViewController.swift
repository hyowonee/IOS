//
//  ViewController.swift
//  AlertTest
//
//  Created by NEXT on 2018. 1. 27..
//  Copyright © 2018년 NEXT. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func showAlert() {
        let alertController = UIAlertController(title: "제목", message: "내용", preferredStyle: .alert)
        
        alertController.addAction(UIAlertAction(title: "취소", style: .cancel, handler: nil))
        alertController.addAction(UIAlertAction(title: "확인", style: .default, handler: { alertAction in
            print("안녕하세요!")
        }))
        alertController.addAction(UIAlertAction(title: "삭제", style: .destructive, handler: { alertAction in
            print("삭제!")
        }))
        
        self.present(alertController, animated: true, completion: nil)
    }
}

