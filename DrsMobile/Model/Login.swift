//
//  LoginModel.swift
//  DrsMobile
//
//  Created by yusuf demirkoparan on 22.10.2019.
//  Copyright © 2019 yusuf demirkoparan. All rights reserved.
//

import Foundation

// MARK: - Login
struct Login: Codable {
    let status: String
    let statusCode: Int
    var data: LoginData
    
    enum CodingKeys: String, CodingKey {
        case status
        case statusCode = "status_code"
        case data
        
    }
}

// MARK: - DataClass
struct LoginData: Codable {
    let uid, tcno, email, name: String
    let gender, birthdate: String
    let roles: [Roles]
    let token: String
    let temperament: Temperament?
    
}

// MARK: - Role
struct Roles: Codable {
    let uid: String
    let slug: String
    let name: String
    let school: String?
    let schoolName: String?
    let unit: String?
    let unitName: String?
    
    enum CodingKeys: String, CodingKey {
        case uid, slug, name, school
        case schoolName = "school_name"
        case unit
        case unitName = "unit_name"
    }
}

// MARK: - Temperament
struct Temperament: Codable {
    let status: String?
    let name: String
    let motivation: String
    let base: String
    
}
