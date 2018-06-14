//
//  PostTests.swift
//  TDDExampleTests
//
//  Created by Hyowon Choi on 2018. 5. 12..
//  Copyright © 2018년 Hyowon Choi. All rights reserved.
//

import XCTest
@testable import TDDExample

import Alamofire
import AlamofireObjectMapper
import ObjectMapper

// TDD: Test Driven Development
// 테스트는 곧 개발자에게 문서가 될 수 있음
// 테스트는 로직의 신뢰성에 도움이 됨
class PostTests: XCTestCase {
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testJsonMapping() { // 테스트할 메서드는 항상 맨앞에 'test'라는 이름이 붙어야함
        let post = Post(JSONString: "{\"userId\": 1, \"id\": 1, \"title\": \"title\", \"body\": \"body\"}")
        XCTAssertEqual(post?.userId, 1) //  값이 일치하는지 테스트하는 메서드
        XCTAssertEqual(post?.id, 1)
        XCTAssertEqual(post?.title, "title")
        XCTAssertEqual(post?.body, "body")
    }
    
    func testJsonPerformance() {
        let expectationTest = XCTestExpectation(description: "Get Post data")
        
        Alamofire.request("https://jsonplaceholder.typicode.com/posts")
            .responseArray(completionHandler: { (posts: DataResponse<[Post]>) in
                expectationTest.fulfill() // 성공하면 fulfill 메서드 실행
            })
        
        self.wait(for: [expectationTest], timeout: 1.0) // 1초안에 response가 안오면 에러로 처리
    }
    
}
