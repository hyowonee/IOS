//
//  ViewController.swift
//  thirdTodo
//
//  Created by NEXT on 2018. 1. 24..
//  Copyright © 2018년 NEXT. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var tableView: UITableView!
    
    var data: [[String]] = [[]]
//    var data2: [String] = ["쀼", "삡", "뺩"]
    var rotate: Int = 0
    var section: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.insertSections(IndexSet.init(integer: section), with: .right)
    }
    
    @IBAction func add() {
        switch rotate % 3 {
        case 0:
            data[section].append("쀼")
        case 1:
            data[section].append("삡")
        default:
            data[section].append("뺩")
        }
        
        tableView.insertRows(at: [IndexPath(row: rotate, section: section)], with: .right)
        rotate += 1
        
        if rotate == 3 {
            rotate = 0
            section += 1
            data.append([])
            tableView.insertSections(IndexSet.init(integer: section), with: .right)
        }
    }
    
    @IBAction func delete() {
        guard data.count > 0 else{
            return
        }
        data.remove(at: data.count - 1)
        tableView.deleteRows(at: [IndexPath(row: data.count, section : 0)], with: .right)
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return section + 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "todoCell") as! todoCell
        cell.label.text = "\(data[indexPath.section][indexPath.row])"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        data[indexPath.section].remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .fade)
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "섹션"
    }
}

