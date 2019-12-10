//
//  IntroViewController.swift
//  DrsMobile
//
//  Created by yusuf demirkoparan on 23.10.2019.
//  Copyright © 2019 yusuf demirkoparan. All rights reserved.
//

import Foundation
import UIKit
import TinyConstraints

final class IntroViewController: UICollectionViewController {
    // MARK: - Properties
    var viewModel: IntroVMDelegate! {
        didSet {
            viewModel.delegate = self
        }
        
    }
    var introData = [Intro]()
    
    lazy var pageControl: UIPageControl = {
        let pageC = UIPageControl()
        pageC.currentPage = 0
        pageC.currentPageIndicatorTintColor = UIColor.mainColor
        pageC.pageIndicatorTintColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 0.5039865154)
        
        return pageC
    }()
    
    lazy var skipIntro: UIButton = {
        var btn = UIButton()
        btn.setTitle("Tanıtımı Geç", for: .normal)
        btn.setTitleColor(UIColor.lightbrownishGrey, for: .normal)
        btn.titleLabel?.numberOfLines = 1
        btn.titleLabel?.font = UIFont.setFontType(.regular, .small)
        btn.addTarget(self, action: #selector(tabbedButton), for: .touchUpInside)
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.load()
        setupCollectionView()
        setupLayout()
        setupNavigationBar()
        
    }
    
    // MARK: - Selectors
    @objc func tabbedButton() {
        viewModel.router()
        
    }
    
    deinit {
        print("Intro deinit")
    }
    
}

// MARK: - ViewModel Outputs
extension IntroViewController: IntroVMOutputDelegate {
    func handleViewModelOutput(_ outputs: IntroVMOutputs) {
        switch outputs {
            
        case .isloading(let isLoading):
            isLoading ? view.activitySetup(activityColor: UIColor.gray)
                : view.activityStopAnimating()
            
        case .introData(let introData):
            self.introData = introData
            pageControl.numberOfPages = introData.count
            collectionView.reloadData()
        }
    }
    
}

// MARK: - Implement CollectionView
extension IntroViewController {
    fileprivate func setupLayout() {
        view.addSubview(pageControl)
        pageControl.bottom(to: view, offset: -(30))
        pageControl.height(view.frame.height*0.1)
        pageControl.width(100)
        pageControl.centerX(to: view)
        
        view.addSubview(skipIntro)
        skipIntro.top(to: view, offset: UIScreen.main.bounds.height*0.05)
        skipIntro.right(to: view, offset: -10)
        
    }
    
    fileprivate func setupNavigationBar() {
        navigationController?.setNavigationBarHidden(true, animated: true)
        
    }
    
}

extension IntroViewController: UICollectionViewDelegateFlowLayout {
    fileprivate func setupCollectionView() {
        collectionView.register(IntroCell.self, forCellWithReuseIdentifier: "cellID")
        collectionView.backgroundColor = .white
        collectionView.isPagingEnabled = true
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return introData.count
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellID", for: indexPath) as? IntroCell
        cell?.configure(indexPath.row, self.introData[indexPath.row], introData.count)
        cell?.completeIntro.addTarget(self, action: #selector(tabbedButton), for: .touchUpInside)
        return cell ?? UICollectionViewCell()
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
        
    }
    
    override func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        // when we drag next question, update the page control current page
        let xOffset = targetContentOffset.pointee.x
        pageControl.currentPage = Int(xOffset/view.frame.width)
        
    }
}
