//
//  StudentViewController.swift
//  DrsMobile
//
//  Created by yusuf demirkoparan on 25.11.2019.
//  Copyright © 2019 yusuf demirkoparan. All rights reserved.
//

import UIKit

final class StudentViewController: UIViewController {
    // MARK: - Properties
    var viewModel: StudentVMDelegate! {
        didSet {
            viewModel.delegate = self
        }
    }
    
    // MARK: - Init
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
    }
}
// MARK: - View Model Outputs
extension StudentViewController: StudentVMDelegateOutput {
    
}
