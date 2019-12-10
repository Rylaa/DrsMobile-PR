//
//  MainQuestionTests.swift
//  DrsMobileTests
//
//  Created by yusuf demirkoparan on 21.11.2019.
//  Copyright © 2019 yusuf demirkoparan. All rights reserved.
//

import XCTest
@testable import DrsMobile

class MainQuestionTests: XCTestCase {
    
    private var mockView: MainQuestionOutputs!
    private var viewModel: MainQuestionVMDelegate?
    private var network: NetworkManager?
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        mockView = MainQuestionOutputs()
        network = NetworkManager()
        viewModel = MainQuestionViewModel(network: network!)
        viewModel?.delegate = mockView
        
    }
    
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        let q00 = QuestionDetail(questionId: 0, text: "Soru")
        let q01 = QuestionDetail(questionId: 0, text: "Soru")
        let q02 = QuestionDetail(questionId: 0, text: "Soru")
        let q03 = QuestionDetail(questionId: 0, text: "Soru")
        let q04 = QuestionDetail(questionId: 0, text: "Soru")
        let q05 = QuestionDetail(questionId: 0, text: "Soru")
        let q06 = QuestionDetail(questionId: 0, text: "Soru")
        let q07 = QuestionDetail(questionId: 0, text: "Soru")
        let q08 = QuestionDetail(questionId: 0, text: "Soru")
        
        var itIsWork = false
        let questionData: [QuestionDetail] = [q00, q01, q02, q03, q04, q05, q06, q07, q08]
        let populate = questionData.map({ QuestionPresentation(service: $0) })
        
        if populate.count > 7 {
            itIsWork = true
            
        }
        XCTAssertTrue(itIsWork)
        
        viewModel?.fetchQuestion()
        
        var canFecth = false
        if (mockView.vmOutputs[0] != nil) {
            canFecth = true
            
        }
        XCTAssertTrue(canFecth)
        
    }
}

/// view model outputs
private class MainQuestionOutputs: MainQuestionVMOutputDelegate {
    var vmOutputs: [MainQuestionVMOutputs] = []
    func handleViewModelOutputs(_ outputs: MainQuestionVMOutputs) {
        vmOutputs.append(outputs)
        
    }
}
