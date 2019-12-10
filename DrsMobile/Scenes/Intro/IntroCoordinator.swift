//
//  IntroCoordinator.swift
//  DrsMobile
//
//  Created by yusuf demirkoparan on 23.10.2019.
//  Copyright © 2019 yusuf demirkoparan. All rights reserved.
//

import Foundation
import UIKit

final class IntroCoordinator: Coordinator {
    var childrenCoordinators: [Coordinator]
    var parentCoordinator: Coordinator?
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        childrenCoordinators = []
        
    }
    
    func start() {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        let viewController = IntroViewController(collectionViewLayout: flowLayout)
        let introViewModel = IntroViewModel()
        introViewModel.coordinator = self
        viewController.viewModel = introViewModel
        navigationController.pushViewController(viewController, animated: true)
        
    }
    
    func routeToLogin() {
        let coordinator = LoginCoordinator(navigationController: navigationController)
        coordinator.parentCoordinator = self
        childrenCoordinators.append(coordinator)
        coordinator.start()
        
    }
}
