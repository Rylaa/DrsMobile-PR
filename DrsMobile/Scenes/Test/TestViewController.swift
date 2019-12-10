//
//  TestViewController.swift
//  DrsMobile
//
//  Created by yusuf demirkoparan on 31.10.2019.
//  Copyright © 2019 yusuf demirkoparan. All rights reserved.
//

import UIKit

final class TestViewController: UIViewController {
    
    // MARK: - Properties
    var viewModel: TestVMDelegate! {
        didSet {
            viewModel.delegate = self
            
        }
    }
    lazy var viewHeader = TestHeaderView()
    lazy var tempShowReport = false
    
    // MARK: - Init
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.load()
        setupNavBarIcoN()
        setupTableView()
        view.backgroundColor = .white
        
    }
    
    // MARK: - Selectors
    @objc func routeOtherPages(_ sender: UIButton) {
        sender.tag == 0 ? viewModel.routeTest() : viewModel.routeSurvey()
        
    }
}

// MARK: - ViewModel outputs
extension TestViewController: TestVMOutputDelegate {
    func handleVMOutputs(_ outputs: TestVMOutputs) {
        switch outputs {
        case .isTheTestSolved(let isTestSolved):
            tempShowReport = isTestSolved
        
        }
        
    }
}

extension TestViewController {
    fileprivate func setupTableView() {
        let tableView = UITableView()
        view.addSubview(tableView)
        tableView.top(to: view)
        tableView.leftToSuperview()
        tableView.rightToSuperview()
        tableView.bottomToSuperview()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(TestTableCell.self, forCellReuseIdentifier: "Cell1")
        tableView.tableFooterView = UIView(frame: .zero)
        
    }
}

extension TestViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell1") as? TestTableCell
        cell?.configure(indexPath: indexPath.row, solvedTest: tempShowReport)
        cell?.frameButton.addTarget(self, action: #selector(routeOtherPages(_:)), for: .touchUpInside)
        return cell ?? UITableViewCell()
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
        
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return viewHeader
        
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 200
        
    }
}
