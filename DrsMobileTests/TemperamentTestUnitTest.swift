//
//  TemperamentTestUnitTest.swift
//  DrsMobileTests
//
//  Created by yusuf demirkoparan on 12.11.2019.
//  Copyright © 2019 yusuf demirkoparan. All rights reserved.
//

import Foundation
import XCTest

@testable import DrsMobile
class TemperamentTestUnitTest: XCTestCase {
    func testQuestion() {
        let mockData = MockManager()
        var questList: Question!
        let exception = self.expectation(description: "question data")
        
        mockData.fetchTemperamentTestQuestions(userId: "yonetici@mizactemelliegitim.com", token: "ASD2542B65DER2423423423") { (response) in
            switch response {
            case .success(let questionData):
                questList = questionData
                exception.fulfill()
                
            case .failure(let error):
                XCTFail("ERROR3###")
            }
        }
        
        waitForExpectations(timeout: 1, handler: nil)
        XCTAssertEqual(questList?.statusCode, 200)
        XCTAssertEqual(questList?.data.survey, "4dd53229-dc38-4c3e-a4bc-3281a1db8cd6")
        XCTAssertEqual(questList.data.questions.count, 9)
        
    }

}
