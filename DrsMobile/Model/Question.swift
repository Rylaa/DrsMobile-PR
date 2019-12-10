//
//  Question.swift
//  DrsMobile
//
//  Created by yusuf demirkoparan on 12.11.2019.
//  Copyright © 2019 yusuf demirkoparan. All rights reserved.
//

import Foundation

struct Question: Codable {
    let status: String
    let statusCode: Int
    let data: QuestionData

    enum CodingKeys: String, CodingKey {
        case status
        case statusCode = "status_code"
        case data
    }
}

// MARK: - DataClass
struct QuestionData: Codable {
    let page: String
    let type: Int
    let survey: String
    let questions: [QuestionDetail]
}

// MARK: - Question
struct QuestionDetail: Codable {
    let questionId: Int
    let text: String
    
    enum CodingKeys: String, CodingKey {
        case questionId = "id"
        case text
        
    }
}
