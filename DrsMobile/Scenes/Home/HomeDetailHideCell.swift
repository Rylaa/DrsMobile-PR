//
//  HomeTableCell.swift
//  DrsMobile
//
//  Created by yusuf demirkoparan on 1.11.2019.
//  Copyright © 2019 yusuf demirkoparan. All rights reserved.
//

import UIKit

final class HomeDetailSectionHideCell: UITableViewCell {
    lazy var title: UILabel = {
        var lbl = UILabel.setLabel(fontStyle: UIFont.setFontType(FontTypes.bold, FontSize.title),
                                   textColor: UIColor.black,
                                   textAlignment: NSTextAlignment.left,
                                   numberOfLines: 1)
        return lbl
    }()
    
    lazy var detailView: UIView = {
        var view = UIView()
        view.layer.cornerRadius = 9
        return view
    }()
    
    lazy var viewIcon: UIImageView = {
        var img = UIImageView()
        img.contentMode = .scaleAspectFit
        return img
    }()
    
    lazy var viewIconTitle: UILabel = {
        var lbl = UILabel.setLabel(fontStyle: UIFont.setFontType(FontTypes.bold, FontSize.title),
                                   textColor: UIColor.white,
                                   textAlignment: NSTextAlignment.left,
                                   numberOfLines: 1)
        
        return lbl
    }()
    
    lazy var viewRightArrow: UIImageView = {
        var img = UIImageView()
        img.contentMode = .scaleAspectFit
        img.image = UIImage(named: "roleRightArrow")?.withRenderingMode(.alwaysTemplate)
        img.tintColor = UIColor.white
        return img
    }()
    
    lazy var cartInformation: UILabel = {
        var lbl = UILabel.setLabel(fontStyle: UIFont.setFontType(FontTypes.regular, FontSize.normally),
                                   textColor: UIColor.white,
                                   textAlignment: NSTextAlignment.left,
                                   numberOfLines: 1)
        
        return lbl
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        setupLayout()
        
    }
    
    /// When tableView cells created
    /// - Parameter indexPath: cell indexPath
    /// - Parameter showDetail: if segmented control is showDetail(1) response true(showDetail = true)
    func configure(data: HomeHideUIModel) {
        title.text = data.title
        detailView.backgroundColor = hexStringToUIColor(hex: data.backgroundColor)
        viewIcon.image = UIImage(named: data.iconName)
        viewIconTitle.text = data.cardTitle
        cartInformation.text = data.description
        /// Gelen cell'e göre detaylandıracağız
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
/// setup view
extension HomeDetailSectionHideCell {
    fileprivate func setupLayout() {
        self.addSubview(title)
        title.top(to: self, offset: 16)
        title.left(to: self, offset: 16)
        title.width(150)
        title.height(20)
        
        self.addSubview(detailView)
        detailView.left(to: self, offset: 16)
        detailView.right(to: self, offset: -16)
        detailView.topToBottom(of: title, offset: 16)
        detailView.bottomToSuperview()
        
        detailView.addSubview(viewIcon)
        viewIcon.left(to: detailView, offset: +8)
        viewIcon.top(to: detailView, offset: +8)
        viewIcon.width(25)
        viewIcon.height(25)
        
        detailView.addSubview(viewIconTitle)
        viewIconTitle.leftToRight(of: viewIcon, offset: 8)
        viewIconTitle.top(to: detailView, offset: 8)
        
        detailView.addSubview(viewRightArrow)
        viewRightArrow.right(to: detailView, offset: -8)
        viewRightArrow.top(to: detailView, offset: +10)
        viewRightArrow.height(12)
        
        detailView.addSubview(cartInformation)
        cartInformation.left(to: detailView, offset: 16)
        cartInformation.topToBottom(of: viewIconTitle, offset: 20)
        cartInformation.height(20)
        
    }
}
