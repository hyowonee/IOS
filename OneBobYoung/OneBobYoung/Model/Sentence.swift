//
//  Sentence.swift
//  OneBobYoung
//
//  Created by Hyowon Choi on 2018. 2. 18..
//  Copyright © 2018년 Hyowon Choi. All rights reserved.
//

import Foundation
import ObjectMapper
import RealmSwift
import Realm

class Sentence: Object, Mappable {
    @objc dynamic var id: Int = 0
    @objc dynamic var english: String = ""
    @objc dynamic var korean: String = ""
    @objc dynamic var favorite: Bool = false
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
    func mapping(map: Map) {
        english <- map["english"]
        korean <- map["korean"]
    }
    
    func incrementID() -> Int {
        let realm = try! Realm()
        return (realm.objects(Sentence.self).max(ofProperty: "id") as Int? ?? 0) + 1
    }
    
    static func random() -> Sentence? {
        let realm = try! Realm()
        let sentences = realm.objects(Sentence.self)
        if sentences.count == 0 {
            return nil
        }
        let index = Int(arc4random_uniform(UInt32(sentences.count)))
        return sentences[index]
    }
}
