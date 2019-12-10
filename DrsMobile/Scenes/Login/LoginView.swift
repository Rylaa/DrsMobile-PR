//
//  LoginView.swift
//  DrsMobile
//
//  Created by yusuf demirkoparan on 25.10.2019.
//  Copyright © 2019 yusuf demirkoparan. All rights reserved.
//

import UIKit
import TextFieldEffects

final class LoginView: UIView {
    
    lazy var title: UILabel = {
        var lbl = UILabel()
        lbl.adjustsFontSizeToFitWidth = true
        lbl.font = UIFont.setFontType(.bold, .largeTitle)
        lbl.sizeToFit()
        lbl.numberOfLines = 5
        lbl.textColor = UIColor.black
        lbl.textAlignment = NSTextAlignment.left
        lbl.text = "Merhaba"
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
        lbl.text = "Lütfen kullanıcı adı ve şifreinizi giriniz"
        return lbl
    }()
    
    lazy var userName: HoshiTextField = {
        var field = HoshiTextField(frame: CGRect(x: 0,
                                                 y: 0,
                                                 width: UIScreen.main.bounds.width*0.8,
                                                 height: UIScreen.main.bounds.height*0.07))
        field.placeholder = "Kullanıcı Adı"
        field.borderActiveColor = UIColor.mainColor
        field.borderInactiveColor = UIColor.mainColor
        field.autocapitalizationType = .none
        field.placeholderColor = UIColor.lightbrownishGrey
        field.textColor = UIColor.brownishGrey
        field.placeholderFontScale = 0.8
        field.layer.masksToBounds = true
        field.font = UIFont.setFontType(.regular, .normally)
        return field
    }()
    
    lazy var password: HoshiTextField = {
        var field = HoshiTextField(frame: CGRect(x: 0,
                                                 y: 0,
                                                 width: UIScreen.main.bounds.width*0.8,
                                                 height: UIScreen.main.bounds.height*0.07))
        field.placeholder = "Şifre"
        field.borderActiveColor = UIColor.mainColor
        field.borderInactiveColor = UIColor.mainColor
        field.autocapitalizationType = .none
        field.placeholderColor = UIColor.lightbrownishGrey
        field.textColor = UIColor.brownishGrey
        field.placeholderFontScale = 0.8
        field.layer.masksToBounds = true
        field.font = UIFont.setFontType(.regular, .normally)
        field.isSecureTextEntry = true
        return field
    }()
    
    lazy var loginButton: UIButton = {
        var btn = UIButton()
        btn.backgroundColor = UIColor.mainColor
        btn.setTitle("GİRİŞ", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.layer.cornerRadius = 16.933333
        return btn
    }()
    
    lazy var forgetPass: UIButton = {
        var btn = UIButton()
        btn.backgroundColor = UIColor.clear
        btn.setTitle("Şifremi Unuttum...", for: .normal)
        btn.setTitleColor(UIColor.lightbrownishGrey, for: .normal)
        btn.titleLabel?.font = UIFont.setFontType(.regular, .small)
        return btn
    }()
    
    lazy var passwordField = HoshiTextField(frame: CGRect(x: 0,
                                                          y: 0,
                                                          width: UIScreen.main.bounds.width*0.8,
                                                          height: UIScreen.main.bounds.height*0.7))
    
    lazy var headerView = UIView()
    lazy var middleView = UIView()
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

extension LoginView {
    fileprivate func setupLayout() {
        self.backgroundColor = .white
        self.layer.cornerRadius = 30
        
        let stackContiner = UIStackView(arrangedSubviews: [headerView, middleView, footerView])
        self.addSubview(stackContiner)
        stackContiner.edgesToSuperview()
        stackContiner.axis = .vertical
        stackContiner.spacing = 8
        stackContiner.distribution = .fillEqually
        
        headerView.addSubview(title)
        title.top(to: headerView, offset: UIScreen.main.bounds.height*0.1)
        title.left(to: headerView, offset: UIScreen.main.bounds.width*0.1)
        
        headerView.addSubview(text)
        text.topToBottom(of: title, offset: 5)
        text.left(to: headerView, offset: UIScreen.main.bounds.width*0.1)
        
        middleView.addSubview(password)
        password.bottom(to: middleView, offset: -20)
        password.left(to: middleView, offset: UIScreen.main.bounds.width*0.1 )
        password.width(UIScreen.main.bounds.width*0.8)
        password.height(UIScreen.main.bounds.height*0.07)
        
        middleView.addSubview(userName)
        userName.bottomToTop(of: password, offset: -10)
        userName.left(to: middleView, offset: UIScreen.main.bounds.width*0.1 )
        userName.width(UIScreen.main.bounds.width*0.8)
        userName.height(UIScreen.main.bounds.height*0.07)
        
        footerView.addSubview(loginButton)
        loginButton.top(to: footerView, offset: 5)
        loginButton.left(to: middleView, offset: UIScreen.main.bounds.width*0.1 )
        loginButton.width(UIScreen.main.bounds.width*0.8)
        loginButton.height(40)
        
        footerView.addSubview(forgetPass)
        forgetPass.topToBottom(of: loginButton, offset: 5)
        forgetPass.centerX(to: self)
        
    }
    
}
