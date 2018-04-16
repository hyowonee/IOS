//
//  DetailViewController.swift
//  NetworkPractice1
//
//  Created by Hyowon Choi on 2018. 2. 7..
//  Copyright © 2018년 Hyowon Choi. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireObjectMapper

class DetailViewController: UIViewController {
    @IBOutlet var postTextView: UITextView!
    var postId: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadPost()
    }
    
    func loadPost() {
        guard let postId = self.postId else { return }
        Alamofire.request("https://jsonplaceholder.typicode.com/posts/\(postId)")
            .responseObject { (response: DataResponse<Post>) in
                if let post = response.result.value {
                    print("나는 디테일뷰컨트롤러다")
                    self.postTextView.text = post.body
                    self.navigationItem.title = post.title
                }
        }
    }
}
