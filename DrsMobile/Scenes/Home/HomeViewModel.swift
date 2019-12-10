//
//  HomeViewModel.swift
//  DrsMobile
//
//  Created by yusuf demirkoparan on 30.10.2019.
//  Copyright © 2019 yusuf demirkoparan. All rights reserved.
//

import Foundation

protocol HomeVMDelegate: AnyObject {
    var delegate: HomeVMOutputDelegate? { get set }
    func load()
    func routeToOtherPages(_ routeTo: RouteToOtherPages)
    
}

protocol HomeVMOutputDelegate: AnyObject {
    func handleVMOutputs(_ viewModelOutputs: HomeVMOutputs)
    
}
/// we can send this items from viewmodel to view
enum HomeVMOutputs {
    case homeUIData(HomeUIData)
    
}

/// change page when user want
enum RouteToOtherPages {
    case routeToTestOrSurvey
    case routeToClass
    case routeToStundent
    case routeToParent
    
}

enum RoleTypes: String {
    case manager = "Manager"
    case parent = "Parent"
    case teacher = "Teacher"
    case child = "Child"
    
}

enum RoleColors: String {
    case testColor = "#4d54e2"
    case parentColor = "#ff8e35"
    case surveyColor = "#169ae6"
    case childColor = "#26c6da"
    case stundetClassColor = "#ef5350"
    
}

final class HomeViewModel: HomeVMDelegate {
    /// Properties
    weak var delegate: HomeVMOutputDelegate?
    weak var coordinator: HomeCoordinator?
    var userData: LoginData?
    let network: NetworkManager
    /// Init
    init(network: NetworkManager) {
        self.network = network
        getUserTemperamentDetail()
    }
    
    /*
     I gived static data because not any endpoint gives me this detail.
     I prefered this way
     */
    func load() {
        let role = UserDefaults.standard.string(forKey: "SelectedRole")
        guard let strongRole = role else { return }
        
        switch !strongRole.isEmpty {
        case RoleTypes.manager.rawValue == role || RoleTypes.teacher.rawValue ==  role:
            self.notify(.homeUIData(HomeUIData(homeHideUI: managerHideData, homeShowUI: managerShowData)))
            
        case RoleTypes.parent.rawValue == role:
            self.notify(.homeUIData(HomeUIData(homeHideUI: parentHideData, homeShowUI: parentShowData)))
            
        case RoleTypes.child.rawValue == role:
            self.notify(.homeUIData(HomeUIData(homeHideUI: childHideData, homeShowUI: childShowData)))
            
        default:
            break
        }
        
    }
    /// Move other pages when user clicked any row
    func routeToOtherPages(_ routeTo: RouteToOtherPages) {
        switch routeTo {
        case .routeToTestOrSurvey:
            coordinator?.routeToTestPage()
            
        case .routeToStundent:
            coordinator?.routeToStudentPage()
            
        case .routeToClass:
            coordinator?.routeToClassPage()
            
        case .routeToParent:
            print("todo")
            
        }
        
    }
    
    /// View Model  and view controller contract/data transfer
    fileprivate func notify (_ viewModelOutputs: HomeVMOutputs ) {
        delegate?.handleVMOutputs(viewModelOutputs)
        
    }
    
    ///
    private func getUserTemperamentDetail() {
        if let data = UserDefaults.standard.value(forKey: "UserData") as? Data,
            let configuration = try? JSONDecoder().decode(LoginData.self, from: data) {
            self.userData = configuration
            
        }
    }
    /*
     Burada datalar statik kullanıldı nedeni ise her bir detaya ulaşmak için
     aynı anda birden fazla endpoint ve data işlenmesi gerekiyordu.
     Bundan dolayı bu sayfaya özel tek endpoint hazırlanacak
     */
    var managerHideData: [HomeHideUIModel] = {
        let data = HomeHideUIModel(title: "Testlerim",
                                   cardTitle: "Sonuç Özetleri",
                                   iconName: "h00",
                                   description: "Mizaç Testi Çöz",
                                   backgroundColor: RoleColors.testColor.rawValue)
        let data1 = HomeHideUIModel(title: "Anketlerim",
                                    cardTitle: "Kişilik Gelişim Anketleri",
                                    iconName: "h04",
                                    description: "Kişilik Anketi Çöz", backgroundColor: RoleColors.surveyColor.rawValue)
        let data2 = HomeHideUIModel(title: "Sınıflarım",
                                    cardTitle: "Sınıf Listesi", iconName: "h01",
                                    description: "Sınıf Listesi",
                                    backgroundColor: RoleColors.stundetClassColor.rawValue)
        let data3 = HomeHideUIModel(title: "Öğrencilerim",
                                    cardTitle: "Öğrenci Listeleri", iconName: "h03",
                                    description: "Öğrenci Detayları",
                                    backgroundColor: RoleColors.childColor.rawValue)
        let data4 = HomeHideUIModel(title: "Veliler",
                                    cardTitle: "Veli Listesi",
                                    iconName: "h02",
                                    description: "Öğrenci Veli Detayları",
                                    backgroundColor: RoleColors.parentColor.rawValue)
        return [data, data1, data2, data3, data4]
    }()
    
