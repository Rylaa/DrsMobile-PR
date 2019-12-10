//
//  ClassViewModel.swift
//  DrsMobile
//
//  Created by yusuf demirkoparan on 26.11.2019.
//  Copyright © 2019 yusuf demirkoparan. All rights reserved.
//

import Foundation
/// Dependcy Inversion
protocol ClassVMDelegate: AnyObject {
    var delegate: ClassVMDelegateOutputs? { get set }
    var coordinator: Coordinator? { get set }
    func load()
    func fetchSelectedStudentList(classRoomID: String, sectionID: Int)
    
}
/// View model outputs
protocol ClassVMDelegateOutputs: AnyObject {
    func handleViewModelOutputs(_ outputs: ClassVMOutputs)
    
}
/// Output data
enum ClassVMOutputs: Equatable {
    case classData([ClassRoomData], Int?)
    
}

final class ClassViewModel: ClassVMDelegate {
    /// Properties
    weak var delegate: ClassVMDelegateOutputs?
    weak var coordinator: Coordinator?
    fileprivate let network: NetworkManager
    fileprivate var classRoomPresentation = [ClassRoomData]()
    /// Init
    init(network: NetworkManager) {
        self.network = network
        
    }
    /// viewmodel fetched classroom list when app created view
    func load() {
        /// todo
        let mock = MockManager()
        mock.fetchClassList(roleID: "test", token: "test") {[weak self] (response) in
            guard let self = self else { return }
            switch response {
            /// when i got error
            case .failure(let error):
                print(error)
            /// when succesfuly
            case .success(let data):
                let result = self.classRoomDataToClassData(data)
                if let strongRes = result {
                    self.notify(.classData(strongRes, nil))
                    self.classRoomPresentation = strongRes
                    
                }
            }
        }
    }
    /// fetch the classRoom list
    fileprivate func classRoomDataToClassData(_ classRoomList: ClassData) -> [ClassRoomData]? {
        let result = classRoomList.data.map({ ClassRoomData(data: $0) })
        ///  does  to add the sequencte
        addOrderToClassRoomData(result)
        return result
    }
    ///
    fileprivate func addOrderToClassRoomData(_ classRoomList: [ClassRoomData]) {
        _ = (0...classRoomList.count-1).map({ classRoomList[$0].sectionID = $0 })
        
    }
    
    /// i fetch student list when i clicked classroom name
    func fetchSelectedStudentList(classRoomID: String, sectionID: Int) {
        let mock = MockManager()
        mock.fetchStudentsOfTheClass(roleID: "test", classRoomId: classRoomID, token: "test") { [weak self] (response) in
            guard let self = self else {return}
            switch response {
            /// when i got error
            case .failure(let error):
                print(error)
            /// when succesfuly
            case .success(let data):
                let result = self.studentToClassPresentation(data, classRoomID)
                if let strongResult = result {
                    self.notify(.classData(strongResult, sectionID))
                    
                }
            }
        }
    }
    
    /// This function gives student list when i selected any classRoom
    fileprivate func studentToClassPresentation(_ data: StudentsOfTheClass, _ classRoomID: String) -> [ClassRoomData]? {
        /// I found to selected classRoomuuid
        let selectedItem = classRoomPresentation.first(where: { $0.uid == classRoomID })
        if let strongItem = selectedItem {
            let result = studentDetailToClassRoomStudentData(classRoomPresentation[strongItem.sectionID!], data)
            if classRoomID == result?[0].classroom?.uid {
                 classRoomPresentation[strongItem.sectionID!].studentList = result
                
            }
        }
        return self.classRoomPresentation
    }
    
    ///
    fileprivate func studentDetailToClassRoomStudentData(_ data: ClassRoomData, _ studentData: StudentsOfTheClass) -> [ClassRoomStudentData]? {
        var studentList = [ClassRoomStudentData]()
        data.extendable = !data.extendable
        if let strongStudentList = studentData.data.students {
            studentList = strongStudentList.map({ ClassRoomStudentData(data: $0) })
            
        }
        return studentList
    }
    
    /// here do Implement to viewModel outputs
    fileprivate func notify(_ outputs: ClassVMOutputs) {
        self.delegate?.handleViewModelOutputs(outputs)
        
    }
}
