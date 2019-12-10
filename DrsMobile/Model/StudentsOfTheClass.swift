//
//  StudentsOfTheClass.swift
//  DrsMobile
//
//  Created by yusuf demirkoparan on 2.12.2019.
//  Copyright © 2019 yusuf demirkoparan. All rights reserved.
//

import Foundation
// MARK: - StudentsOfTheClass
struct StudentsOfTheClass: Codable {
    let status: String
    let statusCode: Int
    let data: DetailOfTheClass

    enum CodingKeys: String, CodingKey {
        case status
        case statusCode = "status_code"
        case data
    }
}

// MARK: - DataClass
struct DetailOfTheClass: Codable {
    let uid: String
    let name: String
    let grade: String
    let branch: String
    let capacity: String
    let planColumns: String?
    let planSeats: String?
    let totalStudents: String
    let school: ClassroomClass
    let unit: Unit
    let students: [StudentDetail]?

    enum CodingKeys: String, CodingKey {
        case uid, name, grade, branch, capacity
        case planColumns = "plan_columns"
        case planSeats = "plan_seats"
        case totalStudents = "total_students"
        case school, unit, students
        
    }
}

// MARK: - Gender
struct Gender: Codable {
    let male, female: Int
}

// MARK: - ClassroomClass
struct ClassroomClass: Codable {
    let uid: String
    let name: String
}
