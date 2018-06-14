//
//  BaseViewController.swift
//  TDDExample
//
//  Created by Hyowon Choi on 2018. 5. 12..
//  Copyright © 2018년 Hyowon Choi. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    
    // MARK: Initializing
    
    init(title: String) {
        super.init(nibName: nil, bundle: nil)
        self.title = title
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Life Cycles

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}
