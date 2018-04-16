//
//  AppDelegate.swift
//  GoogleMapSample
//
//  Created by Hyowon Choi on 2018. 4. 7..
//  Copyright © 2018년 Hyowon Choi. All rights reserved.
//

import UIKit
import GoogleMaps

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        GMSServices.provideAPIKey("AIzaSyCj4IsZft9QugV3RbnKlB1l9_FfMwyFvWY")
        return true
    }

}

