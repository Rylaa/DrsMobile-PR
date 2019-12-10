//
//  Coordinator.swift
//  DrsMobile
//
//  Created by yusuf demirkoparan on 23.10.2019.
//  Copyright © 2019 yusuf demirkoparan. All rights reserved.
//

import Foundation
import UIKit

protocol Coordinator: class {
    
    var childrenCoordinators: [Coordinator] { get set}
    var navigationController: UINavigationController { get set }
    
    func start()
    func didFinish(coordinator: Coordinator)
}

extension Coordinator {
    func didFinish(coordinator: Coordinator) {
        childrenCoordinators = childrenCoordinators.filter { $0 !== coordinator }
         
    }
}
