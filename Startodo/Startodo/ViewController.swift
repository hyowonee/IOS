//
//  ViewController.swift
//  Startodo
//
//  Created by NEXT on 2018. 1. 21..
//  Copyright © 2018년 hyowon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var todoTableView: UITableView!
    
    var data: [String] = ["안녕!", "안녕?", "안녕하세요", "안녕하십니까"]

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension ViewCo duntroller: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodoCell") as! TodoCell
        cell.label.text = data[indexPath.row]
        return cell
    }
}
