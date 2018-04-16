//
//  BodyViewController.swift
//  NetworkPractice2
//
//  Created by Hyowon Choi on 2018. 2. 13..
//  Copyright © 2018년 Hyowon Choi. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireObjectMapper

class BodyViewController: UIViewController {
    @IBOutlet var bodyTextView: UITextView!
    var postId: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadPost()
        // Do any additional setup after loading the view.
    }
    
    func loadPost() {
        guard let id = self.postId else { return }
        Alamofire.request("https://jsonplaceholder.typicode.com/posts/\(id)")
            .responseObject { (response: DataResponse<Post>) in
                if let post = response.result.value {
                    self.bodyTextView.text = post.body
                }
        }
    }
}
