//
//  LoginViewModel.swift
//  DrsMobile
//
//  Created by yusuf demirkoparan on 23.10.2019.
//  Copyright © 2019 yusuf demirkoparan. All rights reserved.
//

import Foundation

protocol LoginVMDelegate: AnyObject {
    
    var delegate: LoginVMOutputDelegate? { get set }
    func handleLoginButton(userName: String, password: String)
}

protocol LoginVMOutputDelegate: AnyObject {
    func handleViewModelOutputs(_ viewModelOutputs: LoginVMOutputs)
    
}

// todo Implement (Error)
enum LoginVMOutputs {
    case error(String)
    
}

final class LoginViewModel: LoginVMDelegate {
    /// - Properties
    weak var delegate: LoginVMOutputDelegate?
    weak var coordinator: LoginCoordinator?
    
    let network: NetworkManager
    var mockData = MockManager()
    let userDefault = UserDefaults.standard
    
    init(network: NetworkManager) {
        self.network = network
        
    }
    
    /// - Handlers
    func handleLoginButton(userName: String, password: String) {
        // Check email and password
        let response =  Validation.shared.validate(values: (ValidationType.password,
                                                            password), (ValidationType.alphabeticString,
                                                                        userName))
        switch response {
        case .success:
            // MARK: - todo When i use Moya i need handle negative scenes ********
            /// todo Implement. This app working now Mock data. When we finish development i change here production data
            mockData.defaultLoginPageConfigurer(userName: userName, password: password) { (response) in
                switch response {
                case .success(let data):
                    /// Set userdefaults token,temperament details
                    self.configureUserDefault(data: data)
                    let result = self.dataToRole(data: data)
                    
                    if let strongResult = result {
                        self.coordinator?.routeToRole(roleData: strongResult)
                    }
                    
                    
                case .failure(let error):
                    print("#Error Login1 \(error)")
                    
                }
            }
            
        case .failure(_, let message):
            notify(.error(message.rawValue))
            print("#Error Msg \(message.rawValue)")
            
        }
    }
    
    fileprivate func dataToRole(data: Login) -> [Role]? {
        let result = data.data.roles.map({ Role(data: $0) })
        return result
        
    }
    
    /// - Set User Temperament detail and token
    fileprivate func configureUserDefault(data: Login) {
        if let data = try? JSONEncoder().encode(data.data) {
            UserDefaults.standard.set(data, forKey: "UserData")
        }
        
    }
    /// - View Model and View Controller contracts
    fileprivate func notify(_ outputs: LoginVMOutputs) {
        self.delegate?.handleViewModelOutputs(outputs)
        
    }
}
