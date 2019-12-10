//
//  RoleViewModel.swift
//  DrsMobile
//
//  Created by yusuf demirkoparan on 28.10.2019.
//  Copyright © 2019 yusuf demirkoparan. All rights reserved.
//

import Foundation

protocol RoleVMDelegate: AnyObject {
    var delegate: RoleVMOutputDelegate? { get set }
    func load()
    func selectedItem(selectedIndex: Int)
    
}

protocol RoleVMOutputDelegate: AnyObject {
    func handleVMOutputs(_ outputs: RoleVMOutputs)
    
}

enum RoleVMOutputs {
    case roleData([Role])
    
}

final class RoleViewModel: RoleVMDelegate {
    weak var delegate: RoleVMOutputDelegate?
    weak var coordinator: RoleCoordinator?
    var roleData = [Role]()
    
    init(data: [Role]) {
        roleData = data
        
    }
    
    func selectedItem(selectedIndex: Int) {
        switch selectedIndex {
        case 0:
            /// Manager
            UserDefaults.standard.set("Role", forKey: roleData[selectedIndex].uid)
            UserDefaults.standard.set("Manager", forKey: "SelectedRole")
            
        case 1:
            /// Parent
            UserDefaults.standard.set("Role", forKey: roleData[selectedIndex].uid)
            UserDefaults.standard.set("Parent", forKey: "SelectedRole")
            
        case 2:
            /// Teacher
            UserDefaults.standard.set("Role", forKey: roleData[selectedIndex].uid)
            UserDefaults.standard.set("Teacher", forKey: "SelectedRole")
    
        default : break
        }
        coordinator?.routeToTabbar()
    }
    
    func load() {
        notify(.roleData(roleData))
        
    }
    
    fileprivate func notify(_ viewModelOutputs: RoleVMOutputs ) {
        delegate?.handleVMOutputs(viewModelOutputs)
        
    }
}
