//
//  Main.swift
//  Weather
//
//  Created by Hyowon Choi on 2018. 5. 5..
//  Copyright © 2018년 Hyowon Choi. All rights reserved.
//

import ObjectMapper

class Main: Mappable {
    var temp: Double = 0.0
    
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        self.temp <- map["temp"]
    }
}
