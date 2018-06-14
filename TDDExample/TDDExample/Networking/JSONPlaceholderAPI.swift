//
//  JSONPlaceholderAPI.swift
//  TDDExample
//
//  Created by Hyowon Choi on 2018. 5. 12..
//  Copyright © 2018년 Hyowon Choi. All rights reserved.
//

import Moya

enum JSONPlaceholderAPI {
    case posts
    case users
}

extension JSONPlaceholderAPI: TargetType {
    var baseURL: URL {
        // baseURL은 API Endpoint를 의미한다.
        return URL(string: "https://jsonplaceholder.typicode.com")!
    }
    
    var path: String {
        // path는 API 메서드를 정한다.
        switch self { // switch를 통해 각 enum case마다 path를 정해줄 수 있다.
        case .posts:
            return "/posts"
        case .users:
            return "/users"
        }
    }
    
    var method: Moya.Method {
        // 각 enum case마다 method를 정해 줄 수 있다.
        // 여기서는 전부 GET을 쓰기 때문에 .get으로 지정
        return .get
    }
    
    var sampleData: Data {
        // 샘플 데이터를 정해 줄 수 있다.
        // 여기서는 딱히 안씀
        return Data()
    }
    
    var task: Task {
        // 리퀘스트의 형태를 정할 수 있다.
        // 여기서 파라메터를 넣을 수 있다.
        return .requestPlain
    }
    
    var headers: [String : String]? {
        // 리퀘스트 헤더를 정할 수 있다.
        // 여기서는 쓰이지 않아서 빈값으로 넣었다.
        return nil
    }
}
