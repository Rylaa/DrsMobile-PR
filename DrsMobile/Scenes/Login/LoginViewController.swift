//
//  LoginViewController.swift
//  DrsMobile
//
//  Created by yusuf demirkoparan on 23.10.2019.
//  Copyright © 2019 yusuf demirkoparan. All rights reserved.
//

import Foundation
import UIKit

class LoginViewController: LoginRoleTemplete {
    // MARK: - Properties
    var viewModel: LoginVMDelegate! {
        didSet {
            viewModel.delegate = self
        }
        
    }
    var loginView = LoginView()
    
    // MARK: - Init
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
        
    }
    
    // MARK: - Selectors    
    @objc func handleLoginButtonTabbed() {
        view.endEditing(false)
        viewModel.handleLoginButton(userName: loginView.userName.text ?? "", password: loginView.password.text ?? "")
        
    }
}

// MARK: - View Model Outputs
extension LoginViewController: LoginVMOutputDelegate {
    func handleViewModelOutputs(_ viewModelOutputs: LoginVMOutputs) {
        switch viewModelOutputs {
        case .error(let errorString):
            let alert = Alert.customAlert(title: "Uyarı!", message: errorString)
            self.present(alert, animated: true, completion: nil)
            
        }
    }
}

// MARK: - Implement UI/UX
extension LoginViewController {
    fileprivate func setupLayout() {
        /// Implement the login view
        view.addSubview(loginView)
        loginView.alpha = 1.0
        let transform = CATransform3DTranslate(CATransform3DIdentity, 0, 900, 600)
        loginView.layer.transform = transform
        
        UIView.animate(withDuration: 0.8) {
            self.loginView.alpha = 1.0
            self.loginView.layer.transform = CATransform3DIdentity
            self.loginView.layer.transform = CATransform3DIdentity
            
        }
        
        self.loginView.top(to: view, offset: UIScreen.main.bounds.height*0.3)
        self.loginView.width(UIScreen.main.bounds.width)
        self.loginView.height(UIScreen.main.bounds.height*0.75)
        /// login button action
        loginView.loginButton.addTarget(self, action: #selector(handleLoginButtonTabbed), for: .touchUpInside)
        
    }
    
}
