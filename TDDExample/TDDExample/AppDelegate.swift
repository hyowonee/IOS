//
//  AppDelegate.swift
//  TDDExample
//
//  Created by Hyowon Choi on 2018. 5. 12..
//  Copyright © 2018년 Hyowon Choi. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        self.window = UIWindow()
        
        let navigationController = UINavigationController(rootViewController: PostListViewController(title: "Posts")).then {
            $0.view.backgroundColor = .white
            $0.navigationBar.barTintColor = .white
        }
        self.window?.rootViewController = navigationController
        self.window?.makeKeyAndVisible()
        
        
        return true
    }

}

