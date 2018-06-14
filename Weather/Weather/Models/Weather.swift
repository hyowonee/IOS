//
//  Weather.swift
//  Weather
//
//  Created by Hyowon Choi on 2018. 5. 5..
//  Copyright © 2018년 Hyowon Choi. All rights reserved.
//

import ObjectMapper

class Weather: Mappable {
    var name: String = ""
    var main: Main? = nil
    
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        self.name <- map["name"]
        self.main <- map["main"]
    }
}
