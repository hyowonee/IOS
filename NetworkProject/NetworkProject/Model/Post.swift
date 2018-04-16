//
//  Post.swift
//  NetworkProject
//
//  Created by Hyowon Choi on 2018. 2. 15..
//  Copyright © 2018년 Hyowon Choi. All rights reserved.
//

import Foundation
import ObjectMapper
import AlamofireObjectMapper

class Post: Mappable {
    var userId: Int!
    var id: Int!
    var title: String!
    var body: String!
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        userId <- map["userId"]
        id <- map["id"]
        title <- map["title"]
        body <- map["body"]
    }
}


