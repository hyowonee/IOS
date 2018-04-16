//
//  ViewController.swift
//  NetworkPractice2
//
//  Created by Hyowon Choi on 2018. 2. 10..
//  Copyright © 2018년 Hyowon Choi. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireObjectMapper

class ViewController: UIViewController {
    @IBOutlet var postTableView: UITableView!
    var posts: [Post] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadPost()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func loadPost() {
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
        case "BodySegue"?:
                let bodyViewController = segue.destination as! BodyViewController
                bodyViewController.postId = sender as! Int
        default:
            print("Error")
        }
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let postCell = tableView.dequeueReusableCell(withIdentifier: "postCell") as! postCell
        postCell.postTitleLabel.text = self.posts[indexPath.row].title
        return postCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let post = self.posts[indexPath.row]
        self.performSegue(withIdentifier: "BodySegue", sender: post.id)
    }
}

