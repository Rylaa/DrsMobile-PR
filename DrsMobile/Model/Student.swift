//
//  Student.swift
//  DrsMobile
//
//  Created by yusuf demirkoparan on 25.11.2019.
//  Copyright © 2019 yusuf demirkoparan. All rights reserved.
//

import Foundation

// MARK: - Student
struct Student: Codable {
    let status: String
    let statusCode: Int
    let data: [StudentDetail]

    enum CodingKeys: String, CodingKey {
        case status
        case statusCode = "status_code"
        case data
    }
}

// MARK: - StudentDetail
struct StudentDetail: Codable {
    let uid: String
    let name: String
    let email: String
    let tcno: String
    let gender: String
    let birthdate: String
    let temperament: Temperament?
    let school: School
    let unit: Unit
    let classroom: Classroom?
    let teachers: Teachers?
    
}

// MARK: - Classroom
struct Classroom: Codable {
    let uid: String
    let name: String
    
}

// MARK: - School
struct School: Codable {
    let uid: String
    let name: String
    let number: String?
    
}

// MARK: - Teachers
struct Teachers: Codable {
    let guidanceTeacher: Teacher
    let classroomTeacher: Teacher

    enum CodingKeys: String, CodingKey {
        case guidanceTeacher = "guidance_teacher"
        case classroomTeacher = "classroom_teacher"
        
    }
}

// MARK: - Teacher
struct Teacher: Codable {
    let uid: String
    let name: String
    let email: String
    let tcno: String?
    let gender: String?
    let birthdate: String?
    let branch: String?
    let createdAt: String?
    let deletedAt: String?

    enum CodingKeys: String, CodingKey {
        case uid, name, email, tcno, gender, birthdate, branch
        case createdAt = "created_at"
        case deletedAt = "deleted_at"
    }
}


// MARK: - Unit
struct Unit: Codable {
    let unitId: String
    let name: String
    
    enum CodingKeys: String, CodingKey {
        case unitId = "id"
        case name
        
    }
    
}
