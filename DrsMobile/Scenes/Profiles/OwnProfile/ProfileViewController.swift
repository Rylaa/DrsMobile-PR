//
//  ProfileViewController.swift
//  DrsMobile
//
//  Created by yusuf demirkoparan on 31.10.2019.
//  Copyright © 2019 yusuf demirkoparan. All rights reserved.
//
import UIKit
final class ProfileViewController: ProfileTemplateVC {
    // MARK: - Properties
    var viewModel: ProfileVMDelegate! {
        didSet {
            viewModel.delegate = self
        }
    }
    
    // MARK: - Init
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.load()
        self.setupNavBarIcoN()
        
    }
}
// MARK: - Handlers
extension ProfileViewController: ProfileVMOutputDelegate {
    func handleVMOutputs(_ outputs: ProfileVMOutputs) {
        switch outputs {
        case .profileData(let data):
            self.profileData = data
            userName.text = data.userName
            userDetail.text = data.userDetail
            tableView.reloadData()
            
        }
    }
}
