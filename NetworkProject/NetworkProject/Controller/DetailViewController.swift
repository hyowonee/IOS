//
//  DetailViewController.swift
//  NetworkProject
//
//  Created by Hyowon Choi on 2018. 2. 15..
//  Copyright © 2018년 Hyowon Choi. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireObjectMapper
import SVProgressHUD

class DetailViewController: UIViewController {
    @IBOutlet var detailTextView: UITextView!
    var postId: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadPost()
    }

    func loadPost() {
        SVProgressHUD.show()
        guard let id = postId else { return }
        Alamofire.request("https://jsonplaceholder.typicode.com/posts/\(id)").responseObject { (response: DataResponse<Post>) in
            if let post = response.result.value {
                self.detailTextView.text = post.body
                self.navigationItem.title = post.title
                SVProgressHUD.dismiss()
            }
        }
    }
}
