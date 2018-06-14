//
//  ViewController.swift
//  TDDExample
//
//  Created by Hyowon Choi on 2018. 5. 12..
//  Copyright © 2018년 Hyowon Choi. All rights reserved.
//

import UIKit
import Then
import SnapKit
import RxSwift
import RxCocoa
import Moya
import ObjectMapper

class PostListViewController: BaseViewController {
    
    // MARK: Properties
    let disposeBag = DisposeBag()
    let tableView = UITableView().then {
        $0.backgroundColor = .white
    }
    
    // MARK: Life Cycles

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // PostCell라는 이름으로 ReuseIdentifier를 정의해줌
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "PostCell")
        
        self.view.addSubview(self.tableView) // 테이블 뷰를 추가해줌
        self.setupConstraint() // 뷰의 위치를 정해줌
        self.fetchPosts() // 네트워크 호출
    }
    
    // MARK: Setup UI Constraint
    
    func setupConstraint() {
        self.tableView.snp.makeConstraints {
            $0.top.right.bottom.left.equalToSuperview()
        }
    }
    
    // MARK: API 호출
    
    func fetchPosts() {
        let provider = MoyaProvider<JSONPlaceholderAPI>() // MoyaProvider를 이용하여 API 호출 provider를 만들어줌
        provider.rx.request(.posts) // Post 리스트를 가져오는 API를 호출
            // ObjectMapper를 이용하여 json string을 Post 객체 리스트로 변환해줌
            // response된 데이터를 string으로 변환해주고, 그 JsonString을 array형태의 객체로 만들어준다.
            .map { return Mapper<Post>().mapArray(JSONString: try! $0.mapString())! }
            // Observable 타입으로 변환
            .asObservable()
            // tableView에 bind해준다.
            // tableView.rx.items는 파라메터로 cellFactory라는 것을 받는다.
            // cellFactory는 정의된걸 보면 (UITableView, Int, S.Iterator.Element)이렇게 생겼다.
            // S.Iterator.Element는 각각의 Observable 객체이다.
            // ObservableType -> Observable<String>, Observable<Int>, Observable<Post> 등등 모두 될 수 있다.
            // 따라서 items 메서드 내의 index는 int형, post는 내가 Post형으로 설정하였다.
            // 그래서 결론적으로 .rx.items 메서드를 사용할 떄는 (UITableView, Int, S.Iterator.Element)타입의 클로저를 받는다.
            // items 메서드가 이렇게 만든 Observer 객체를 리턴해주면 .bind에서 observer를 받아서 바로 subscribe를 해준다.
            .bind(to: self.tableView.rx.items(cellIdentifier: "PostCell")) {
                (index, post: Post, cell: UITableViewCell) in
                cell.textLabel?.text = post.title
            }.disposed(by: self.disposeBag)
    }
}
