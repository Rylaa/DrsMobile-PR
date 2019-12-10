//
//  TestHeaderView.swift
//  DrsMobile
//
//  Created by yusuf demirkoparan on 7.11.2019.
//  Copyright © 2019 yusuf demirkoparan. All rights reserved.
//

import UIKit

final class TestHeaderView: UIView {
    lazy var title =  UILabel.setLabel(fontStyle: UIFont.setFontType(.bold, .largeTitle),
                                       textColor: UIColor.black,
                                       textAlignment: NSTextAlignment.left,
                                       numberOfLines: 1)
    
    lazy var subTitle = UILabel.setLabel(fontStyle: UIFont.setFontType(.regular, .small),
                                         textColor: UIColor.black.withAlphaComponent(0.65),
                                         textAlignment: NSTextAlignment.left,
                                         numberOfLines: 1)
    
    lazy var editIcon = UIImageView.setImage(imageName: "alertP", tintColor: UIColor.black)
    
    var sendActivation = UIButton.setImageWithTitle(title: "Kodu Gönder",
                                                    titleColor: UIColor.mainColor,
                                                    backgroundColor: UIColor.white,
                                                    borderColor: UIColor.mainColor,
                                                    tintColor: UIColor.mainColor,
                                                    imageName: "roleRightArrow")
    private func setupLayout() {
        let container = UIView()
        addSubview(container)
        container.leftToSuperview()
        container.rightToSuperview()
        container.height(160)
        container.bottom(to: self)
        
        title.text = "Testler"
        container.addSubview(title)
        title.left(to: container, offset: +16)
        title.height(40)
        
        subTitle.text = "Mizaç Testi ve Kişilik Gelişim Anketi"
        container.addSubview(subTitle)
        subTitle.topToBottom(of: title, offset: 5)
        subTitle.left(to: container, offset: 16)
        subTitle.height(20)
        
        container.addSubview(editIcon)
        editIcon.right(to: container, offset: -16)
        editIcon.top(to: container, offset: +5)
        editIcon.width(20)
        editIcon.height(20)
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }
    
}
