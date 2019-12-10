//
//  HomeViewController.swift
//  DrsMobile
//
//  Created by yusuf demirkoparan on 30.10.2019.
//  Copyright © 2019 yusuf demirkoparan. All rights reserved.
//

import UIKit
import TinyConstraints

enum HomeSections: Int {
    case userSection = 0
    case detailSection = 1
    
}

enum CellIdentifier: String {
    case userSection = "cell"
    case userHideDetail = "cell2"
    case userShowDetail = "cell3"
    
}

enum CellTitle: String {
    case test = "Testlerim"
    case survey = "Anketlerim"
    case classes = "Sınıflarım"
    case student = "Öğrencilerim"
    case parent = "Parent"
    
}

final class HomeViewController: UITableViewController {
    // MARK: - Properties
    var viewModel: HomeVMDelegate! {
        didSet {
            viewModel.delegate = self
        }
    }
    
    var userSection = HomeUserSection()
    var detailSection = HomeDetailSection()
    var tableRowCount = Int()
    var homeData: HomeUIData?
    
    // MARK: - Init
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        viewModel.load()
        setupLayout()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        detailSection.segmentedControl.addTarget(self, action: #selector(changedValue(_:)), for: .valueChanged)
        tabBarController?.tabBar.isHidden = false
        
    }
 
    // MARK: - Selectors
    @objc func changedValue(_ sender: UISegmentedControl) {
        /// When change user segmented index i reload cells design
        tableView.beginUpdates()
        sender.selectedSegmentIndex == 0
            ? tableView.register(HomeDetailSectionHideCell.self, forCellReuseIdentifier: CellIdentifier.userHideDetail.rawValue)
            : tableView.register(HomeDetailSectionShowCell.self, forCellReuseIdentifier: CellIdentifier.userShowDetail.rawValue)
        tableView.reloadData()
        tableView.endUpdates()
        
    }
}

// MARK: - ViewModel Outputs
extension HomeViewController: HomeVMOutputDelegate {
    func handleVMOutputs(_ viewModelOutputs: HomeVMOutputs) {
        switch viewModelOutputs {
        case .homeUIData(let data):
            self.homeData = data
            tableView.reloadData()
            
        }
    }
}

extension HomeViewController {
    fileprivate func setupLayout() {
        self.navigationItem.title = "Özet"
        tableView.tableHeaderView = UIView(frame: .zero)
        tableView.tableFooterView = UIView(frame: .zero)
        tableView.register(HomeDetailSectionHideCell.self, forCellReuseIdentifier: CellIdentifier.userHideDetail.rawValue)
        tableView.register(HomeUserSectionCell.self, forCellReuseIdentifier: CellIdentifier.userSection.rawValue)
        
    }
}

extension HomeViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        /// set section count
        return 2
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        /// set section cells count
        switch section {
        case 0:
            return 1
            
        case 1:
            return homeData?.homeHideUI.count ?? 0
            
        default: return 0
            
        }
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        /// set which section when used
        switch section {
        case 0:
            return userSection
            
        case 1:
            return detailSection
            
        default:
            return UIView()
            
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        /// Section Height
        return  CGFloat(60)
        
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        /// set section cell height
        switch indexPath.section {
        case 0:
            return 100
            
        case 1:
            return detailSection.segmentedControl.selectedSegmentIndex == 1
                ? indexPath.row == 0 ? 300 : 220 /// gived the optimal size
                : 160
            
        default:
            return 0
            
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            /// will come here user detail
            let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier.userSection.rawValue) as? HomeUserSectionCell
            cell?.configure(userName: "Perihan Yıldız Bayraktaroğlu", userType: "Rehber Öğretmen")
            return cell ?? UITableViewCell()
            
        case 1:
            /// set detail section
            let currentIndex = detailSection.segmentedControl.selectedSegmentIndex
            return currentIndex == 0
                ? {
                    let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier.userHideDetail.rawValue) as? HomeDetailSectionHideCell
                    if let strongData = homeData?.homeHideUI {
                        cell?.configure(data: strongData[indexPath.row])
                        
                    }
                    
                    return cell ?? UITableViewCell()
                    }()
                : {
                    let  cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier.userShowDetail.rawValue) as? HomeDetailSectionShowCell
                    
                    if let strongData = homeData?.homeShowUI {
                        cell?.configure(data: strongData[indexPath.row])
                    }
                    
                    return cell ?? UITableViewCell()
                }()
            
        default:
            return UITableViewCell()
            
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // todo i went to user profile when i clicked user profile
        // enum olacak
        let currentCell = tableView.cellForRow(at: indexPath) as? HomeDetailSectionHideCell
        guard let strongCell = currentCell else { return }
        
        if strongCell.title.text == CellTitle.test.rawValue || strongCell.title.text == CellTitle.survey.rawValue {
            viewModel.routeToOtherPages(.routeToTestOrSurvey)
        } else if strongCell.title.text == CellTitle.classes.rawValue {
            viewModel.routeToOtherPages(.routeToClass)
            
        } else if strongCell.title.text == CellTitle.parent.rawValue {
            viewModel.routeToOtherPages(.routeToParent)
            
        } else if strongCell.title.text == CellTitle.student.rawValue {
            viewModel.routeToOtherPages(.routeToStundent)
            
        }
    }
}
