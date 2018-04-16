//
//  SentenceCell.swift
//  OneBobYoung
//
//  Created by Hyowon Choi on 2018. 2. 18..
//  Copyright © 2018년 Hyowon Choi. All rights reserved.
//

import UIKit
import DOFavoriteButton
import RealmSwift

class SentenceCell: UITableViewCell {
    @IBOutlet var englishLabel: UILabel!
    @IBOutlet var koreanLabel: UILabel!
    @IBOutlet var favoriteButton: DOFavoriteButton!
    
    var id: Int = 0

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func doFavorite(sender: DOFavoriteButton) {
        let realm = try! Realm()
        let sentence = realm.objects(Sentence.self).filter("id == \(id)").first
        if sender.isSelected {
            sender.deselect()
            try! realm.write {
                sentence?.favorite = false
            }
        } else {
            sender.select()
            try! realm.write {
                sentence?.favorite = true
            }
        }
    }
}
