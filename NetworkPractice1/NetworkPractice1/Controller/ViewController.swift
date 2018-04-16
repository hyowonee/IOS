//
//  ViewController.swift
//  NetworkPractice1
//
//  Created by Hyowon Choi on 2018. 2. 7..
//  Copyright © 2018년 Hyowon Choi. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireObjectMapper

class ViewController: UIViewController {
    @IBOutlet var postTableView: UITableView!
    var posts: [Post] = []
    let URL = "https://jsonplaceholder.typicode.com/posts"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadPostData()
    }
    
    func loadPostData() {
        Alamofire.request(URL).responseArray {(response: DataResponse<[Post]>) in
            if let posts = response.result.value {
                print("나는 뷰컨트롤러다")
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
        let postCell = tableView.dequeueReusableCell(withIdentifier: "postCell") as! postCell!
        postCell?.titleLabel.text = self.posts[indexPath.row].title
        return postCell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let posts = self.posts[indexPath.row]
        self.performSegue(withIdentifier: "DetailSegue", sender: posts.id)
    }
    
}
