//
//  ViewController.swift
//  LoginPageWithoutStoryboard
//
//  Created by Hyowon Choi on 2018. 4. 24..
//  Copyright © 2018년 Hyowon Choi. All rights reserved.
//
// needs: SnapKit, 뷰 구현, 화면전환, UIImagePickerController, UITextField
import UIKit
import SnapKit

class ViewController: UIViewController {
    
    // MARK: Properties

    var mainLabel = UILabel()
    var emailField = UITextField()
    var passwordField = UITextField()
    var loginButton = UIButton()
    var backgroundImage = UIImageView()
    var profileImage = UIImageView()
    var profileImagePicker = UIImagePickerController()
    var backgroundImagePicker = UIImagePickerController()
    
    // MARK: LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(mainLabel)
        self.view.addSubview(emailField)
        self.view.addSubview(passwordField)
        self.view.addSubview(loginButton)
        self.view.addSubview(backgroundImage)
        self.view.addSubview(profileImage)
        
        self.mainLableLayout()
        self.emailFieldLayout()
        self.passwordFieldLayout()
        self.loginButtonLayout()
        self.backgroundImageLayout()
        self.profileImageLayout()
        self.tapImage(imageView: backgroundImage)
        self.tapImage(imageView: profileImage)
        
        self.loginButton.addTarget(self, action: #selector(self.login), for: .touchUpInside)
        
        self.title = "로그인"
    }
    
    // MARK: Layout Initializing

    func backgroundImageLayout() {
        backgroundImage.backgroundColor = .lightGray
        backgroundImage.snp.makeConstraints{ make in
            make.leading.equalTo(0)
            make.trailing.equalTo(0)
            make.top.equalTo(0)
        }
    }
    
    func profileImageLayout() {
        profileImage.layer.cornerRadius = (UIScreen.main.bounds.width - 220)/2
        profileImage.backgroundColor = .yellow
        profileImage.layer.masksToBounds = true // 영역 밖으로 나가면 잘라줌
        profileImage.snp.makeConstraints{ make in
            make.centerX.equalTo(self.view)
            make.leading.equalTo(110)
            make.trailing.equalTo(-110)
            make.top.equalTo(100)
        }
    }
    
    func mainLableLayout() {
        mainLabel.text = "효원 캠퍼스"
        mainLabel.textColor = .black
        mainLabel.sizeToFit()
        mainLabel.snp.makeConstraints{ make in
            make.centerX.equalTo(self.view)
            make.top.equalTo(200)
            make.top.equalTo(backgroundImage.snp.bottom).offset(20)
            make.top.equalTo(profileImage.snp.bottom).offset(0)
        }
    }
    
    func emailFieldLayout() {
        emailField.placeholder = "아이디를 입력하세요."
        emailField.keyboardType = .emailAddress
        emailField.autocapitalizationType = .none
        emailField.snp.makeConstraints { make in
            make.centerX.equalTo(self.view)
            make.leading.equalTo(50)
            make.trailing.equalTo(-50)
            make.top.equalTo(mainLabel.snp.bottom).offset(50)
        }
        
    }
    
    func passwordFieldLayout() {
        passwordField.placeholder = "비밀번호를 입력하세요."
        passwordField.isSecureTextEntry = true
        passwordField.autocapitalizationType = .none
        passwordField.snp.makeConstraints{ make in
            make.centerX.equalTo(self.view)
            make.leading.equalTo(50)
            make.trailing.equalTo(-50)
            make.top.equalTo(emailField.snp.bottom).offset(50)
        }
        underLineViewLayout(textField: self.passwordField)
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
        underLineViewLayout(textField: self.emailField)
    }
    
    func underLineViewLayout(textField: UITextField) {
        let underLineView = UIView()
        self.view.addSubview(underLineView)
        underLineView.backgroundColor = .lightGray
        underLineView.snp.makeConstraints{ make in
            make.height.equalTo(0.5)
            make.leading.equalTo(48)
            make.trailing.equalTo(-70)
            make.top.equalTo(textField.snp.bottom).offset(12)
        }
    }
    
    func tapImage(imageView: UIImageView) {
        var tap = UITapGestureRecognizer()
        if imageView == backgroundImage {
            tap = UITapGestureRecognizer(target: self, action: #selector(changeBackgroundImage))
        } else {
            tap = UITapGestureRecognizer(target: self, action: #selector(changeProfileImage))
        }
        imageView.addGestureRecognizer(tap)
        imageView.isUserInteractionEnabled = true
    }
    
    @objc func changeBackgroundImage() {
        backgroundImagePicker.sourceType = .photoLibrary
        backgroundImagePicker.allowsEditing = false
        backgroundImagePicker.delegate = self
        present(backgroundImagePicker, animated: true)
    }
    
    @objc func changeProfileImage() {
        profileImagePicker.sourceType = .photoLibrary
        profileImagePicker.allowsEditing = false
        profileImagePicker.delegate = self
        present(profileImagePicker, animated: true)
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
            failedAlert(message: "이메일을")
        }
        
        if !isVailedPassword(password: passwordText) {
            failedAlert(message: "패스워드를")
        }
        
    }
    
    func failedAlert(message: String) {
        let alertController = UIAlertController(title: nil, message: "\(message) 다시 입력해 주세요.", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "확인", style: .default, handler: nil))
        self.present(alertController, animated: true, completion: nil)
    }
    
    func successAlert() {
        let settingViewController = SettingViewController()
        // 이런 식으로 settingController로 넘겨 주었다.
        self.navigationController?.pushViewController(settingViewController, animated: true)
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

extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        var newImage: UIImage? = nil
        
        if let possibleImage = info["UIImagePickerControllerEditedImage"] as? UIImage {
            newImage = possibleImage
        } else if let possibleImage = info["UIImagePickerControllerOriginalImage"] as? UIImage {
            newImage = possibleImage
        }
        
        if picker == profileImagePicker {
            profileImage.image = newImage
            picker.dismiss(animated: true)
        } else if picker == backgroundImagePicker {
            backgroundImage.image = newImage
            picker.dismiss(animated: true)
        }
    }
}

