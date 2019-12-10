//
//  WingQuestionViewController.swift
//  DrsMobile
//
//  Created by yusuf demirkoparan on 19.11.2019.
//  Copyright © 2019 yusuf demirkoparan. All rights reserved.
//

import UIKit

final class WingQuestionViewController: TwoQuestionTemplate {
    
    // MARK: - Properties
    var viewModel: WingQuestionVMDelegate! {
        didSet {
            viewModel.delegate = self
        }
    }
  
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.setHidesBackButton(true, animated: false)
        view.backgroundColor = .white
        navigationItem.title = "Mizaç Testi"
        footerTemplate.nextBtn.addTarget(self, action: #selector(routeTo), for: .touchUpInside)
    }
    
    // MARK: - Selectors
    @objc func routeTo() {
        let viewController = MainOrientationViewController()
        navigationController?.pushViewController(viewController, animated: true)
        
    }
    
}

extension WingQuestionViewController: WingQuestionVMOutputsDelegate {
    func handleViewModelOutputs(_ outputs: WingQuestionVMOutputs) {
        
    }
    
}

extension WingQuestionViewController {
    /// implement view components
    
}
