//
//  ProfileViewModel.swift
//  DrsMobile
//
//  Created by yusuf demirkoparan on 31.10.2019.
//  Copyright © 2019 yusuf demirkoparan. All rights reserved.
//

import Foundation
/// Dependcy Inversion
protocol ProfileVMDelegate: AnyObject {
    var delegate: ProfileVMOutputDelegate? { get set }
    func load()
    func route()
    
}
/// View Model outputs
protocol  ProfileVMOutputDelegate: AnyObject {
    func handleVMOutputs(_ viewModelOutputs: ProfileVMOutputs)
}
/// Output data
enum ProfileVMOutputs {
    case profileData(ProfilePresentation)
}

final class ProfileViewModel: ProfileVMDelegate {
    /// Properties
    weak var delegate: ProfileVMOutputDelegate?
    weak var coordinator: ProfileCoordinator?
    
    /// init
    init() {
        
    }
    
    // MARK: Handlers
    func load() {
        let result = getUserDetails()
        if let strongResult = result {
            notify(.profileData(strongResult))
        }
        
    }
    ///I got user details with userdefaults
    fileprivate func getUserDetails() -> ProfilePresentation? {
        /// Note: I saved user detail in UserDefaults  when user logged in
        if
            let data = UserDefaults.standard.value(forKey: "UserData") as? Data,
            let configuration = try? JSONDecoder().decode(LoginData.self, from: data) {
            return createStaticData(userData: configuration)
        } else {
            return nil
        }
    }
    ///
    fileprivate func createStaticData(userData: LoginData) -> ProfilePresentation? {
        let data0 = ProfileDetailPresentation(title: "Mizaç Testi", description: String.parseTemperamentString(userData.temperament?.name))
        let data1 = ProfileDetailPresentation(title: "Temel Motivasyonu", description: userData.temperament?.motivation ?? "Temel Motivasyon Bulunamadı")
        let data2 = ProfileDetailPresentation(title: "İletişim Bilgileri", description: userData.email)
        let data = ProfilePresentation(userName: userData.name, userDetail: userData.gender, rowData: [data0, data1, data2])
        return data
        
    }
    
    func route() {
        
    }
    
    /// Output of implement
    fileprivate func notify(_ viewModelOutputs: ProfileVMOutputs) {
        delegate?.handleVMOutputs(viewModelOutputs)
        
    }
}
