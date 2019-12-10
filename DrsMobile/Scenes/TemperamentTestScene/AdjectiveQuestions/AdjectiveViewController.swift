//
//  AdjectiveViewController.swift
//  DrsMobile
//
//  Created by yusuf demirkoparan on 20.11.2019.
//  Copyright © 2019 yusuf demirkoparan. All rights reserved.
//

import Foundation
import UIKit

final class AdjectiveViewController: UIViewController {
    // MARK: - Properties
    var viewModel: WingQuestionVMDelegate! {
        didSet {
            viewModel.delegate = self
        }
    }
    var templateView = QuestionUITemplate()
    var templateView2 = QuestionUITemplate()
    var templateFooterView = TemperamentTestFooterTemplate()
    let scrollView = UIScrollView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        
    }
    
}
// MARK: - View Model Outputs
extension AdjectiveViewController: WingQuestionVMOutputsDelegate {
    func handleViewModelOutputs(_ outputs: WingQuestionVMOutputs) {
        
    }
    
}

extension AdjectiveViewController {
    /// implement view components
    fileprivate func setupLayout() {
        navigationItem.title = "Mizaç Testi"
        navigationItem.setHidesBackButton(true, animated: false)
        view.backgroundColor = .white
        
        view.addSubview(scrollView)
        scrollView.top(to: view)
        scrollView.widthToSuperview()
        scrollView.bottom(to: view, offset: -UIScreen.main.bounds.height*0.15)
        scrollView.contentSize = CGSize(width: UIScreen.main.bounds.width,
                                        height: UIScreen.main.bounds.height*0.8+10)
        
        scrollView.addSubview(templateView)
        templateView.top(to: scrollView)
        templateView.widthToSuperview()
        templateView.height(UIScreen.main.bounds.height*0.35)
        
        scrollView.addSubview(templateView2)
        templateView2.topToBottom(of: templateView, offset: 16)
        templateView2.widthToSuperview()
        templateView2.height(UIScreen.main.bounds.height*0.35)
        
        view.addSubview(templateFooterView)
        templateFooterView.bottom(to: view)
        templateFooterView.widthToSuperview()
        templateFooterView.height(CGFloat.setConstraint(130, 160))
       
    }
}
