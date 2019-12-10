//
//  TestCoordinator.swift
//  DrsMobile
//
//  Created by yusuf demirkoparan on 31.10.2019.
//  Copyright © 2019 yusuf demirkoparan. All rights reserved.
//

import UIKit

final class TestCoordinator: Coordinator {
    /// Properties
    var childrenCoordinators: [Coordinator]
    var parentCoordinator: Coordinator?
    var navigationController: UINavigationController
    var testViewController = TestViewController()
    let network: NetworkManager
    /// Init
    init(network: NetworkManager, navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.network = network
        childrenCoordinators = []
        
    }
    
    func start() {
        let viewModel = TestViewModel()
        testViewController.viewModel = viewModel
        viewModel.coordinator = self
        let tabIcon = #imageLiteral(resourceName: "tab1")
        testViewController.tabBarItem = UITabBarItem(title: nil, image: tabIcon, tag: 1)
        navigationController.pushViewController(testViewController, animated: true)
        
    }
    /// The user clicked the "start test" button when i was on The test page
    func routeTempTest() {
        // todo network manager gelecek
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        
        let viewController = MainQuestionViewController(collectionViewLayout: flowLayout)
        let testNavigationController = UINavigationController(rootViewController: viewController)
        let viewModel = MainQuestionViewModel(network: network)
        viewController.viewModel = viewModel
        
        UIView.transition(with: app.window!, duration: 0.5, options: .transitionFlipFromLeft, animations: {
            app.window?.rootViewController = testNavigationController
        }, completion: nil)
        
    }
    
    /// The user clicked the "Start Survey" button when i was on the test page
    func routeSurvey() {
        
    }
}
