//
//  ClassIntegrationTest.swift
//  DrsMobileTests
//
//  Created by yusuf demirkoparan on 27.11.2019.
//  Copyright © 2019 yusuf demirkoparan. All rights reserved.
//

import XCTest

@testable import DrsMobile
class ClassIntegrationTest: XCTestCase {
    func test() {
        let mock = MockManager()
        var case0 = ""
        var case1 = ""
        let exception = self.expectation(description: "Class Integration")
        
        mock.fetchClassList(roleID: "test", token: "test") { (response) in
            switch response {
            case .failure(let error):
                XCTFail(error.localizedDescription)
                
            case .success(let data):
                case0 = data.status
                case1 = data.data[0].name
                exception.fulfill()
            }
        }
        
        waitForExpectations(timeout: 3, handler: nil)
        XCTAssertEqual(case0, "success")
        XCTAssertEqual(case1, "Papatya")
    }
}
