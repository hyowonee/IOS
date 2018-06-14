//
//  Post.swift
//  TDDExample
//
//  Created by Hyowon Choi on 2018. 5. 12..
//  Copyright © 2018년 Hyowon Choi. All rights reserved.
//

import ObjectMapper

struct Post: Mappable {
    var userId: Int = 0
    var id: Int = 0
    var title: String = ""
    var body: String = ""
    
    init?(map: Map) {}
    
    mutating func mapping(map: Map) {
        self.userId     <- map["userId"]
        self.id         <- map["id"]
        self.title      <- map["title"]
        self.body       <- map["body"]
    }
}
