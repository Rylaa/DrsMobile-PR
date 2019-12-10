//
//  UserDefaults.swift
//  DrsMobile
//
//  Created by yusuf demirkoparan on 13.11.2019.
//  Copyright © 2019 yusuf demirkoparan. All rights reserved.
//
// TODO Yapılacak
//import Foundation
//enum DataKeys: String {
//    case loginData = "UserData"
//    case token = "token"
//    case userId = "userId"
//
//}
//
//enum WhatDo {
//    case set
//    case get
//    case remove
//
//}
//
//final class ConfigureUserDefaults {
//
//    let userDefaults = UserDefaults.standard
//    static let shared = ConfigureUserDefaults()
//
//    func configureUD<T>(method: WhatDo, key: DataKeys, data: T?) -> T? {
//        switch method {
//        case .get:
//
//            if let data = ConfigureUserDefaults.shared.userDefaults.value(forKey: key.rawValue) as? Data,
//                let configuration = try? JSONDecoder().decode(DataClass.self, from: data) {
//                return configuration as? T ?? nil
//            } else {
//                return ConfigureUserDefaults.shared.userDefaults.string(forKey: key.rawValue) as? T ?? nil
//            }
//
//        case .set:
//            if data is DataClass {
//                if let datax = try? JSONEncoder().encode(data as! DataClass) {
//                    ConfigureUserDefaults.shared.userDefaults.set(datax, forKey: key.rawValue)
//                }
//            } else {
//                ConfigureUserDefaults.shared.userDefaults.set(data, forKey: key.rawValue)
//            }
//
//            return nil
//
//        case .remove:
//            ConfigureUserDefaults.shared.userDefaults.removeObject(forKey: key.rawValue)
//            return nil
//
//        }
//    }
//    // get için ayrı bir fonksiyon yapılacak
//}
