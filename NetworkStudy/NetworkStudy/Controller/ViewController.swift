//
//  ViewController.swift
//  NetworkStudy
//
//  Created by Hyowon Choi on 2018. 2. 4..
//  Copyright © 2018년 Hyowon Choi. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireObjectMapper

// 궁금한점: UIViewController에서 @IBOutlet var postTableView: UITableView!로 테이블뷰 선언하고
// loadPost() 실행되면서 data 받아와서 posts안에 넣어줌. 통신으로 받아온 post값의 데이터를 내가 만든 [Post]타입 변수인 posts에 대입해주고 리로드해서 뷰에 적용
// 테이블 뷰의 프로토콜 메소드들이 실행되고 거기서 perform 메소드 실행됨 -> prepare 함수 실행됨 -> sender 파라미터로 받아와서 switch문으로 식별자에 따라 기능 구별해줌 -> DetailViewController에서 만든 postId 변수에 넣어준다. 편하게 하기 위해 detqilViewController을 만든것임. 
class ViewController: UIViewController {
    @IBOutlet var postTableView: UITableView!

    var posts: [Post] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadPosts()
    }
    
    func loadPosts() {
        Alamofire.request("https://jsonplaceholder.typicode.com/posts")
            .responseArray { (response: DataResponse<[Post]>) in
                if let posts = response.result.value {
                    self.posts = posts
                    self.postTableView.reloadData()
                }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "DetailSegue"?:
            let detailViewController = segue.destination as! DetailViewController
            detailViewController.postId = sender as! Int
        default:
            print("Error")
        }
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let postCell = tableView.dequeueReusableCell(withIdentifier: "PostCell") as! PostCell
        postCell.titleLabel.text = self.posts[indexPath.row].title
        return postCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let post = self.posts[indexPath.row]
        self.performSegue(withIdentifier: "DetailSegue", sender: post.id)
    }
}
