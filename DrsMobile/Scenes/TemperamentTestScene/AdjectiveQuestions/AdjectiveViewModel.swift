//
//  AdjectiveViewModel.swift
//  DrsMobile
//
//  Created by yusuf demirkoparan on 20.11.2019.
//  Copyright © 2019 yusuf demirkoparan. All rights reserved.
//

import Foundation

protocol AdjectiveVMDelegate: AnyObject {
    var delegate: AdjectiveVMOutputsDelegate? { get set }
    func fetchQuestion()
    
}

protocol AdjectiveVMOutputsDelegate: AnyObject {
    func handleViewModelOutputs(_ outputs: AdjectiveVMOutputs)
    
}

enum AdjectiveVMOutputs {
    
}

final class AdjectiveViewModel: AdjectiveVMDelegate {
    /// Properties
    weak var delegate: AdjectiveVMOutputsDelegate?
    /// Init
    init() {
        
    }
    
    func fetchQuestion() {
        
    }
    
}
