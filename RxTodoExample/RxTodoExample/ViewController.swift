//
//  ViewController.swift
//  RxTodoExample
//
//  Created by Hyowon Choi on 2018. 5. 5..
//  Copyright © 2018년 Hyowon Choi. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {
    
    // MARK: Properties
    
    @IBOutlet var todoTextField: UITextField!
    @IBOutlet var addButton: UIButton!
    @IBOutlet var tableView: UITableView!
    
    var todos = [String]()
    var todosRelay = BehaviorRelay(value: [String]())
    
    let disposeBag = DisposeBag()
    
    // MARK: Life Cycles

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // RxSwift란?
        // Reactive Programming이라는 프로그래밍 패러다임을 라이브러리로 구현한 오픈 소스
        // RxSwift는 ReactiveX라는 MS에서 만든 개념을 라이브러리로써 만들었다.
        // 자매품으로 RxJava, RxKotlin, RxRuby 등 다양한 Rx구현체가 있다
        // Reactive Programming이란 반응형 프로그래밍이라는 뜻으로, 어떠한 변화가 있을 경우 그것을 감지하여 이벤트를 발생시켜주는 프로그래밍 방법을 말한다.
        
        // 코드에서 CellReuseIdentifier를 적용해줬다
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "TodoCell")
        
        // Rx에 관련된 초기화를 해줬다
        self.bindToRx()
    }
    
    // MARK: Rx
    
    func bindToRx() {
        // 만약 addButton을 클릭했을 경우
        self.addButton.rx.tap.subscribe(onNext: {
            // 텍스트 필드가 비어있으면 아무일 없도록
            guard self.todoTextField.text?.isEmpty == false else {
                return
            }
            
            self.todos.append(self.todoTextField.text!) // todos에 데이터 추가
            self.todosRelay.accept(self.todos) // 변화를 감지하기 위해 BehaviorRelay에 todos를 accept해줌
            self.todoTextField.text = "" // 텍스트 필드를 비워줌
        }).disposed(by: self.disposeBag)
        
        // todos 데이터에 변화가 생겼을 경우
        self.todosRelay
            .bind(to: self.tableView.rx.items(cellIdentifier: "TodoCell")) { // tableView에 바인드
                (index, todo: String, cell: UITableViewCell) in
                cell.textLabel?.text = todo // textLabel 적용
            }.disposed(by: self.disposeBag)
    }
    
}
