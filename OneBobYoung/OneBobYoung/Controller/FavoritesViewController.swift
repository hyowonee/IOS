//
//  FavoritesViewController.swift
//  OneBobYoung
//
//  Created by Hyowon Choi on 2018. 2. 18..
//  Copyright © 2018년 Hyowon Choi. All rights reserved.
//

import UIKit
import RealmSwift
import DZNEmptyDataSet

class FavoritesViewController: UIViewController {
    @IBOutlet var favoritesSentenceTableView: UITableView!
    
    var sentences: [Sentence] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let realm = try! Realm()
        self.sentences = Array(realm.objects(Sentence.self).filter("favorite = true"))
        
        self.favoritesSentenceTableView.emptyDataSetSource = self
        self.favoritesSentenceTableView.emptyDataSetDelegate = self
    }
}

extension FavoritesViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.sentences.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SentenceCell") as! SentenceCell
        cell.englishLabel.text = self.sentences[indexPath.row].english
        cell.koreanLabel.text = self.sentences[indexPath.row].korean
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80.0
    }
    
    func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        return "삭제"
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let realm = try! Realm()
            try! realm.write {
                sentences[indexPath.row].favorite = false
            }
            
            sentences.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
}

extension FavoritesViewController: DZNEmptyDataSetSource, DZNEmptyDataSetDelegate {
    func title(forEmptyDataSet scrollView: UIScrollView!) -> NSAttributedString! {
        let text = "즐겨찾기에 아무런 문장도 없어요!"
        let attributes = [
            NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 18.0),
            NSAttributedStringKey.foregroundColor: UIColor.darkGray,
        ]
        
        return NSAttributedString(string: text, attributes: attributes)
    }
    
    func description(forEmptyDataSet scrollView: UIScrollView!) -> NSAttributedString! {
        let text = "영문장 리스트에서 ★을 눌러\n즐겨찾기에 문장을 추가해보세요. :)"
        let attributes = [
            NSAttributedStringKey.font: UIFont.systemFont(ofSize: 18.0),
            NSAttributedStringKey.foregroundColor: UIColor.darkGray,
        ]
        
        return NSAttributedString(string: text, attributes: attributes)
    }
}
