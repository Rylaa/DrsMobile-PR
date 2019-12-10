//
//
//  LoginTest.swift
//  DrsMobileTests
//
//  Created by yusuf demirkoparan on 22.10.2019.
//  Copyright © 2019 yusuf demirkoparan. All rights reserved.
//

import Foundation
import XCTest

@testable import DrsMobile
class LoginTest: XCTestCase {
    func testLogin() {
        let mock = MockManager()
        var status = String()
        var code = Int()
        let exception = self.expectation(description: "Start test")
        
        mock.defaultLoginPageConfigurer(userName: "test", password: "test") { (response) in
            switch response {
            case .failure(let error):
                XCTFail(error.localizedDescription)
                
            case .success(let data):
                status = data.status
                code = data.statusCode
                exception.fulfill()
            }
        }
        waitForExpectations(timeout: 1, handler: nil)
        XCTAssertEqual(status, "success")
        XCTAssertEqual(code, 200)
//        XCTAssertEqual(email, "yonetici@mizactemelliegitim.com")
    }
}
/*
 yonetici@mizactemelliegitim.com
 12345
 */
