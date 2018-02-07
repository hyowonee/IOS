//
//  Post.swift
//  NetworkStudy
//
//  Created by Hyowon Choi on 2018. 2. 4..
//  Copyright © 2018년 Hyowon Choi. All rights reserved.
//

import Foundation
import ObjectMapper

class Post: Mappable {
    var userId: Int = 0
    var id: Int = 0
    var title: String = ""
    var body: String = ""
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        userId <- map["userId"]
        id <- map["id"]
        title <- map["title"]
        body <- map["body"]
    }
}
