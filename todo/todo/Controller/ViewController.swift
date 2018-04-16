//
//  ViewController.swift
//  todo
//
//  Created by Hyowon Choi on 2018. 4. 4..
//  Copyright © 2018년 Hyowon Choi. All rights reserved.
//

import UIKit
import SCLAlertView

class ViewController: UIViewController {
    
    // MARK: Properties

    @IBOutlet var todoTableView: UITableView!
    var todoData: [String] = []
    
    // MARK: Events
    
    // 일정 추가하는 부분. SCLAlertView 라이브러리를 사용하였다.
    @IBAction func openAlert() {
        let alertView = SCLAlertView(appearance: SCLAlertView.SCLAppearance(
            showCloseButton: false
        ))
        let txt = alertView.addTextField("일정을 입력하세요 :)")
        alertView.addButton("추가") {
            self.todoData.append(txt.text!)
            self.todoTableView.insertRows(at: [IndexPath(row: self.todoData.count - 1, section: 0)], with: .right)
        }
        alertView.showEdit("일정 추가하기", subTitle: "")
    }
}

// MARK: - UITableViewDataSource, UITableViewDeleagte

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TodoCell") as? TodoCell else {
            return UITableViewCell()
        }
        cell.todoLabel.text = todoData[indexPath.row]
        return cell
    }
    
    // 스와이프로 일정 삭제하는 부분
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            todoData.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
}
