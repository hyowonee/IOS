//
//  AppDelegate.swift
//  LoginPageWithoutStoryboard
//
//  Created by Hyowon Choi on 2018. 4. 24..
//  Copyright © 2018년 Hyowon Choi. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        let viewController = ViewController()
        let navigationController = UINavigationController(rootViewController: viewController)
        
        window!.backgroundColor = .white
        window!.rootViewController = navigationController
        window!.makeKeyAndVisible()
        
        return true
    }

}

