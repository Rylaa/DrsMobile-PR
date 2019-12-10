//
//  UILabelExtensions.swift
//  DrsMobile
//
//  Created by yusuf demirkoparan on 1.11.2019.
//  Copyright © 2019 yusuf demirkoparan. All rights reserved.
//

import UIKit
extension UILabel {
   static func setLabel(fontStyle: UIFont, textColor: UIColor, textAlignment: NSTextAlignment, numberOfLines: Int) -> UILabel {
        let label = UILabel()
        label.adjustsFontSizeToFitWidth = true
        label.font = fontStyle
        label.sizeToFit()
        label.numberOfLines = numberOfLines
        label.textColor = textColor
        label.textAlignment = textAlignment
        return label
        
    }
    
}
