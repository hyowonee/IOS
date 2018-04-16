//
//  ViewController.swift
//  OneBobYoung
//
//  Created by Hyowon Choi on 2018. 2. 18..
//  Copyright © 2018년 Hyowon Choi. All rights reserved.
//

import UIKit
import RealmSwift

class SentenceListViewController: UIViewController {
    @IBOutlet var sentenceTableView: UITableView!
    @IBOutlet var testButton: UIButton!
    
    var sentences: [Sentence] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target :nil, action: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let realm = try! Realm()
        self.sentences = Array(realm.objects(Sentence.self))
        self.sentenceTableView.reloadData()
    }
}

extension SentenceListViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.sentences.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SentenceCell") as! SentenceCell
        cell.id = self.sentences[indexPath.row].id
        cell.englishLabel.text = self.sentences[indexPath.row].english
        cell.koreanLabel.text = self.sentences[indexPath.row].korean
        
        if self.sentences[indexPath.row].favorite == true {
            cell.favoriteButton.select()
        } else {
            cell.favoriteButton.deselect()
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        return
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let englishLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        englishLabel.text = self.sentences[indexPath.row].english
        englishLabel.font = UIFont.boldSystemFont(ofSize: 17)
        englishLabel.numberOfLines = 0
        englishLabel.frame.size.width = UIScreen.main.bounds.size.width - 85
        englishLabel.sizeToFit()
        
        let koreanLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        koreanLabel.text = self.sentences[indexPath.row].korean
        koreanLabel.font = UIFont.systemFont(ofSize: 17)
        koreanLabel.numberOfLines = 0
        koreanLabel.frame.size.width = UIScreen.main.bounds.size.width - 85
        koreanLabel.sizeToFit()
        
        return englishLabel.frame.size.height + koreanLabel.frame.size.height + 40
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
}
