//
//  ViewController.swift
//  practice
//
//  Created by Hyowon Choi on 2018. 4. 4..
//  Copyright © 2018년 Hyowon Choi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let currentKey = "current"
    let didSave = UserDefaults.standard.synchronize()
    override func viewDidLoad() {
        super.viewDidLoad()
        // writing
        UserDefaults.standard.set(1, forKey: "key")
        // reading
        if UserDefaults.standard.object(forKey: "key") == nil {
            //  Doesn't exist
        } else {
            _ = UserDefaults.standard.integer(forKey: "key")
        }
    }
}

