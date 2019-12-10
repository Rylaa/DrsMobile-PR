//
//  UIButtonExtensions.swift
//  DrsMobile
//
//  Created by yusuf demirkoparan on 28.10.2019.
//  Copyright © 2019 yusuf demirkoparan. All rights reserved.
//

import UIKit
extension UIButton {
    static func setImageWithTitle(title: String, titleColor: UIColor, backgroundColor: UIColor, borderColor: UIColor, tintColor: UIColor, imageName: String ) -> UIButton {
        let btn = UIButton()
        btn.layer.borderColor = borderColor.cgColor
        btn.layer.borderWidth = 1
        btn.setTitle(title, for: .normal)
        btn.setTitleColor(titleColor, for: .normal)
        btn.backgroundColor = backgroundColor
        btn.titleLabel?.font = UIFont.setFontType(.regular, .normally)
        btn.layer.cornerRadius = 17
        btn.imageView?.tintColor = tintColor
        btn.imageView?.contentMode = .scaleAspectFit
        btn.setImage(UIImage(named: imageName)?.withRenderingMode(.alwaysTemplate), for: .normal)
        btn.imageEdgeInsets = UIEdgeInsets(top: 0, left: UIScreen.main.bounds.width*0.6, bottom: 0, right: 0)
        return btn
        
    }
    
    static func setButtonStyle(title: String, titleColor: UIColor, backgroundColor: UIColor, borderColor: UIColor, cornerRadius: Int) -> UIButton {
        let btn = UIButton()
        btn.backgroundColor = backgroundColor
        btn.layer.borderColor = borderColor.cgColor
        btn.layer.borderWidth = 1
        btn.setTitle(title, for: .normal)
        btn.setTitleColor(titleColor, for: .normal)
        btn.titleLabel?.font = UIFont.setFontType(.regular, .normally)
        btn.layer.cornerRadius = CGFloat(cornerRadius)
        return btn
        
    }
    
    static func setFramelessButton(title: String, generalColor: UIColor) -> UIButton {
        let btn = UIButton()
        btn.backgroundColor = .white
        btn.layer.borderColor = generalColor.cgColor
        btn.layer.borderWidth = 1
        btn.setTitle(title, for: .normal)
        btn.setTitleColor(generalColor, for: .normal)
        btn.titleLabel?.font = UIFont.setFontType(.regular, .normally)
        btn.layer.cornerRadius = 10
        return btn
        
    }
    
}
