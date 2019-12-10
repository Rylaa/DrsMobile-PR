//
//  ProfileCoordinator.swift
//  DrsMobile
//
//  Created by yusuf demirkoparan on 31.10.2019.
//  Copyright © 2019 yusuf demirkoparan. All rights reserved.
//

import UIKit

final class ProfileCoordinator: Coordinator {
    var childrenCoordinators: [Coordinator]
    var parentCoordinator: Coordinator?
    var navigationController: UINavigationController
    var profileViewController = ProfileViewController()
    
    init(navigationController: UINavigationController) {
        childrenCoordinators = []
        self.navigationController = navigationController
        
    }
    
    func start() {
        let viewModel = ProfileViewModel()
        profileViewController.viewModel = viewModel
        viewModel.coordinator = self
        let tabIcon = #imageLiteral(resourceName: "tab3")
        profileViewController.tabBarItem = UITabBarItem(title: nil, image: tabIcon, tag: 3)
        navigationController.pushViewController(profileViewController, animated: true)
        
    }
}
