//
//  TemperamentTest.swift
//  DrsMobileTests
//
//  Created by yusuf demirkoparan on 20.11.2019.
//  Copyright © 2019 yusuf demirkoparan. All rights reserved.
//

import XCTest

@testable import DrsMobile
class TemperamentTest: XCTestCase {
    /// Integration test
    func test() {
        let mock = MockManager()
             var questData: Question?
             let exception = self.expectation(description: "integration test")
             
             mock.sendTestAnswer(userId: "test", token: "test", userAnswers: "nil") { (response) in
                 switch response {
                 case .failure(let error):
                     XCTFail(error.localizedDescription)
                     
                 case .success(let data):
                     questData = data
                     exception.fulfill()
                     
                 }
             }
             waitForExpectations(timeout: 1, handler: nil)
             XCTAssertEqual(questData?.status, "success")
             XCTAssertEqual(questData?.data.page, "extension")
    }

}
