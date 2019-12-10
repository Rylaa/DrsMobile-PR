//
//  HomeUserSection.swift
//  DrsMobile
//
//  Created by yusuf demirkoparan on 1.11.2019.
//  Copyright © 2019 yusuf demirkoparan. All rights reserved.
//

import UIKit
final class HomeUserSection: UIView {
 
    var title: UILabel = {
        var label = UILabel.setLabel(fontStyle: UIFont.setFontType(FontTypes.bold, FontSize.largeTitle),
                                     textColor: UIColor.black,
                                     textAlignment: NSTextAlignment.left,
                                     numberOfLines: 1)
        label.text = "Özet"
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
//        self.addSubview(title)
//        title.left(to: self, offset: +16)
//        title.bottom(to: self)
//        title.height(50)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
