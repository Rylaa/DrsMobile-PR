//
//  UIViewExtensions.swift
//  DrsMobile
//
//  Created by yusuf demirkoparan on 6.11.2019.
//  Copyright © 2019 yusuf demirkoparan. All rights reserved.
//

import UIKit

extension UIView {
    func activitySetup(activityColor: UIColor) {
        var activityIndicator = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.gray)
        activityIndicator = UIActivityIndicatorView(frame: CGRect.init(x: 0, y: 0, width: 50, height: 50))
        activityIndicator.center = self.center
        activityIndicator.hidesWhenStopped = true
        activityIndicator.color = activityColor
        activityIndicator.startAnimating()
        activityIndicator.tag = 475647
        self.isUserInteractionEnabled = false
        self.addSubview(activityIndicator)
        
    }
    
    func activityStopAnimating() {
        if let background = viewWithTag(475647) {
            background.removeFromSuperview()
        }
        self.isUserInteractionEnabled = true
    }
    
}
