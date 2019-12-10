//
//  ClassUnitTests.swift
//  DrsMobileTests
//
//  Created by yusuf demirkoparan on 27.11.2019.
//  Copyright © 2019 yusuf demirkoparan. All rights reserved.
//

import XCTest

@testable import DrsMobile
class ClassUnitTests: XCTestCase {
    var classView: ClassPageOutputView!
    var viewModel: ClassVMDelegate?
    var network: NetworkManager?
    
    func testStart() {
        classView = ClassPageOutputView()
        network = NetworkManager()
        viewModel = ClassViewModel(network: network!)
        viewModel?.delegate = classView
    }
    
    func testUnit() {
        /// Given:
        let teacher = Teacher(uid: "test", name: "test", email: "test", tcno: nil, gender: nil, birthdate: nil, branch: nil, createdAt: nil, deletedAt: nil)
        let unitdt = Unit(unitId: "test", name: "test")
        let scholdt = School(uid: "test", name: "test", number: "test")
        let data = ClassDetails(uid: "test", name: "tes", grade: "test", branch: "test", capacity: "test", planColumns: "test", planSeats: "test", totalStudents: "test", school: scholdt, unit: unitdt, teachers: Teachers(guidanceTeacher: teacher, classroomTeacher: teacher) )
        let classData = [data]
        
        /// When:
        viewModel?.load()
        
        /// Then:
        var classPresentation = [ClassRoomNameDetail]()
        classPresentation = classData.map({ ClassRoomNameDetail(data: $0) })
        XCTAssertTrue(!classPresentation.isEmpty)
        print("success")
        
        let enumData = ClassVMOutputs.classData(classPresentation)
        switch enumData {
        case .classData( _):
            print("Success")
            
        }
    }
    
}

class ClassPageOutputView: ClassVMDelegateOutputs {
    var viewModelOutputs = [ClassVMOutputs]()
    func handleViewModelOutputs(_ outputs: ClassVMOutputs) {
        viewModelOutputs.append(outputs)
    }
}
