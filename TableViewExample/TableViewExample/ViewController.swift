//
//  ViewController.swift
//  TableViewExample
//
//  Created by NEXT on 2018. 1. 13..
//  Copyright © 2018년 hyowon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // IBOutlet을 이용해서 Storyboard의 테이블 뷰와 소스코드의 tableView를 연결해줍니다.
    @IBOutlet var tableView: UITableView!
    
    var data: [Int] = []
    var count: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // Button의 터치 이벤트와 add() 메서드를 연결
    @IBAction func add() {
        count += 1
        data.append(count) // 데이터를 추가
        tableView.insertRows(at: [IndexPath(row: count-1, section: 0)], with: .right) // Cell을 IndexPath 위치에 추가합니다.
//        tableView.reloadData() // 편하지만 성능에 좋지 않습니다.
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    // 테이블 뷰의 섹션 수를 정의합니다. 여기서는 1개의 섹션만 이용합니다.
    func numberOfSections(in tableView: [.UITableView) -> Int {
        return 1
    }
    
    // 테이블 뷰의 섹션 내부의 Cell 수를 정의합니다. 여기서는 섹션 당 Cell이 data의 아이템 갯수 입니다.
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    // Cell의 모양을 정의합니다. 여기서는 CustomCell이라는 것을 연결하여 titleLabel을 꾸며줍니다.
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell") as! CustomCell // CustomCell을 재활용한 Cell을 가져옵니다.
        cell.titleLabel.text = "\(data[indexPath.row])" // titleLabel의 text를 정의
        return cell // cell을 return 해야합니다.
    }
}
