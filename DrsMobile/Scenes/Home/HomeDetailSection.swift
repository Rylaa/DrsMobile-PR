//
//  HomeDetailSection.swift
//  DrsMobile
//
//  Created by yusuf demirkoparan on 1.11.2019.
//  Copyright © 2019 yusuf demirkoparan. All rights reserved.
//

import UIKit

final class HomeDetailSection: UIView {
    
    lazy var segmentedControl: UISegmentedControl = {
        var sgControl = UISegmentedControl.setSegmentedProperties(items: ["Detayları Gizle", "Detayları Göster"])
        sgControl.backgroundColor = #colorLiteral(red: 0.9332546592, green: 0.9333356023, blue: 0.9375318885, alpha: 1)
        return sgControl
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(segmentedControl)
        segmentedControl.top(to: self, offset: 13)
        segmentedControl.centerX(to: self)
        segmentedControl.width(UIScreen.main.bounds.width*0.7)
        segmentedControl.height(40)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
