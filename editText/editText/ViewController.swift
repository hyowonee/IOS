//
//  ViewController.swift
//  editText
//
//  Created by NEXT on 2018. 2. 1..
//  Copyright © 2018년 NEXT. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var label: UILabel!
    @IBOutlet var editText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func changeText() {
        label.text = editText.text
    }
}

