//
//  StudentViewModel.swift
//  DrsMobile
//
//  Created by yusuf demirkoparan on 25.11.2019.
//  Copyright © 2019 yusuf demirkoparan. All rights reserved.
//

import Foundation

protocol StudentVMDelegate: AnyObject {
    var delegate: StudentVMDelegateOutput? { get set }
    func load()
    
}

protocol StudentVMDelegateOutput: AnyObject {
    
}

enum StudentVMOutputs {
    
}

final class StudentViewModel: StudentVMDelegate {
    /// Properties
    weak var delegate: StudentVMDelegateOutput?
    let network: NetworkManager
    /// Init
    init(network: NetworkManager) {
        self.network = network
    }
    
    func load() {
        
    }
    
}
