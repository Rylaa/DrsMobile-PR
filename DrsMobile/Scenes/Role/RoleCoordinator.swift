//
//  RoleCoordinator.swift
//  DrsMobile
//
//  Created by yusuf demirkoparan on 28.10.2019.
//  Copyright © 2019 yusuf demirkoparan. All rights reserved.
//

import UIKit

final class RoleCoordinator: Coordinator {
    /// Properties
    var childrenCoordinators: [Coordinator]
    var parentCoordinator: Coordinator?
    var navigationController: UINavigationController
    var roleData = [Role]()
    let network: NetworkManager
    /// Init
    init(network: NetworkManager, navigationController: UINavigationController, roleData: [Role]) {
        self.navigationController = navigationController
        self.roleData = roleData
        self.network = network
        childrenCoordinators = []
    }
    
    func start() {
        childrenCoordinators = []
        let viewController = RoleViewController()
        let viewModel = RoleViewModel(data: roleData)
        viewController.viewModel = viewModel
        viewModel.coordinator = self
        navigationController.pushViewController(viewController, animated: true)
        
    }
    
    func routeToTabbar() {
        let coordinator = TabbarCoordinator(network: network, navigationController: navigationController)
        coordinator.parentCoordinator = self
        childrenCoordinators.append(coordinator)
        coordinator.start()
    }
}
