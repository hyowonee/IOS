//
//  AppDelegate.swift
//  RestaurantService
//
//  Created by Hyowon Choi on 2018. 4. 22..
//  Copyright © 2018년 Hyowon Choi. All rights reserved.
//

import UIKit
import GoogleMaps
import RealmSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        GMSServices.provideAPIKey("AIzaSyCj4IsZft9QugV3RbnKlB1l9_FfMwyFvWY")
        
        let hasLaunchedKey = "HasLaunched"
        let defaults = UserDefaults.standard
        if !defaults.bool(forKey: hasLaunchedKey) {
            if let path = Bundle.main.path(forResource: "data", ofType: "json") {
                do {
                    let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                    if let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves) as? [[String:Any]] {
                        
                        let realm = try! Realm()
                        for item in jsonResult {
                            if let sentence = Mapper<Sentence>().map(JSON: item) {
                                sentence.id = sentence.incrementID()
                                try! realm.write {
                                    realm.add(sentence)
                                }
                            }
                        }
                    }
                } catch {
                }
            }
            
            defaults.set(true, forKey: hasLaunchedKey)
        }
        
        return true
    }
    
}

