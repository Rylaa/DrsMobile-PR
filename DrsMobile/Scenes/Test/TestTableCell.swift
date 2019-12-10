//
//  TestTableCell.swift
//  DrsMobile
//
//  Created by yusuf demirkoparan on 7.11.2019.
//  Copyright © 2019 yusuf demirkoparan. All rights reserved.
//

import UIKit

final class TestTableCell: UITableViewCell {
    lazy var topView = UIView()
    lazy var title =  UILabel.setLabel(fontStyle: UIFont.setFontType(.bold, .title),
                                       textColor: UIColor.black,
                                       textAlignment: NSTextAlignment.left,
                                       numberOfLines: 1)
    lazy var rightArrow = UIImageView.setImage(imageName: "roleRightArrow", tintColor: UIColor.black)
    lazy var framelessButton = UIButton.setButtonStyle(title: "Raporu Göster",
                                                       titleColor: UIColor.mainColor,
                                                       backgroundColor: UIColor.white,
                                                       borderColor: UIColor.mainColor, cornerRadius: 10)
    
    lazy var frameButton = UIButton()
    // MARK: - Configure Cell
    func configure(indexPath: Int, solvedTest: Bool) {
        switch indexPath {
        case 0:
            title.text = "Mizaç testi"
            self.solvedTest(solvedTest: solvedTest)
            frameButton = UIButton.setButtonStyle(title: "Teste Başla",
                                                  titleColor: UIColor.white,
                                                  backgroundColor: UIColor.mainColor,
                                                  borderColor: UIColor.mainColor,
                                                  cornerRadius: 10)
            
        case 1:
            title.text = "Kişisel gelişim anketi"
            frameButton = UIButton.setButtonStyle(title: "Ankete Başla",
                                                  titleColor: UIColor.white,
                                                  backgroundColor: UIColor.mainColor,
                                                  borderColor: UIColor.mainColor,
                                                  cornerRadius: 10)
            
        default:
            break
        }
        frameButton.tag = indexPath
        framelessButton.tag = indexPath
        setupLayout()
        
    }
    
    // if user solved test, show report button is enable
    fileprivate func solvedTest(solvedTest: Bool) {
        if !solvedTest {
            framelessButton.layer.borderColor = UIColor.lightGray.cgColor
            framelessButton.setTitleColor(UIColor.lightGray, for: .normal)
            
        } else {
            framelessButton.layer.borderColor = UIColor.mainColor.cgColor
            framelessButton.setTitleColor(UIColor.mainColor, for: .normal)
            
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

extension TestTableCell {
    fileprivate func setupLayout() {
        self.addSubview(topView)
        topView.top(to: self, offset: 16)
        topView.left(to: self, offset: 16)
        topView.right(to: self, offset: -16)
        topView.height(60)
        
        topView.addSubview(title)
        title.left(to: topView)
        
        topView.addSubview(rightArrow)
        rightArrow.right(to: topView)
        
        let bottomContainer = UIStackView(arrangedSubviews: [framelessButton, frameButton])
        bottomContainer.axis = .vertical
        bottomContainer.distribution = .fillEqually
        bottomContainer.spacing = 10
        
        self.addSubview(bottomContainer)
        bottomContainer.topToBottom(of: topView, offset: 5)
        bottomContainer.left(to: self, offset: 16)
        bottomContainer.right(to: self, offset: -16)
        bottomContainer.height(85)
        
    }
}
