//
//  Class.swift
//  DrsMobile
//
//  Created by yusuf demirkoparan on 27.11.2019.
//  Copyright © 2019 yusuf demirkoparan. All rights reserved.
//
import Foundation

// MARK: - Class Data
struct ClassData: Codable {
    let status: String
    let statusCode: Int
    let data: [ClassDetails]

    enum CodingKeys: String, CodingKey {
        case status
        case statusCode = "status_code"
        case data
    }
}

// MARK: - Datum
struct ClassDetails: Codable {
    let uid: String
    let name: String
    let grade: String
    let branch: String
    let capacity: String
    let planColumns: String?
    let planSeats: String?
    let totalStudents: String
    let school: School
    let unit: Unit
    let teachers: Teachers

    enum CodingKeys: String, CodingKey {
        case uid, name, grade, branch, capacity
        case planColumns = "plan_columns"
        case planSeats = "plan_seats"
        case totalStudents = "total_students"
        case school, unit, teachers
    }
}
