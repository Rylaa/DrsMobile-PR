//
//  StudentProfile.swift
//  DrsMobile
//
//  Created by yusuf demirkoparan on 6.12.2019.
//  Copyright © 2019 yusuf demirkoparan. All rights reserved.
//

import Foundation

// MARK: - Student Profile
struct StudentProfile: Codable {
    let status: String
    let statusCode: Int
    let data: StudentDetails

    enum CodingKeys: String, CodingKey {
        case status
        case statusCode = "status_code"
        case data
    }
}

// MARK: - DataClass
struct StudentDetails: Codable {
    let uid: String
    let name: String
    let email: String
    let tcno: String
    let gender: String
    let birthdate: String
    let parents: [Parent]
    let temperament: DataTemperament
    let school: School
    let unit: Unit
    let classroom: Classroom
    let teachers: Teachers
    let surveysStatus: [SurveysStatus]

    enum CodingKeys: String, CodingKey {
        case uid, name, email, tcno, gender, birthdate, parents, temperament, school, unit, classroom, teachers
        case surveysStatus = "surveys_status"
    }
}

// MARK: - Parent
struct Parent: Codable {
    let uid: String
    let tcno: String
    let email: String
    let name: String
    let gender: String
    let birthdate: String
    let relationship: String
    let isParent: String
    let temperament: ParentTemperament

    enum CodingKeys: String, CodingKey {
        case uid, tcno, email, name, gender, birthdate, relationship
        case isParent = "is_parent"
        case temperament
    }
}

// MARK: - ParentTemperament
struct ParentTemperament: Codable {
    let status: String
}

// MARK: - SurveysStatus
struct SurveysStatus: Codable {
    let key, name, status: String
}

// MARK: - DataTemperament
struct DataTemperament: Codable {
    let status: String
    let base: String
    let name: String
    let motivation: String
    
}

