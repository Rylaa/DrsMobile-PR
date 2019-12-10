//
//  IntroCell.swift
//  DrsMobile
//
//  Created by yusuf demirkoparan on 24.10.2019.
//  Copyright © 2019 yusuf demirkoparan. All rights reserved.
//

import UIKit

final class IntroCell: UICollectionViewCell {
    
    lazy var image: UIImageView = {
        var img = UIImageView()
        img.contentMode = UIView.ContentMode.scaleAspectFit
        return img
    }()
    
    lazy var title: UILabel = {
        var lbl = UILabel()
        lbl.adjustsFontSizeToFitWidth = true
        lbl.font = UIFont.setFontType(.bold, .title)
        lbl.sizeToFit()
        lbl.numberOfLines = 1
        lbl.textColor = UIColor.mainColor
        lbl.textAlignment = NSTextAlignment.center
        return lbl
    }()
    
    lazy var introDescription: UILabel = {
        var lbl = UILabel()
        lbl.adjustsFontSizeToFitWidth = true
        lbl.font = UIFont.setFontType(.regular, .normally)
        lbl.sizeToFit()
        lbl.numberOfLines = 5
        lbl.textColor = UIColor.IntroDescriptionColor
        lbl.textAlignment = NSTextAlignment.center
        return lbl
    }()
    
    lazy var completeIntro: UIButton = {
        var btn = UIButton()
        btn.backgroundColor = .clear
        btn.titleLabel?.font = UIFont.setFontType(.regular, .normally)
        btn.setTitle("Hadi Başlayalım", for: .normal)
        btn.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
        btn.isHidden = true
        btn.backgroundColor = UIColor.mainColor
        btn.layer.cornerRadius = 16.933333
        return btn
    }()
    
    // MARK: -
    fileprivate func setupLayout() {
        addSubview(image)
        image.top(to: self, offset: (UIScreen.main.bounds.height*0.1))
        image.width(UIScreen.main.bounds.height*0.5)
        image.height(UIScreen.main.bounds.height*0.5)
        image.centerX(to: self)
        
        addSubview(title)
        title.centerX(to: self)
        title.centerY(to: self, offset: UIScreen.main.bounds.height*0.15 )
        title.width(UIScreen.main.bounds.width*0.75)
        
        addSubview(introDescription)
        introDescription.topToBottom(of: title)
        introDescription.centerX(to: self)
        introDescription.width(UIScreen.main.bounds.width*0.95)
        
        addSubview(self.completeIntro)
        completeIntro.centerY(to: self, offset: UIScreen.main.bounds.height*0.2)
        completeIntro.centerX(to: self)
        completeIntro.width(UIScreen.main.bounds.width*0.8)
        completeIntro.height(40)
    }
    
    func configure(_ index: Int, _ data: Intro, _ dataCount: Int) {
        image.image = UIImage(named: "\(data.imageName)")
        title.text = data.title
        introDescription.text = data.description
        (dataCount-1) == index ? isVisible(true) : isVisible(false)
        
    }
    
    func isVisible(_ isHidden: Bool) {
        title.isHidden = isHidden
        introDescription.isHidden = isHidden
        completeIntro.isHidden = !isHidden
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
