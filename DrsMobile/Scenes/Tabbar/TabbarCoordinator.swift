//
//  TabbarCoordinator.swift
//  DrsMobile
//
//  Created by yusuf demirkoparan on 30.10.2019.
//  Copyright © 2019 yusuf demirkoparan. All rights reserved.
//

import UIKit

final class TabbarCoordinator: Coordinator {
    /// Properties
    var childrenCoordinators: [Coordinator]
    var navigationController: UINavigationController
    var parentCoordinator: Coordinator?
    let tabBarViewController = TabbarViewController()
    let network: NetworkManager
 
    /// Init
    init(network: NetworkManager, navigationController: UINavigationController) {
        self.navigationController = UINavigationController()
        self.network = network
        childrenCoordinators = []
        
    }
    
    func start() {
        let homeNavController = UINavigationController()
        let homeCoordinator = HomeCoordinator(network: network, navigationController: homeNavController)
        homeCoordinator.parentCoordinator = self
        childrenCoordinators.append(homeCoordinator)
        homeCoordinator.start()
        
        let testNavController = UINavigationController()
        let testCoordinator = TestCoordinator(network: network, navigationController: testNavController)
        testCoordinator.parentCoordinator = self
        childrenCoordinators.append(testCoordinator)
        testCoordinator.start()
        
        let notifyNavController = UINavigationController()
        let notificationCoordinator = NotificationCoordinator(navigationController: notifyNavController)
        notificationCoordinator.parentCoordinator = self
        childrenCoordinators.append(notificationCoordinator)
        notificationCoordinator.start()
        
        let profileNavController = UINavigationController()
        let profileCoordinator = ProfileCoordinator(navigationController: profileNavController)
        profileCoordinator.parentCoordinator = self
        childrenCoordinators.append(profileCoordinator)
        profileCoordinator.start()
        
        tabBarViewController.viewControllers = [homeNavController, testNavController, notifyNavController, profileNavController]
        app.window?.rootViewController = tabBarViewController
        
    }
}
