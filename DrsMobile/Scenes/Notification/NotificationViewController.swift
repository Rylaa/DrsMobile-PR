//
//  NotificationViewController.swift
//  DrsMobile
//
//  Created by yusuf demirkoparan on 31.10.2019.
//  Copyright © 2019 yusuf demirkoparan. All rights reserved.
//

import UIKit

final class NotificationViewController: UIViewController {
    
    var viewModel: NotificationVMDelegate! {
        didSet {
            viewModel.delegate = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .brown
    }
}

extension NotificationViewController: NotificationVMOutputDelegate {
    func handleVMOutputs(_ outputs: NotificationVMOutputs) {
        
    }

}
