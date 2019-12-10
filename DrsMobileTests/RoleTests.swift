//
//  RoleTests.swift
//  DrsMobileTests
//
//  Created by yusuf demirkoparan on 28.10.2019.
//  Copyright © 2019 yusuf demirkoparan. All rights reserved.
//

import Foundation
import XCTest

@testable import DrsMobile
class RoleTests: XCTestCase {
    func testLogin() {
        
        let mock = MockManager()
        let exception = self.expectation(description: "Start test")
        var roleData: Role?
        
        mock.defaultLoginPageConfigurer(userName: "test", password: "test") { (response) in
            switch response {
            case .failure(let error):
                print(error)
                
            case .success(let data):
                roleData = Role(data: data.data.roles.first!)
                exception.fulfill()
                
            }
        }
        
        waitForExpectations(timeout: 1, handler: nil)
        XCTAssertEqual(roleData?.schoolName, "Mizmer")
        XCTAssertEqual(roleData?.name, "Yönetici")
        XCTAssertEqual(roleData?.slug, "manager")
    }
}
