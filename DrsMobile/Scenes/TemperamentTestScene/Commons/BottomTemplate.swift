//
//  BottomTemplate.swift
//  DrsMobile
//
//  Created by yusuf demirkoparan on 20.11.2019.
//  Copyright © 2019 yusuf demirkoparan. All rights reserved.
//

import UIKit
/*
 This UI use Main Question exptect
 Class draws next Question button and back button
 */
final class TemperamentTestFooterTemplate: UIView {
    var backBtn: UIButton = {
        var btn = UIButton()
        btn.backgroundColor = UIColor.paleGrey
        let img = UIImage(named: "testLeftArrow")?.withRenderingMode(.alwaysTemplate)
        btn.imageView?.tintColor = UIColor.white
        btn.imageView?.contentMode = .scaleAspectFit
        btn.layer.cornerRadius = 17
        btn.setImage(img, for: .normal)
        btn.alpha = 0.8
        return btn
    }()
    
    var nextBtn = UIButton.setImageWithTitle(title: "Sonraki Soru",
                                             titleColor: UIColor.white,
                                             backgroundColor: UIColor.mainColor,
                                             borderColor: UIColor.mainColor,
                                             tintColor: UIColor.paleGrayTwo.withAlphaComponent(0.8),
                                             imageName: "testRightArrow")
    
    lazy var arrowImage: UIImageView = {
        var img = UIImageView()
        img.image = UIImage(named: "downArrow")
        img.alpha = 0.5
        img.contentMode = .scaleAspectFit
        return img
    }()
    
    let bottomView: UIView = {
       var view = UIView()
        view.layer.cornerRadius = 25
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.paleGrayTwo.cgColor
        view.backgroundColor = .white
        return view
    }()
    
    let topView: UIView = {
       var view = UIView()
        view.backgroundColor = .clear
        return view
    }()
    
    func setupLayout() {
        self.backgroundColor = .clear
        addSubview(bottomView)
        bottomView.top(to: self, offset: +30)
        bottomView.widthToSuperview()
        bottomView.bottomToSuperview()
    
        addSubview(topView)
        topView.widthToSuperview()
        topView.top(to: self)
        topView.height(30)
        
        topView.addSubview(arrowImage)
        arrowImage.center(in: topView)
        arrowImage.width(20)
        arrowImage.height(20)
        
        bottomView.addSubview(backBtn)
        backBtn.top(to: bottomView, offset: 48)
        backBtn.left(to: bottomView, offset: 16)
        backBtn.width(CGFloat.setConstraint(60, 70))
        backBtn.height(CGFloat.setConstraint(40, 50))
        
        bottomView.addSubview(nextBtn)
        nextBtn.top(to: bottomView, offset: 48)
        nextBtn.leftToRight(of: backBtn, offset: 16)
        nextBtn.right(to: bottomView, offset: -16)
        nextBtn.height(CGFloat.setConstraint(40, 50))
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }
    
}
