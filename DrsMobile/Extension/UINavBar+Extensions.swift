//
//  UINavBarExtensions.swift
//  DrsMobile
//
//  Created by yusuf demirkoparan on 4.11.2019.
//  Copyright © 2019 yusuf demirkoparan. All rights reserved.
//

import UIKit

extension UIViewController {
    func setupNavBarIcoN() {
        navigationItem.setHidesBackButton(true, animated: false)
        navigationItem.largeTitleDisplayMode = .never
        let drsLogo = #imageLiteral(resourceName: "Group 223")
        let imageView = UIImageView(image: drsLogo)
        imageView.contentMode = .scaleAspectFit
        self.navigationItem.titleView = imageView
        
    }
}
