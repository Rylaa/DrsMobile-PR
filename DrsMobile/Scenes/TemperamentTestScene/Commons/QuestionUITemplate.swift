//
//  QuestionUITemplate.swift
//  DrsMobile
//
//  Created by yusuf demirkoparan on 19.11.2019.
//  Copyright © 2019 yusuf demirkoparan. All rights reserved.
//

/*
   This class give the a question with slider
 */

import UIKit
final class QuestionUITemplate: UIView {
    lazy var questionText = UILabel.setLabel(fontStyle: UIFont.setFontType(.regular, .title),
                                             textColor: UIColor.black,
                                             textAlignment: NSTextAlignment.left,
                                             numberOfLines: 0)
    
    lazy var slider: UISlider = {
        var sld = UISlider()
        sld.minimumTrackTintColor = UIColor.mainColor
        sld.maximumTrackTintColor = UIColor.mainColor.withAlphaComponent(0.5)
        sld.thumbTintColor = UIColor.paleGrayTwo
        sld.minimumValue = 0
        sld.maximumValue = 100
        return sld
        
    }()
    
    lazy var sliderScore: UILabel = {
        var lbl = UILabel()
        lbl.textColor = UIColor.mainColor
        lbl.font = UIFont.setFontType(.bold, .title)
        return lbl
        
    }()
    
    fileprivate func setupLayout() {
        addSubview(questionText)
        questionText.width(UIScreen.main.bounds.width*0.9)
        questionText.height(UIScreen.main.bounds.height*0.3)
        questionText.centerX(to: self)
        
        addSubview(slider)
        slider.topToBottom(of: questionText, offset: 5)
        slider.left(to: self, offset: UIScreen.main.bounds.width*0.05)
        slider.right(to: self, offset: -70)
        
        addSubview(sliderScore)
        sliderScore.topToBottom(of: questionText, offset: 5)
        sliderScore.leftToRight(of: slider, offset: 5)
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        questionText.text = "Daha dikkat çekici ve dışa dönük biriyimdir. Çevremdekilerle daha sıcak ve yakın ilişkiler kurarım. Sosyal becerilerim çok yüksektir, istediğim her ortama adapte olabilirim. İlişki kurduğum herkesi kolay yönlendirebilirim. Daha alıngan olmam nedeniyle ani duygusal tepkiler verip hırçınlaşabilirim."
        sliderScore.text = "100%"
        setupLayout()
        self.backgroundColor = .white
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
