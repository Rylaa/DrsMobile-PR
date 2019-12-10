//
//  UIImageViewExtensions.swift
//  DrsMobile
//
//  Created by yusuf demirkoparan on 1.11.2019.
//  Copyright © 2019 yusuf demirkoparan. All rights reserved.
//

import UIKit

extension UIImageView {
    static func setImage(imageName: String, tintColor: UIColor?) -> UIImageView {
        let imageView = UIImageView()
        let image = UIImage(named: imageName)?.withRenderingMode(.alwaysTemplate)
        imageView.contentMode = .scaleAspectFit
        imageView.image = image
        imageView.tintColor = tintColor
        return imageView
        
    }
    
}
