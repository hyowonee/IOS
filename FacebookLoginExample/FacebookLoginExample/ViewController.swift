//
//  ViewController.swift
//  FacebookLoginExample
//
//  Created by Hyowon Choi on 2018. 4. 15..
//  Copyright © 2018년 Hyowon Choi. All rights reserved.
//

import UIKit
import FBSDKLoginKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let loginButton = FBSDKLoginButton()
        loginButton.center = self.view.center
        loginButton.readPermissions = ["public_profile", "email"] // 권한 요청
        self.view.addSubview(loginButton)
        
        FBSDKProfile.loadCurrentProfile { (profile, error) in
            guard let profile = profile else {
                print(error)
                return
            }
            
            print("\(profile.firstName) \(profile.lastName)")
        }
    }

}
