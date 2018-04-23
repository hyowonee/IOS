//
//  ViewController.swift
//  LoginPage
//
//  Created by Hyowon Choi on 2018. 4. 19..
//  Copyright © 2018년 Hyowon Choi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var mainLabel: UILabel!
    @IBOutlet var loginButton: UIButton!
    @IBOutlet var emailField: UITextField!
    @IBOutlet var passwordField: UITextField!
    
    var tmpMessage: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginButton.layer.cornerRadius = 10
    }
    
    @IBAction func login() {
        guard let emailText = emailField.text else {
            return
        }
        
        guard let passwordText = passwordField.text else {
            return
        }
        
        if isValidEmailAddress(email: emailText) && isVailedPassword(password: passwordText) {
            if emailText == "hyowon@test.com" && passwordText == "1hyowon2" {
                successAlert()
            } else {
                joinAlert()
            }
        }
        
        if !isValidEmailAddress(email: emailText) {
            tmpMessage = "이메일을"
            failedAlert()
        }
        
        if !isVailedPassword(password: passwordText) {
            tmpMessage = "패스워드를"
            failedAlert()
        }
        
    }
    
    func failedAlert() {
        let alertController = UIAlertController(title: nil, message: "\(tmpMessage) 다시 입력해 주세요.", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "확인", style: .default, handler: nil))
        self.present(alertController, animated: true, completion: nil)
    }
    
    func successAlert() {
        let alertController = UIAlertController(title: nil, message: "로그인에 성공하였습니다!", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "확인", style: .default, handler: nil))
        self.present(alertController, animated: true, completion: nil)
    }
    
    func joinAlert() {
        let alertController = UIAlertController(title: nil, message: "입력하신 내용으로 회원가입을 해주세요!", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "확인", style: .default, handler: nil))
        self.present(alertController, animated: true, completion: nil)
    }
    
    func isValidEmailAddress(email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: email)
    }
    
    func isVailedPassword(password: String) -> Bool {
        let passwordRegEx = "^[a-zA-Z0-9]{8,}$"
        let passwordTest = NSPredicate(format:"SELF MATCHES %@", passwordRegEx)
        return passwordTest.evaluate(with: password)
    }
}

