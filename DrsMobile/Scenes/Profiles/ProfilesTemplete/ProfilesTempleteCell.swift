//
//  ProfileTempleteCell.swift
//  DrsMobile
//
//  Created by yusuf demirkoparan on 8.11.2019.
//  Copyright © 2019 yusuf demirkoparan. All rights reserved.
//

import UIKit

final class ProfilesTempleteCell: UITableViewCell {
    lazy var title = UILabel.setLabel(fontStyle: UIFont.setFontType(.regular, .normally),
                                      textColor: UIColor.mainColor,
                                      textAlignment: NSTextAlignment.left,
                                      numberOfLines: 1)
    
    lazy var userDetail = UILabel.setLabel(fontStyle: UIFont.setFontType(.regular, .title),
                                           textColor: UIColor.black,
                                           textAlignment: NSTextAlignment.left,
                                           numberOfLines: 2)
    /// Implement cells
    func configure(_ profileDetail: ProfileDetailPresentation?) {
        title.text = profileDetail?.title
        userDetail.text = profileDetail?.description
        
    }
    
    func setupLayout() {
        let viewContainer = UIStackView(arrangedSubviews: [title, userDetail])
        viewContainer.axis = .vertical
        viewContainer.distribution = .fill
        
        self.addSubview(viewContainer)
        viewContainer.left(to: self, offset: 16)
        viewContainer.right(to: self, offset: -16)
        viewContainer.height(80)
        
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupLayout()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }
    
}
