//
//  ViewController.swift
//  firstTodo
//
//  Created by NEXT on 2018. 1. 23..
//  Copyright © 2018년 NEXT. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var todoTableView: UITableView!
    
    var data: [String] = ["쀼", "뺩", "삡"]
    var count: Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBAction func add() {
        count += 1
        data.append("\(count)")
        todoTableView.insertRows(at: [IndexPath(row: count+2, section: 0)], with: .right)
    }
    
    @IBAction func delete() {
        data.popLast()
        todoTableView.deleteRows(at: [IndexPath(row: count+2, section: 0)], with: .right)
        count -= 1
    }

}

extension ViewController: UITableViewDataSource, UITabBarDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = todoTableView.dequeueReusableCell(withIdentifier: "todoCell") as! todoCell
        cell.button.setTitle("\(data[indexPath.row])", for: .normal)
        return cell
    }
}
