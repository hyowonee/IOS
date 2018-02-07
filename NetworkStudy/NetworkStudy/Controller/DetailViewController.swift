//
//  DetailViewController.swift
//  NetworkStudy
//
//  Created by Hyowon Choi on 2018. 2. 4..
//  Copyright © 2018년 Hyowon Choi. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireObjectMapper
import NVActivityIndicatorView

class DetailViewController: UIViewController {
    @IBOutlet var postTextView: UITextView!
    
    var postId: Int!
    var loadingView: NVActivityIndicatorView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.loadingView = NVActivityIndicatorView(
            frame: CGRect(
                origin: CGPoint(x: view.center.x - 50, y: view.center.y - 50),
                size: CGSize(width: 100, height: 100)
            ),
            type: .ballPulseSync,
            color: UIColor.black,
            padding: 0
        )
        self.view.addSubview(self.loadingView)
    
        loadPost()
    }
    
    func loadPost() {
        guard let id = self.postId else { return }
        
        self.loadingView.startAnimating()
        
        Alamofire.request("https://jsonplaceholder.typicode.com/posts/\(id)")
            .responseObject { (response: DataResponse<Post>) in
                if let post = response.result.value {
                    self.postTextView.text = post.body
                    self.navigationItem.title = post.title
                    
                    self.loadingView.stopAnimating()
                }
            }
    }
}
