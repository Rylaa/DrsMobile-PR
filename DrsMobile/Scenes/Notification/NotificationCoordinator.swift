//
//  NotificationCoordinator.swift
//  DrsMobile
//
//  Created by yusuf demirkoparan on 31.10.2019.
//  Copyright © 2019 yusuf demirkoparan. All rights reserved.
//

import UIKit

final class NotificationCoordinator: Coordinator {
    
    var childrenCoordinators: [Coordinator]
    var parentCoordinator: Coordinator?
    var navigationController: UINavigationController
    var notificationViewController = NotificationViewController()
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        childrenCoordinators = []
    }
    
    func start() {
        let viewModel = NotificationViewModel()
        notificationViewController.viewModel = viewModel
        viewModel.coordinator = self
        let tabIcon = #imageLiteral(resourceName: "tab2")
        notificationViewController.tabBarItem = UITabBarItem(title: nil, image: tabIcon, tag: 2)
        navigationController.pushViewController(notificationViewController, animated: true)
    }
}
