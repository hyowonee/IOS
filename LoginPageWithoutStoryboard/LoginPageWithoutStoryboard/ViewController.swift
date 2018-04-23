//
//  ViewController.swift
//  LoginPageWithoutStoryboard
//
//  Created by Hyowon Choi on 2018. 4. 24..
//  Copyright © 2018년 Hyowon Choi. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    var mainLabel = UILabel()
    var emailField = UITextField()
    var passwordField = UITextField()
    var loginButton = UIButton()
    var underLineView = UIView()
    
    var tmpMessage: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(mainLabel)
        self.view.addSubview(emailField)
        self.view.addSubview(passwordField)
        self.view.addSubview(loginButton)
        self.view.addSubview(underLineView)
        
        self.mainLableLayout()
        self.emailFieldLayout()
        self.passwordFieldLayout()
        self.loginButtonLayout()
        
        self.loginButton.addTarget(self, action: #selector(self.login), for: .touchUpInside)
    }
    
    func mainLableLayout() {
        mainLabel.text = "효원 캠퍼스"
        mainLabel.textColor = .black
        mainLabel.sizeToFit()
        mainLabel.snp.makeConstraints{ make in
            make.centerX.equalTo(self.view)
            make.top.equalTo(100)
        }
    }
    
    func emailFieldLayout() {
        emailField.placeholder = "아이디를 입력하세요."
        emailField.snp.makeConstraints { make in
            make.centerX.equalTo(self.view)
            make.leading.equalTo(50)
            make.trailing.equalTo(-50)
            make.top.equalTo(mainLabel.snp.bottom).offset(150)
        }
        
    }
    
    func passwordFieldLayout() {
        passwordField.placeholder = "비밀번호를 입력하세요."
        passwordField.snp.makeConstraints{ make in
            make.centerX.equalTo(self.view)
            make.leading.equalTo(50)
            make.trailing.equalTo(-50)
            make.top.equalTo(emailField.snp.bottom).offset(50)
        }
//        underLineViewLayout(textField: self.passwordField)
    }
    
    func loginButtonLayout() {
        loginButton.setTitle("Login", for: .normal)
        loginButton.setTitleColor(.white, for: .normal)
        loginButton.backgroundColor = .black
        loginButton.layer.cornerRadius = 10
        loginButton.snp.makeConstraints{ make in
            make.centerX.equalTo(self.view)
            make.leading.equalTo(30)
            make.trailing.equalTo(-30)
            make.top.equalTo(passwordField.snp.bottom).offset(100)
        }
//        underLineViewLayout(textField: self.emailField)
    }
    
    func underLineViewLayout(textField: UITextField) {
        let underLineView = UIView()
        underLineView.backgroundColor = .lightGray
        underLineView.snp.makeConstraints{ make in
            make.height.equalTo(0.5)
            make.leading.equalTo(48)
            make.leading.equalTo(70)
            make.top.equalTo(textField.snp.bottom).offset(12)
        }
    }
    
    @objc func login() {
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

