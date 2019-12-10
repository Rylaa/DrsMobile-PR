//
//  MainOrientationViewModel.swift
//  DrsMobile
//
//  Created by yusuf demirkoparan on 21.11.2019.
//  Copyright © 2019 yusuf demirkoparan. All rights reserved.
//

import Foundation

protocol MainOrientationVMDelegate: AnyObject {
    var delegate: MainOrientationVMOutputsDelegate? { get set }
    func fetchQuestion()
    
}

protocol MainOrientationVMOutputsDelegate: AnyObject {
    func handleViewModelOutputs(_ outputs: MainOrientationVMOutputs)
    
}

enum MainOrientationVMOutputs {
    
}

final class MainOrientationViewModel: MainOrientationVMDelegate {
    /// Properties
    weak var delegate: MainOrientationVMOutputsDelegate?
    /// Init
    init() {
        
    }
    
    func fetchQuestion() {
        
    }
    
}
