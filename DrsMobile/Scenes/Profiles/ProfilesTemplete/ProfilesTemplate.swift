//
//  ProfilesTemplate.swift
//  DrsMobile
//
//  Created by yusuf demirkoparan on 8.11.2019.
//  Copyright © 2019 yusuf demirkoparan. All rights reserved.
//

import UIKit

class ProfileTemplateVC: UIViewController {
    // MARK: - Properties
    var profileData: ProfilePresentation?
    let tableView = UITableView()
    lazy var profileIcon = UIImageView.setImage(imageName: "ProfileIcon", tintColor: .white)
    lazy var userName = UILabel.setLabel(fontStyle: UIFont.setFontType(.bold, .title),
                                         textColor: UIColor.white,
                                         textAlignment: NSTextAlignment.center,
                                         numberOfLines: 1)
    lazy var userDetail = UILabel.setLabel(fontStyle: UIFont.setFontType(.regular, .small),
                                           textColor: UIColor.white,
                                           textAlignment: NSTextAlignment.center,
                                           numberOfLines: 1)
    // MARK: - Init
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        
    }
    
    fileprivate func setupLayout() {
        view.backgroundColor = .mainColor
        view.layer.cornerRadius = 30
        
        view.backgroundColor = .mainColor
        view.addSubview(profileIcon)
        profileIcon.top(to: view, offset: UIScreen.main.bounds.height*0.15)
        profileIcon.centerX(to: view)
        profileIcon.width(100)
        profileIcon.height(100)
        
        view.addSubview(userName)
        userName.topToBottom(of: profileIcon, offset: 10)
        userName.centerX(to: view)
        userName.height(20)
        userName.width(120)
        
        view.addSubview(userDetail)
        userDetail.topToBottom(of: userName)
        userDetail.centerX(to: view)
        userDetail.width(100)
        userDetail.height(15)
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(ProfilesTempleteCell.self, forCellReuseIdentifier: "cell")
        tableView.tableFooterView = UIView(frame: .zero)
        tableView.tableHeaderView = UIView()
        tableView.layer.cornerRadius = 30
        
        view.addSubview(tableView)
        tableView.topToBottom(of: userDetail, offset: 30)
        tableView.leftToSuperview()
        tableView.rightToSuperview()
        tableView.bottomToSuperview()
    }
}

extension ProfileTemplateVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return profileData?.rowData?.count ?? 0
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? ProfilesTempleteCell
        cell?.configure(self.profileData?.rowData?[indexPath.row])
        return cell ?? UITableViewCell()
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
        
    }
}
