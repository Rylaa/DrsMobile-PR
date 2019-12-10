//
//  TwoQuestionTemplate.swift
//  DrsMobile
//
//  Created by yusuf demirkoparan on 21.11.2019.
//  Copyright © 2019 yusuf demirkoparan. All rights reserved.
//

import UIKit
/*
 Here draws two question and slider in view
 this is a template
 */

class TwoQuestionTemplate: UIViewController {
    // MARK: - Properties
    var templateView = QuestionUITemplate()
    var templateView2 = QuestionUITemplate()
    var footerTemplate = TemperamentTestFooterTemplate()
    let scrollView = UIScrollView()
    
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
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTemplate()
        
    }
    
}

extension TwoQuestionTemplate {
    /// implement view components
    fileprivate func setupTemplate() {
        navigationItem.setHidesBackButton(true, animated: false)
        view.backgroundColor = .white
        
        view.addSubview(scrollView)
        scrollView.top(to: view)
        scrollView.widthToSuperview()
        scrollView.bottom(to: view, offset: -UIScreen.main.bounds.height*0.15)
        scrollView.contentSize = CGSize(width: UIScreen.main.bounds.width,
                                        height: UIScreen.main.bounds.height*0.8+10)
        
        scrollView.addSubview(templateView)
        templateView.top(to: scrollView)
        templateView.widthToSuperview()
        templateView.height(UIScreen.main.bounds.height*0.35)
        
        scrollView.addSubview(templateView2)
        templateView2.topToBottom(of: templateView, offset: 16)
        templateView2.widthToSuperview()
        templateView2.height(UIScreen.main.bounds.height*0.35)
        
        view.addSubview(footerTemplate)
        footerTemplate.bottom(to: view)
        footerTemplate.widthToSuperview()
        footerTemplate.height(CGFloat.setConstraint(130, 160))
       
    }
}
