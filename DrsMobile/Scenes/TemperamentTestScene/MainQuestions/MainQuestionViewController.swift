//
//  MainQuestionViewController.swift
//  DrsMobile
//
//  Created by yusuf demirkoparan on 11.11.2019.
//  Copyright © 2019 yusuf demirkoparan. All rights reserved.
//

import UIKit

final class MainQuestionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    // MARK: - Properties
    var viewModel: MainQuestionVMDelegate! {
        didSet {
            viewModel.delegate = self
        }
    }
    var questionData = [QuestionPresentation]()
    
    // MARK: - Init
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.fetchQuestion()
        setupLayout()
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return questionData.count
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell0", for: indexPath) as? MainQuestionCell
        cell?.templateView.slider.addTarget(self, action: #selector(onChangedSliderValue(_:)), for: .valueChanged)
        let data = questionData.filter({ $0.rowId == indexPath.row })
        cell?.configure(indexPath: indexPath.row, data: data[0])
        cell?.templateView.nextBtn.addTarget(self, action: #selector(nextBtnTabbed(_:)), for: .touchUpInside)
        cell?.templateView.backBtn.addTarget(self, action: #selector(backBtnTabbed(_:)), for: .touchUpInside)
        return cell ?? UICollectionViewCell()
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = UIScreen.main.bounds.width
        let height = UIScreen.main.bounds.height
        return CGSize(width: width, height: height)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
        
    }
    
    // MARK: - Selectors
    
    /// add question score
    @objc func onChangedSliderValue(_ sender: UISlider) {
        questionData[sender.tag].score = Int(sender.value)
        
    }
    
    @objc func nextBtnTabbed(_ sender: UIButton) {
        if sender.tag == questionData.count-1 {
            /// if user complete test
            viewModel.sendAnswers(questionData)
            navigationController?.pushViewController(WingQuestionViewController(), animated: true)
            
        } else {
            /// switch between the collection cell
            let indexPath = IndexPath(item: sender.tag+1, section: 0)
            collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
            
        }
    }
    
    @objc func backBtnTabbed(_ sender: UIButton) {
        if sender.tag != 0 {
            let indexPath = IndexPath(item: sender.tag-1, section: 0)
            collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
            
        }
    }
    
}

// MARK: - View Model Outputs
extension MainQuestionViewController: MainQuestionVMOutputDelegate {
    func handleViewModelOutputs(_ outputs: MainQuestionVMOutputs) {
        switch outputs {
        case .error:
            // olumsuz senaryo
            print("error")
            
        case .questionList(let data):
            /// when i fetch temparemnt questions
            questionData = data
            collectionView.reloadData()
            
        }
        
    }
}

extension MainQuestionViewController {
    fileprivate func setupLayout() {
        collectionView.backgroundColor = .white
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.isPagingEnabled = true
        collectionView.register(MainQuestionCell.self, forCellWithReuseIdentifier: "cell0")
        self.title = "Mizaç Testi"
        
    }
}
