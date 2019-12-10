//
//  ClassViewController.swift
//  DrsMobile
//
//  Created by yusuf demirkoparan on 26.11.2019.
//  Copyright © 2019 yusuf demirkoparan. All rights reserved.
//

import UIKit
/// Tableview cell Identifiers
enum ClassRoomIdentifier: String {
    case firstSection = "Cell"
    case studentCell = "Cell2"
    
}

final class ClassViewController: UITableViewController {
    // MARK: - Properties
    var viewModel: ClassVMDelegate! {
        didSet {
            viewModel.delegate = self
        }
    }
    var classData = [ClassRoomData]()
    
    // MARK: - Init
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        viewModel.load()
    }
    
    fileprivate func setupLayout() {
        view.backgroundColor = .white
        tabBarController?.tabBar.isHidden = true
        navigationItem.title = "Listeler"
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: ClassRoomIdentifier.firstSection.rawValue)
        tableView.register(StudentListTableCell.self, forCellReuseIdentifier: ClassRoomIdentifier.studentCell.rawValue)
        
    }
    
    // MARK: - TableView Implementation
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return indexPath.row == 0
            ? setClassCell(indexPathSection: indexPath.section)
            : setStudentCell(indexPath: indexPath.row, sectionIndex: indexPath.section)
        
    }
    
    /// Here gives the section title
    fileprivate func setClassCell(indexPathSection: Int) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ClassRoomIdentifier.firstSection.rawValue)
        cell?.textLabel?.text = classData[indexPathSection].name
        
        return cell ?? UITableViewCell()
    }
    
    /// Here gives the student list
    fileprivate func setStudentCell(indexPath: Int, sectionIndex: Int) -> StudentListTableCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ClassRoomIdentifier.studentCell.rawValue) as? StudentListTableCell
        if let strongStudentList = classData[sectionIndex].studentList {
            cell?.textLabel?.text = strongStudentList[indexPath-1].name
            
        }
        return cell ?? StudentListTableCell()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return classData[section].extendable
            ? classData[section].studentList?.count ?? 0 > 0 ? classData[section].studentList!.count+1 : 1
            : 1
        
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 100
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return classData.count
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let classRoomId = classData[indexPath.section].uid
        if indexPath.row == 0 {
            viewModel.fetchSelectedStudentList(classRoomID: classRoomId, sectionID: indexPath.section)
        } else {
            let getStudentID = classData[indexPath.section].studentList?[indexPath.row].uid
            // todo
        }
        
    }
    
    deinit {
        print("ClassView Controller is deinit")
        
    }
}

// MARK: - View Model Outputs
extension ClassViewController: ClassVMDelegateOutputs {
    func handleViewModelOutputs(_ outputs: ClassVMOutputs) {
        switch outputs {
        /// I fetch classList when i clicked a row
        case .classData(let data, let section):
            self.classData = data
            if
                let strongSection = section {
                let sections = IndexSet(integer: strongSection)
                tableView.reloadSections(sections, with: .fade)
                
            }
        }
    }
}
