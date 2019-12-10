//
//  ThreeQuestionTemplate.swift
//  DrsMobile
//
//  Created by yusuf demirkoparan on 21.11.2019.
//  Copyright © 2019 yusuf demirkoparan. All rights reserved.
//

import UIKit
/*
Here draws three question and slider in view
this is a template
*/
class ThreeQuestionTemplate: UIViewController {
    // MARK: - Properties
    var firstQuestion = QuestionUITemplate()
    var secondQuestion = QuestionUITemplate()
    var thirdQuestion = QuestionUITemplate()
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

extension ThreeQuestionTemplate {
    /// implement view components
    fileprivate func setupTemplate() {
        navigationItem.setHidesBackButton(true, animated: false)
        view.backgroundColor = .white
        
        view.addSubview(scrollView)
        scrollView.top(to: view)
        scrollView.widthToSuperview()
        scrollView.bottom(to: view, offset: -UIScreen.main.bounds.height*0.15)
        scrollView.contentSize = CGSize(width: UIScreen.main.bounds.width,
                                        height: UIScreen.main.bounds.height+150)
        
        scrollView.addSubview(firstQuestion)
        firstQuestion.top(to: scrollView)
        firstQuestion.widthToSuperview()
        firstQuestion.height(UIScreen.main.bounds.height*0.35)
        
        scrollView.addSubview(secondQuestion)
        secondQuestion.topToBottom(of: firstQuestion, offset: 16)
        secondQuestion.widthToSuperview()
        secondQuestion.height(UIScreen.main.bounds.height*0.35)
        
        scrollView.addSubview(thirdQuestion)
        thirdQuestion.topToBottom(of: secondQuestion, offset: 16)
        thirdQuestion.widthToSuperview()
        thirdQuestion.height(UIScreen.main.bounds.height*0.35)
        
        view.addSubview(footerTemplate)
        footerTemplate.bottom(to: view)
        footerTemplate.widthToSuperview()
        footerTemplate.height(CGFloat.setConstraint(130, 160))
       
    }
}
