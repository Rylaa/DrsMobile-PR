//
//  ClassCoordinator.swift
//  DrsMobile
//
//  Created by yusuf demirkoparan on 26.11.2019.
//  Copyright © 2019 yusuf demirkoparan. All rights reserved.
//

import UIKit

final class ClassCoordinator: Coordinator {
    /// Properties
    var childrenCoordinators: [Coordinator]
    var navigationController: UINavigationController
    var parentCoordinator: Coordinator?
    let network: NetworkManager
    /// Init
    init(network: NetworkManager, navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.network = network
        childrenCoordinators = []
        
    }
    /// This method created class view controller
    func start() {
        let viewController = ClassViewController()
        let viewModel = ClassViewModel(network: network)
        viewModel.coordinator = self
        viewController.viewModel = viewModel
        navigationController.pushViewController(viewController, animated: true)
        
    }
}
