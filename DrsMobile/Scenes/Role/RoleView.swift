//
//
//  RoleVew.swift
//  DrsMobile
//
//  Created by yusuf demirkoparan on 28.10.2019.
//  Copyright © 2019 yusuf demirkoparan. All rights reserved.
//

import UIKit

final class RoleView: UIView {
    
    lazy var title: UILabel = {
        var lbl = UILabel()
        lbl.adjustsFontSizeToFitWidth = true
        lbl.font = UIFont.setFontType(.bold, .largeTitle)
        lbl.sizeToFit()
        lbl.numberOfLines = 5
        lbl.textColor = UIColor.black
        lbl.textAlignment = NSTextAlignment.left
        lbl.text = "Rol Seçin"
        return lbl
    }()
    
    lazy var text: UILabel = {
        var lbl = UILabel()
        lbl.adjustsFontSizeToFitWidth = true
        lbl.font = UIFont.setFontType(.regular, .small)
        lbl.sizeToFit()
        lbl.numberOfLines = 5
        lbl.textColor = UIColor.lightbrownishGrey
        lbl.textAlignment = NSTextAlignment.center
        lbl.text = "Lütfen giriş yapmak istediğiniz rolu seçin"
        return lbl
    }()
    
    lazy var managerButton: UIButton = {
        var btn = UIButton.setImageWithTitle(title: "Yönetici",
                                             titleColor: UIColor.mainColor,
                                             backgroundColor: UIColor.white,
                                             borderColor: UIColor.mainColor,
                                             tintColor: UIColor.mainColor,
                                             imageName: "roleRightArrow")
        btn.isHidden = true
        btn.tag = 0
        return btn
    }()
    
    lazy var parentButton: UIButton = {
        var btn = UIButton.setImageWithTitle(title: "Veli",
                                             titleColor: UIColor.dustyOrange,
                                             backgroundColor: UIColor.white,
                                             borderColor: UIColor.dustyOrange,
                                             tintColor: UIColor.dustyOrange,
                                             imageName: "roleRightArrow")
        btn.isHidden = true
        btn.tag = 1
        return btn
    }()
    
    lazy var teacherButton: UIButton = {
        var btn = UIButton.setImageWithTitle(title: "Rehber Öğretmen",
                                             titleColor: UIColor.aquaBlue,
                                             backgroundColor: UIColor.white,
                                             borderColor: UIColor.aquaBlue,
                                             tintColor: UIColor.aquaBlue,
                                             imageName: "roleRightArrow")
        btn.isHidden = true
        btn.tag = 2
        return btn
    }()
    
    lazy var headerView = UIView()
    lazy var footerView = UIView()
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension RoleView {
    func setupLayout() {
        self.backgroundColor = .white
        self.layer.cornerRadius = 30
        
        self.addSubview(headerView)
        headerView.topToSuperview()
        headerView.width(UIScreen.main.bounds.width)
        headerView.height(UIScreen.main.bounds.height*0.2)
        headerView.clipsToBounds = true
        
        headerView.addSubview(title)
        title.top(to: headerView, offset: UIScreen.main.bounds.height*0.1)
        title.left(to: headerView, offset: UIScreen.main.bounds.width*0.1)
        
        headerView.addSubview(text)
        text.topToBottom(of: title, offset: 5)
        text.left(to: headerView, offset: UIScreen.main.bounds.width*0.1)
        
        self.addSubview(footerView)
        footerView.topToBottom(of: headerView, offset: 20)
        footerView.width(UIScreen.main.bounds.width)
        footerView.height(UIScreen.main.bounds.height*0.6)
        
        footerView.addSubview(managerButton)
        managerButton.top(to: footerView, offset: 20)
        managerButton.centerX(to: self)
        managerButton.width(UIScreen.main.bounds.width*0.7)
        managerButton.height(50)
        
        footerView.addSubview(parentButton)
        parentButton.topToBottom(of: managerButton, offset: 20)
        parentButton.centerX(to: self)
        parentButton.width(UIScreen.main.bounds.width*0.7)
        parentButton.height(50)
        
        footerView.addSubview(teacherButton)
        teacherButton.topToBottom(of: parentButton, offset: 20)
        teacherButton.centerX(to: self)
        teacherButton.width(UIScreen.main.bounds.width*0.7)
        teacherButton.height(50)
    }
}
