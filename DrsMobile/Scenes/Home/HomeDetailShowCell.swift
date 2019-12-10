//
//  HomeShowDetailCell.swift
//  DrsMobile
//
//  Created by yusuf demirkoparan on 6.11.2019.
//  Copyright © 2019 yusuf demirkoparan. All rights reserved.
//

import UIKit

final class HomeDetailSectionShowCell: UITableViewCell {
    lazy var title: UILabel = UILabel.setLabel(fontStyle: UIFont.setFontType(.bold, .title),
                                               textColor: UIColor.black,
                                               textAlignment: NSTextAlignment.left,
                                               numberOfLines: 1)
    lazy var detailView: UIView = {
        var view = UIView()
        view.layer.cornerRadius = 9
        return view
    }()
    
    lazy var viewIcon: UIImageView = {
        var img = UIImageView()
        img.contentMode = .scaleAspectFit
        img.alpha = 0.6
        return img
    }()
    
    lazy var viewIconTitle = UILabel.setLabel(fontStyle: UIFont.setFontType(.bold, .title),
                                              textColor: UIColor.white,
                                              textAlignment: NSTextAlignment.left,
                                              numberOfLines: 1)
    
    lazy var viewRightArrow: UIImageView = {
        var img = UIImageView()
        img.contentMode = .scaleAspectFit
        img.image = UIImage(named: "roleRightArrow")?.withRenderingMode(.alwaysTemplate)
        img.tintColor = UIColor.white
        return img
    }()
    
    lazy var tempLabel = UILabel.setLabel(fontStyle: UIFont.setFontType(.bold, .title),
                                          textColor: UIColor.white,
                                          textAlignment: NSTextAlignment.left,
                                          numberOfLines: 1)
    
    lazy var tempType = UILabel.setLabel(fontStyle: UIFont.setFontType(.regular, .normally),
                                         textColor: UIColor.white,
                                         textAlignment: NSTextAlignment.left,
                                         numberOfLines: 1)
    
    lazy var tempLabel2 = UILabel.setLabel(fontStyle: UIFont.setFontType(.bold, .title),
                                           textColor: UIColor.white,
                                           textAlignment: NSTextAlignment.left,
                                           numberOfLines: 1)
    
    lazy var tempType2: UILabel = UILabel.setLabel(fontStyle: UIFont.setFontType(.regular, .normally),
                                                   textColor: UIColor.white,
                                                   textAlignment: NSTextAlignment.left,
                                                   numberOfLines: 1)
    
    lazy var motivationTitle = UILabel.setLabel(fontStyle: UIFont.setFontType(.regular, .normally),
                                                textColor: UIColor.white,
                                                textAlignment: NSTextAlignment.left,
                                                numberOfLines: 1)
    
    lazy var motivationDesc = UILabel.setLabel(fontStyle: UIFont.setFontType(.bold, .title),
                                               textColor: UIColor.white,
                                               textAlignment: NSTextAlignment.left,
                                               numberOfLines: 1)
    
    lazy var detailButton = UIButton()
    
    func configure(data: HomeShowUIModel) {
        title.text = data.title
        detailView.backgroundColor = hexStringToUIColor(hex: data.backgroundColor)
        viewIcon.image = UIImage(named: data.iconName)
        viewIconTitle.text = data.cardTitle
        tempLabel.text = "Mizaç Testi"
        detailButton = UIButton.setFramelessButton(title: data.buttonText ?? "", generalColor: hexStringToUIColor(hex: data.backgroundColor))
        setTemp(data.lognDescription)
        motivationTitle.text = data.shortDescription
        motivationDesc.text = data.shortDescription2 ?? " "
        self.setupLayout()
    }
    
    private func setTemp(_ splitTemperamentString: String?) {
        if let strongTemp = splitTemperamentString {
            let items = strongTemp.components(separatedBy: " ")
            self.tempLabel.text = items[2] + " -"
            self.tempType.text = items[0] + " " + items[1]
            self.tempLabel2.text = items[5] + " -"
            self.tempType2.text = items[3] + " " + items[4]
        } else {
            self.tempLabel.text = "Mizaç Testi Çözülmemiş"
            
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension HomeDetailSectionShowCell {
    fileprivate func setupLayout() {
        self.addSubview(title)
        title.top(to: self, offset: 16)
        title.left(to: self, offset: 16)
        title.width(150)
        title.height(20)
        
        self.addSubview(self.detailView)
        self.detailView.left(to: self, offset: 16)
        self.detailView.right(to: self, offset: -16)
        self.detailView.topToBottom(of: self.title, offset: 16)
        self.detailView.bottomToSuperview()
        
        detailView.addSubview(viewIcon)
        viewIcon.left(to: detailView, offset: +8)
        viewIcon.top(to: detailView, offset: +8)
        viewIcon.width(25)
        viewIcon.height(25)
        
        detailView.addSubview(viewIconTitle)
        viewIconTitle.leftToRight(of: viewIcon, offset: 8)
        viewIconTitle.top(to: detailView, offset: 8)
        viewIconTitle.alpha = 0.6
        
        detailView.addSubview(viewRightArrow)
        viewRightArrow.right(to: detailView, offset: -8)
        viewRightArrow.top(to: detailView, offset: +10)
        viewRightArrow.height(10)
        
        let topContainer = UIStackView(arrangedSubviews: [tempLabel, tempType])
        topContainer.distribution = .fillProportionally
        topContainer.axis = .horizontal
        topContainer.spacing = 10
        
        detailView.addSubview(topContainer)
        topContainer.topToBottom(of: viewIconTitle, offset: 20)
        topContainer.left(to: detailView, offset: 16)
        
        topContainer.height(20)
        
        let centerContainer = UIStackView(arrangedSubviews: [tempLabel2, tempType2])
        centerContainer.distribution = .fillProportionally
        centerContainer.axis = .horizontal
        centerContainer.spacing = 10
        
        detailView.addSubview(centerContainer)
        centerContainer.left(to: detailView, offset: 16)
        centerContainer.topToBottom(of: topContainer, offset: 10)
        centerContainer.height(20)
        
        let footerContainer = UIStackView(arrangedSubviews: [motivationTitle, motivationDesc])
        footerContainer.distribution = .fillProportionally
        footerContainer.axis = .vertical
        footerContainer.spacing = 10
        self.detailView.addSubview(footerContainer)
        footerContainer.left(to: detailView, offset: 16)
        footerContainer.topToBottom(of: centerContainer, offset: 20)
        footerContainer.height(40)
        
        detailView.addSubview(detailButton)
        detailButton.bottom(to: detailView, offset: -16)
        detailButton.left(to: detailView, offset: 16)
        detailButton.right(to: detailView, offset: -16)
        detailButton.height(45)
    }
    
}
