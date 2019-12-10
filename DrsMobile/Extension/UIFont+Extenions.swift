//
//  UIFontExtenions.swift
//  DrsMobile
//
//  Created by yusuf demirkoparan on 24.10.2019.
//  Copyright © 2019 yusuf demirkoparan. All rights reserved.
//

import UIKit
enum FontTypes: String {
    case regular = "SFProDisplay-Regular"
    case bold = "SFProDisplay-Semibold"
    case medium = "SFProDisplay-Medium"
    
}

enum FontSize: Int {
    case verySmall = 12
    case small = 14
    case normally = 16
    case bigNormal = 18
    case title = 20
    case medTitle = 25
    case largeTitle = 30
    
}

extension UIFont {
    static func setFontType(_ fontType: FontTypes, _ size: FontSize) -> UIFont {
        return UIFont(name: fontType.rawValue, size: CGFloat(size.rawValue))!
        
    }
}
