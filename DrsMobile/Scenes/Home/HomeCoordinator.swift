//
//  HomeCoordinator.swift
//  DrsMobile
//
//  Created by yusuf demirkoparan on 30.10.2019.
//  Copyright © 2019 yusuf demirkoparan. All rights reserved.
//

import UIKit

final class HomeCoordinator: Coordinator {
    /// Properties
    var childrenCoordinators: [Coordinator]
    var navigationController: UINavigationController
    var parentCoordinator: Coordinator?
    var homeController = HomeViewController()
    let network: NetworkManager
    /// Init
    init(network: NetworkManager, navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.network = network
        childrenCoordinators = []
        
    }
    
    func start() {
        let viewModel = HomeViewModel(network: network)
        homeController.viewModel = viewModel
        viewModel.coordinator = self
        let tabIcon = #imageLiteral(resourceName: "tab0")
        homeController.tabBarItem = UITabBarItem(title: nil, image: tabIcon, tag: 0)
        navigationController.navigationBar.prefersLargeTitles = true
        navigationController.pushViewController(homeController, animated: true)
        
    }
    /// I changed page when I cliecked temperament test
    func routeToTestPage() {
        if let tabBarController = UIApplication.shared.keyWindow?.rootViewController as? UITabBarController {
            tabBarController.selectedIndex = 1
            
        }
    }
    
    func routeToStudentPage() {
        print("testg2")
        ///todo
    }
    
    func routeToParentPage() {
        ///todo
    }
    
    func routeToClassPage() {
        let coordinator = ClassCoordinator(network: network, navigationController: navigationController)
        coordinator.parentCoordinator = self
        coordinator.start()
        
    }
}
