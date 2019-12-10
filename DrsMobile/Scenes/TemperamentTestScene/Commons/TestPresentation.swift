//
//  TestPresentation.swift
//  DrsMobile
//
//  Created by yusuf demirkoparan on 12.11.2019.
//  Copyright © 2019 yusuf demirkoparan. All rights reserved.
//

import Foundation
/*
 When i fetch question or send user answer populate this struct
 */
struct QuestionPresentation: Codable {
    var questionId: Int
    var text: String
    var score: Int?
    var rowId: Int?
    
}

extension QuestionPresentation {
    init(service: QuestionDetail) {
        self.questionId = service.questionId
        self.text = service.text
        self.score = 0
        self.rowId = nil
        
    }
}
