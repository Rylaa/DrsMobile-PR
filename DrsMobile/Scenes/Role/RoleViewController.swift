//
//  RoleViewController.swift
//  DrsMobile
//
//  Created by yusuf demirkoparan on 28.10.2019.
//  Copyright © 2019 yusuf demirkoparan. All rights reserved.
//

import UIKit

class RoleViewController: LoginRoleTemplete {
    // MARK: - Properties
    var viewModel: RoleVMDelegate! {
        didSet {
            viewModel.delegate = self
            
        }
    }
    
    var roleView: RoleView = {
        var view = RoleView()
        view.managerButton.addTarget(self, action: #selector(handleRoleButtonTabbed(sender:)), for: .touchUpInside)
        view.parentButton.addTarget(self, action: #selector(handleRoleButtonTabbed(sender:)), for: .touchUpInside)
        view.teacherButton.addTarget(self, action: #selector(handleRoleButtonTabbed(sender:)), for: .touchUpInside)
        return view
    }()
    
    // MARK: - Init
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.load()
        setupLayout()
        
    }
    
    // MARK: - Selectors
    @objc func handleRoleButtonTabbed(sender: UIButton) {
        viewModel.selectedItem(selectedIndex: sender.tag)
        
    }
    
}

// MARK: - View Model Outputs
extension RoleViewController: RoleVMOutputDelegate {
    func handleVMOutputs(_ outputs: RoleVMOutputs) {
        switch outputs {
        case .roleData(let data):
            for index in data {
                switch index.name {
                case "Yönetici":
                    roleView.managerButton.isHidden = false
                    
                case "Veli":
                    roleView.parentButton.isHidden = false
                    
                case "Rehber Öğretmen":
                    roleView.teacherButton.isHidden = false
                    
                default : break
                    
                }
            }
        }
    }
}

extension RoleViewController {
    fileprivate func setupLayout() {
        view.addSubview(roleView)
        roleView.alpha = 1.0
        let transform = CATransform3DTranslate(CATransform3DIdentity, 0, 900, 600)
        roleView.layer.transform = transform
        
        UIView.animate(withDuration: 0.8) {
            self.roleView.alpha = 1.0
            self.roleView.layer.transform = CATransform3DIdentity
            self.roleView.layer.transform = CATransform3DIdentity
            
        }
        
        self.roleView.top(to: view, offset: UIScreen.main.bounds.height*0.3)
        self.roleView.width(UIScreen.main.bounds.width)
        self.roleView.height(UIScreen.main.bounds.height*0.75)
        
    }
}
