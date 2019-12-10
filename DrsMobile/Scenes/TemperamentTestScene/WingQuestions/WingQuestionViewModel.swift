//
//  WingQuestionViewModel.swift
//  DrsMobile
//
//  Created by yusuf demirkoparan on 19.11.2019.
//  Copyright © 2019 yusuf demirkoparan. All rights reserved.
//

import Foundation

protocol WingQuestionVMDelegate: AnyObject {
    var delegate: WingQuestionVMOutputsDelegate? { get set }
    func fetchQuestion()
    
}

protocol WingQuestionVMOutputsDelegate: AnyObject {
    func handleViewModelOutputs(_ outputs: WingQuestionVMOutputs)
    
}

enum WingQuestionVMOutputs {
    
}

final class WingQuestionViewModel: WingQuestionVMDelegate {
    /// Properties
    weak var delegate: WingQuestionVMOutputsDelegate?
  
    /// Init
    init() {
        
    }
    
    func fetchQuestion() {
        
    }
    
}
