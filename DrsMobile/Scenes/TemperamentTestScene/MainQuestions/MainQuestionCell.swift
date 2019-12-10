//
//  MainQuestionCell.swift
//  DrsMobile
//
//  Created by yusuf demirkoparan on 15.11.2019.
//  Copyright © 2019 yusuf demirkoparan. All rights reserved.
//

import UIKit

final class MainQuestionCell: UICollectionViewCell {
    let scrollView = UIScrollView()
    let questionText: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont.setFontType(.regular, .title)
        lbl.numberOfLines = 0
        lbl.minimumScaleFactor = 1
        lbl.adjustsFontSizeToFitWidth = false
        lbl.textAlignment = .left
        return lbl
    }()
    var templateView = TemperamentTestTemplate()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
        templateView.slider.addTarget(self, action: #selector(onChangedSliderValue(_:)), for: .valueChanged)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }
    
    /// Configure Details
    /// - Parameters:
    ///   - indexPath: indexArray
    ///   - data: you can get any items
    ///   - templateView: When user phone height is short i show or hide blurview
    func configure(indexPath: Int, data: QuestionPresentation) {
        /// When user tabbed the back or next btn i will check it tag and swipe the screen
        templateView.nextBtn.tag = indexPath
        templateView.backBtn.tag = indexPath
        questionText.text = data.text
        
        /// get a label text height
        let getTextHeight  = questionText.text?.heightWithConstrainedWidth(width: UIScreen.main.bounds.width*0.9, font: UIFont.setFontType(.regular, .title))
        scrollView.contentSize = CGSize(width: UIScreen.main.bounds.width*0.9, height: getTextHeight!+CGFloat.setConstraint(150, 180) )
        populateSlider(data: data)
        
    }
    
    // MARK: - Selectors
    @objc func onChangedSliderValue(_ sender: UISlider) {
        templateView.sliderScore.text = String(Int(sender.value))
        
    }
    
    private func populateSlider(data: QuestionPresentation) {
        templateView.slider.tag = data.rowId ?? 0
        templateView.slider.setValue(Float(data.score ?? 0 ), animated: false)
        templateView.sliderScore.text = String(data.score ?? 0)
        
    }
}

extension MainQuestionCell {
    fileprivate func setupLayout() {
        self.backgroundColor = .white
        addSubview(scrollView)
        scrollView.topToSuperview()
        scrollView.leftToSuperview()
        scrollView.rightToSuperview()
        scrollView.bottom(to: self, offset: -UIScreen.main.bounds.height*0.15)
        
        scrollView.addSubview(questionText)
        questionText.top(to: scrollView, offset: CGFloat.setConstraint(50, 80))
        questionText.width(UIScreen.main.bounds.width*0.9)
        questionText.centerX(to: self)
        
        self.addSubview(templateView)
        templateView.bottom(to: self)
        templateView.height(CGFloat.setConstraint(170, 200))
        templateView.leftToSuperview()
        templateView.rightToSuperview()
        
    }
}
