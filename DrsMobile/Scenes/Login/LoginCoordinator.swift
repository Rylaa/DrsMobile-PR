//
//  LoginCoordinator.swift
//  DrsMobile
//
//  Created by yusuf demirkoparan on 23.10.2019.
//  Copyright © 2019 yusuf demirkoparan. All rights reserved.
//

import Foundation
import UIKit

class LoginCoordinator: Coordinator {
    
    var childrenCoordinators: [Coordinator]
    var navigationController: UINavigationController
    var parentCoordinator: Coordinator?
    let network = NetworkManager()
    /// init
    init(navigationController: UINavigationController  ) {
        childrenCoordinators = []
        self.navigationController = navigationController
        
    }
    
    func start() {
        let viewController =  LoginViewController()
        let loginViewModel = LoginViewModel(network: network)
        loginViewModel.coordinator = self
        viewController.viewModel = loginViewModel
        navigationController.pushViewController(viewController, animated: true)
          
    }
    
    func routeToRole(roleData: [Role]) {
        let coordinator = RoleCoordinator(network: network, navigationController: navigationController, roleData: roleData)
        coordinator.parentCoordinator = self
        childrenCoordinators.append(coordinator)
        coordinator.start()
        
    }
}