    var parentHideData: [HomeHideUIModel] = {
        let data = HomeHideUIModel(title: "Testlerim",
                                   cardTitle: "Sonuç Özetleri",
                                   iconName: "h00",
                                   description: "Mizaç Testi Çöz",
                                   backgroundColor: RoleColors.testColor.rawValue)
        let data1 = HomeHideUIModel(title: "Anketlerim",
                                    cardTitle: "Kişilik Gelişim Anketleri",
                                    iconName: "h04",
                                    description: "Kişilik Anketi Çöz", backgroundColor: RoleColors.surveyColor.rawValue)
        let data3 = HomeHideUIModel(title: "Öğrencilerim",
                                    cardTitle: "Öğrenci Listeleri", iconName: "h03",
                                    description: "Öğrenci Detayları",
                                    backgroundColor: RoleColors.childColor.rawValue)
        return [data, data1, data3]
    }()
    
    var childHideData: [HomeHideUIModel] = {
        let data = HomeHideUIModel(title: "Testlerim", cardTitle: "Sonuç Özetleri", iconName: "h00", description: "Mizaç Testi Çöz", backgroundColor: RoleColors.testColor.rawValue)
        return [data]
    }()
    
    lazy var managerShowData: [HomeShowUIModel] = {
        let data = HomeShowUIModel(title: "Testler",
                                   cardTitle: "Sonuç Özetleri",
                                   iconName: "h00",
                                   lognDescription: self.userData?.temperament?.name,
                                   shortDescription: "Temel Motivasyonu",
                                   shortDescription2: self.userData?.temperament?.motivation,
                                   buttonText: "Detaylar", backgroundColor: RoleColors.testColor.rawValue)
        let data2 = HomeShowUIModel(title: "Anketler",
                                    cardTitle: "Kişisel Gelişim Anketleri",
                                    iconName: "h04",
                                    lognDescription: nil,
                                    shortDescription: nil,
                                    shortDescription2: nil,
                                    buttonText: "Detaylar",
                                    backgroundColor: RoleColors.surveyColor.rawValue)
        let data3 = HomeShowUIModel(title: "Sınıflar",
                                    cardTitle: "Sınıf Listesi",
                                    iconName: "h01",
                                    lognDescription: nil,
                                    shortDescription: nil,
                                    shortDescription2: nil,
                                    buttonText: "Tümünü Listele",
                                    backgroundColor: RoleColors.stundetClassColor.rawValue)
        let data4 = HomeShowUIModel(title: "Öğrenciler",
                                    cardTitle: "Öğrenci Listesi", 
                                    iconName: "h03", 
                                    lognDescription: nil, 
                                    shortDescription: nil, 
                                    shortDescription2: nil, 
                                    buttonText: "Tümünü Gör", 
                                    backgroundColor: RoleColors.childColor.rawValue)
        let data5 = HomeShowUIModel(title: "Veliler",
                                    cardTitle: "Veli Listesi",
                                    iconName: "h02", lognDescription: nil,
                                    shortDescription: nil,
                                    shortDescription2: nil, buttonText: "Tümünü Gör",
                                    backgroundColor: RoleColors.stundetClassColor.rawValue)
        return [data, data2, data3, data4, data5]
    }()
    
    lazy var parentShowData: [HomeShowUIModel] = {
        let data = HomeShowUIModel(title: "Testler",
                                   cardTitle: "Sonuç Özetleri",
                                   iconName: "h00",
                                   lognDescription: self.userData?.temperament?.name,
                                   shortDescription: "Temel Motivasyonu",
                                   shortDescription2: self.userData?.temperament?.motivation, buttonText: "Detaylar",
                                   backgroundColor: RoleColors.testColor.rawValue)
        let data2 = HomeShowUIModel(title: "Anketler",
                                    cardTitle: "Kişisel Gelişim Anketleri",
                                    iconName: "h04",
                                    lognDescription: nil,
                                    shortDescription: nil,
                                    shortDescription2: nil,
                                    buttonText: "Detaylar",
                                    backgroundColor: RoleColors.surveyColor.rawValue)
        let data4 = HomeShowUIModel(title: "Öğrenciler",
                                    cardTitle: "Öğrenci Listesi",
                                    iconName: "h03",
                                    lognDescription: nil,
                                    shortDescription: nil,
                                    shortDescription2: nil,
                                    buttonText: "Tümünü Gör",
                                    backgroundColor: RoleColors.childColor.rawValue)
        return [data, data2, data4]
    }()
    
    lazy var childShowData: [HomeShowUIModel] = {
        let data4 = HomeShowUIModel(title: "Öğrenciler",
                                    cardTitle: "Öğrenci Listesi", iconName: "h03",
                                    lognDescription: nil,
                                    shortDescription: nil, shortDescription2: nil,
                                    buttonText: "Tümünü Gör",
                                    backgroundColor: RoleColors.stundetClassColor.rawValue)
        return [data4]
    }()
    
}
