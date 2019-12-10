//
//  NotificationViewModel.swift
//  DrsMobile
//
//  Created by yusuf demirkoparan on 31.10.2019.
//  Copyright © 2019 yusuf demirkoparan. All rights reserved.
//

import Foundation

protocol NotificationVMDelegate: AnyObject {
    var delegate: NotificationVMOutputDelegate? { get set }
    func load()
    func route()
    
}

protocol NotificationVMOutputDelegate: AnyObject {
    func handleVMOutputs(_ outputs: NotificationVMOutputs)
}

enum NotificationVMOutputs {
    case roleData([Role])
}

final class NotificationViewModel: NotificationVMDelegate {
    weak var delegate: NotificationVMOutputDelegate?
    weak var coordinator: NotificationCoordinator?
    
    func load() {
        
    }
    
    func route() {
        
    }
    
}
