//
//  UISegmentedControlExtensions.swift
//  DrsMobile
//
//  Created by yusuf demirkoparan on 1.11.2019.
//  Copyright © 2019 yusuf demirkoparan. All rights reserved.
//

import UIKit
extension UISegmentedControl {
    static func setSegmentedProperties(items: [String]) -> UISegmentedControl {
        let sgControl = UISegmentedControl(items: ["Detayları Gizle", "Detayları Göster"])
        sgControl.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width*0.7, height: UIScreen.main.bounds.width*0.05)
        sgControl.selectedSegmentIndex = 0
        sgControl.layer.borderColor = UIColor.clear.cgColor
        sgControl.setTitleTextAttributes([NSAttributedString.Key.font: UIFont.setFontType(.regular, .normally)], for: .normal)
        if #available(iOS 13.0, *) {
            return sgControl
            
        } else {
            sgControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: .selected )
            sgControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.black], for: .normal )
            sgControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.black ], for: .selected)
            sgControl.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            sgControl.tintColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 0.6995398116)
            return sgControl
        }
    }
    
}
