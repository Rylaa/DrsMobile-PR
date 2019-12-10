//
//  IntExtensions.swift
//  DrsMobile
//
//  Created by yusuf demirkoparan on 20.11.2019.
//  Copyright © 2019 yusuf demirkoparan. All rights reserved.
//

import UIKit
/// set diffrent screen constraints
extension CGFloat {
    static func setConstraint(_ shorScreen: Int, _ largeScreen: Int) -> CGFloat {
        return UIScreen.main.bounds.height>700
            ? CGFloat(largeScreen)
            : CGFloat(shorScreen)
    }
}
