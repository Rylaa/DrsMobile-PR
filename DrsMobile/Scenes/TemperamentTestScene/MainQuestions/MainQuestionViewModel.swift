//
//  MainQuestionViewModel.swift
//  DrsMobile
//
//  Created by yusuf demirkoparan on 13.11.2019.
//  Copyright © 2019 yusuf demirkoparan. All rights reserved.
//

import Foundation
/// view model
protocol MainQuestionVMDelegate: AnyObject {
    var delegate: MainQuestionVMOutputDelegate? { get set }
    func fetchQuestion()
    func sendAnswers(_ answerData: [QuestionPresentation])
    
}

/// view outputs
protocol MainQuestionVMOutputDelegate: AnyObject {
    func handleViewModelOutputs(_ outputs: MainQuestionVMOutputs)
    
}
/// outputs cases
enum MainQuestionVMOutputs {
    case error
    case questionList([QuestionPresentation])
    
}

final class MainQuestionViewModel: MainQuestionVMDelegate {
    /// properties
    weak var delegate: MainQuestionVMOutputDelegate?
    let network: NetworkManager
    let mockData = MockManager()
    var questionData: [QuestionPresentation] = []
    
    init(network: NetworkManager) {
        self.network = network
        
    }
    
    func fetchQuestion() {
        // todo
        mockData.fetchTemperamentTestQuestions(userId: "test", token: "test") { [weak self] (response) in
            guard let self = self else { return }
            switch response {
            case .failure(let error):
                print(error)
                
            case .success(let data):
                let dataToPresentation = data.data.questions.map({ QuestionPresentation(service: $0)})
                let result = self.populateRowId(data: dataToPresentation)
                if let strongResult = result {
                    self.notify(.questionList(strongResult))
                }
                
            }
        }
        
    }
    
    fileprivate func questionToQuestionPresentation(data: Question) -> [QuestionPresentation]? {
        let result = data.data.questions.map({ QuestionPresentation(service: $0) })
        return result
        
    }
    
    func sendAnswers(_ answerData: [QuestionPresentation]) {
        // todo
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted
        
        let data = try? encoder.encode(answerData)
        let jsonData = try? JSONSerialization.jsonObject(with: data!, options: [])
        
        let mockData = MockManager()
        mockData.sendTestAnswer(userId: "test", token: "test", userAnswers: jsonData) { (response) in
            switch response {
            case .failure(let error):
                print(error)
                
            case .success(let data):
                print(data)
                // todo
                
            }
        }
        
    }
    /// I need row id because i want to avoid the repeat score
    fileprivate func populateRowId(data: [QuestionPresentation]) -> [QuestionPresentation]? {
        var questionData = data
        for index in 0...questionData.count-1 {
            questionData[index].rowId = index
            
        }
        return questionData
    }
    
    /// view model outputs for view
    fileprivate func notify(_ outputs: MainQuestionVMOutputs) {
        delegate?.handleViewModelOutputs(outputs)
        
    }
    
}
