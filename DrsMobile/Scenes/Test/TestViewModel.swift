//
//  TestViewModel.swift
//  DrsMobile
//
//  Created by yusuf demirkoparan on 31.10.2019.
//  Copyright © 2019 yusuf demirkoparan. All rights reserved.
//

import Foundation

protocol TestVMDelegate: AnyObject {
    var delegate: TestVMOutputDelegate? { get set }
    func load()
    func routeTest()
    func routeSurvey()
    
}

protocol TestVMOutputDelegate: AnyObject {
    func handleVMOutputs(_ outputs: TestVMOutputs)
}

enum TestVMOutputs {
    case isTheTestSolved(Bool)
  
}

final class TestViewModel: TestVMDelegate {
    weak var coordinator: TestCoordinator?
    weak var delegate: TestVMOutputDelegate?
    
    func load() {
        if
            let data = UserDefaults.standard.value(forKey: "UserData") as? Data,
            let configuration = try? JSONDecoder().decode(LoginData.self, from: data) {
            self.notify(.isTheTestSolved(configuration.temperament == nil ? false : true))
            
        }
        
    }
    /// The user clicked the "start test" button when i was on The test page
    func routeTest() {
        coordinator?.routeTempTest()
        
    }
    /// The user clicked the "Start Survey" button when i was on the test page
    func routeSurvey() {
        coordinator?.routeSurvey()
        
    }
    
    fileprivate func notify(_ outputs: TestVMOutputs) {
        delegate?.handleVMOutputs(outputs)
        
    }
}
