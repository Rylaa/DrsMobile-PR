//
//  MainCordinator.swift
//  DrsMobile
//
//  Created by yusuf demirkoparan on 23.10.2019.
//  Copyright © 2019 yusuf demirkoparan. All rights reserved.
//

import Foundation
import UIKit

let app = MainCoordinator()

class MainCoordinator: Coordinator {
    var childrenCoordinators: [Coordinator]
    var navigationController: UINavigationController
    var window: UIWindow?
    
    init() {
        navigationController = UINavigationController()
        childrenCoordinators = []
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()

    }
    
    func start() {
        // todo
        UserDefaults.standard.removeObject(forKey: "UserData")
        let introCoordinator = IntroCoordinator(navigationController: navigationController)
        introCoordinator.parentCoordinator = self
        childrenCoordinators.append(introCoordinator)
        introCoordinator.start()
        
    }
}

/*
 App Description
  * -Currents userdefaults keys
 -Motivation
 -DTM
 -token
 */
