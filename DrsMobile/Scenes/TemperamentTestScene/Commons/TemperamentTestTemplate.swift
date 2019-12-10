//
//  TemperamentTestTemplate.swift
//  DrsMobile
//
//  Created by yusuf demirkoparan on 14.11.2019.
//  Copyright © 2019 yusuf demirkoparan. All rights reserved.
//

import UIKit

/*
 This class using only main question screen
 Here drawer two button and a slider 
 */

final class TemperamentTestTemplate: UIView {
    
    lazy var templateView = UIView()
    lazy var blurView = UIView()
    
    lazy var slider: UISlider = {
        var sld = UISlider()
        sld.minimumTrackTintColor = UIColor.mainColor
        sld.maximumTrackTintColor = UIColor.mainColor.withAlphaComponent(0.5)
        sld.thumbTintColor = UIColor.paleGrayTwo
        sld.minimumValue = 0
        sld.maximumValue = 100
        return sld
    }()
    
    lazy var backBtn: UIButton = {
        var btn = UIButton()
        btn.backgroundColor = UIColor.paleGrayTwo
        btn.imageView?.tintColor = UIColor.mainColor
        let img = UIImage(named: "testLeftArrow")?.withRenderingMode(.alwaysTemplate)
        btn.imageView?.tintColor = UIColor.mainColor
        btn.imageView?.contentMode = .scaleAspectFit
        btn.layer.cornerRadius = 17
        btn.setImage(img, for: .normal)
        return btn
        
    }()
    
    var nextBtn = UIButton.setImageWithTitle(title: "Sonraki Soru",
                                             titleColor: UIColor.white,
                                             backgroundColor: UIColor.mainColor,
                                             borderColor: UIColor.mainColor,
                                             tintColor: UIColor.paleGrayTwo.withAlphaComponent(0.8),
                                             imageName: "testRightArrow")
    
    lazy var sliderScore: UILabel = {
        var lbl = UILabel()
        lbl.textColor = UIColor.mainColor
        lbl.font = UIFont.setFontType(.bold, .title)
        return lbl
    }()
    
    lazy var blurViewImage: UIImageView = {
        var img = UIImageView()
        img.image = UIImage(named: "downArrow")
        img.alpha = 0.5
        img.contentMode = .scaleAspectFit
        return img
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension TemperamentTestTemplate {
    func setupLayout() {
        self.backgroundColor = .clear
        addSubview(templateView)
        templateView.top(to: self, offset: +30)
        templateView.bottomToSuperview()
        templateView.width(UIScreen.main.bounds.width)
        templateView.layer.cornerRadius = 25
        templateView.layer.borderWidth = 1
        templateView.layer.borderColor = UIColor.paleGrayTwo.cgColor
        templateView.backgroundColor = .white
        
        sliderScore.text = "0%"
        templateView.addSubview(slider)
        slider.left(to: templateView, offset: 16)
        slider.right(to: templateView, offset: -50)
        slider.top(to: templateView, offset: 16)
        
        templateView.addSubview(backBtn)
        backBtn.topToBottom(of: slider, offset: 15)
        backBtn.left(to: templateView, offset: 16)
        backBtn.width(CGFloat.setConstraint(60, 70))
        backBtn.height(CGFloat.setConstraint(40, 50))
        
        templateView.addSubview(nextBtn)
        nextBtn.topToBottom(of: slider, offset: 15)
        nextBtn.leftToRight(of: backBtn, offset: 16)
        nextBtn.right(to: templateView, offset: -16)
        nextBtn.height(CGFloat.setConstraint(40, 50))
        
        templateView.addSubview(sliderScore)
        sliderScore.leftToRight(of: slider, offset: 8)
        sliderScore.top(to: templateView, offset: 19)
        
        addSubview(blurView)
        blurView.bottomToTop(of: templateView)
        blurView.height(20)
        blurView.widthToSuperview()
        blurView.backgroundColor = UIColor.white.withAlphaComponent(0.7)
        
        blurView.addSubview(blurViewImage)
        blurViewImage.width(20)
        blurViewImage.height(20)
        blurViewImage.center(in: blurView)
        
    }
}
