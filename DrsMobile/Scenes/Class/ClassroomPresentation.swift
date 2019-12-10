//
//  ClassroomPresentation.swift
//  DrsMobile
//
//  Created by yusuf demirkoparan on 26.11.2019.
//  Copyright © 2019 yusuf demirkoparan. All rights reserved.
//
import Foundation

final class ClassRoomData: NSObject {
    var uid: String
    var name: String
    var schoolUuid: String?
    var studentsCount: String?
    var sectionID: Int?
    var extendable: Bool
    var studentList: [ClassRoomStudentData]?
    
    init(data: ClassDetails) {
        self.uid = data.uid
        self.name = data.name
        self.studentsCount = data.totalStudents
        self.schoolUuid = data.school.uid
        self.studentList = nil
        self.extendable = false
        
    }
}

final class ClassRoomStudentData: NSObject {
    var uid: String
    var name: String
    var email: String
    var tcno: String
    var temperament: Temperament?
    var classroom: Classroom?
    
    init(data: StudentDetail) {
        self.uid = data.uid
        self.name = data.name
        self.email = data.email
        self.tcno = data.tcno
        self.temperament = data.temperament
        self.classroom = data.classroom
         
    }
}
