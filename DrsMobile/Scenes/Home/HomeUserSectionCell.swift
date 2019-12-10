//
//  HomeUserSectionCell.swift
//  DrsMobile
//
//  Created by yusuf demirkoparan on 1.11.2019.
//  Copyright © 2019 yusuf demirkoparan. All rights reserved.
//

import UIKit

final class HomeUserSectionCell: UITableViewCell {

    lazy var cardView: UIView = {
       var view = UIView()
        view.layer.cornerRadius = 9
        view.backgroundColor = UIColor.paleGrey
        return view
    }()
    
    lazy var profileIcon = UIImageView.setImage(imageName: "UserIcon", tintColor: UIColor.mainColor)
    
    lazy var editIcon = UIImageView.setImage(imageName: "alertP", tintColor: UIColor.mainColor)
         
    lazy var userName = UILabel.setLabel(fontStyle: UIFont.setFontType(.bold, .title),
                                         textColor: UIColor.mainColor,
                                         textAlignment: NSTextAlignment.left,
                                         numberOfLines: 2)
    
    lazy var userType = UILabel.setLabel(fontStyle: UIFont.setFontType(.regular, .title),
                                           textColor: UIColor.mainColor.withAlphaComponent(0.6),
                                           textAlignment: NSTextAlignment.left,
                                           numberOfLines: 1)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        setupLayout()
        
    }

    func configure(userName: String, userType: String) {
        // todo: - Implement
        self.userName.text = userName
        self.userType.text = userType
          
    }
    
    fileprivate func setupLayout() {
        self.addSubview(cardView)
        cardView.left(to: self, offset: +16)
        cardView.right(to: self, offset: -16)
        cardView.height(85)
        cardView.center(in: self)
        
        cardView.addSubview(profileIcon)
        profileIcon.left(to: cardView, offset: 16)
        profileIcon.height(55)
        profileIcon.width(55)
        profileIcon.centerY(to: cardView)
        
        let labelContainer = UIStackView(arrangedSubviews: [userName, userType])
        labelContainer.axis = .vertical
        labelContainer.distribution = .fillProportionally
        
        cardView.addSubview(labelContainer)
        labelContainer.leftToRight(of: profileIcon, offset: 16)
        labelContainer.width(UIScreen.main.bounds.width*0.5)
        labelContainer.centerY(to: cardView)
        labelContainer.height(70)
        
        cardView.addSubview(editIcon)
        editIcon.right(to: cardView, offset: -10)
        editIcon.top(to: cardView, offset: +7)
        editIcon.width(20)
        editIcon.height(20)
        
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
