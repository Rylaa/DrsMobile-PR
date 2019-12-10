//
//  WingOrientationVİewModel.swift
//  DrsMobile
//
//  Created by yusuf demirkoparan on 21.11.2019.
//  Copyright © 2019 yusuf demirkoparan. All rights reserved.
//

import Foundation
protocol WingOrientationVMDelegate: AnyObject {
    var delegate: WingOrientationVMOutputsDelegate? { get set }
    func fetchQuestion()
    
}

protocol WingOrientationVMOutputsDelegate: AnyObject {
    func handleViewModelOutputs(_ outputs: WingOrientationVMOutputs)
    
}

enum WingOrientationVMOutputs {
    
}

final class WingOrientationVİewModel {
    
}
