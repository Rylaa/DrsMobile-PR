//
//  DrsAPI.swift
//  DrsMobile
//
//  Created by yusuf demirkoparan on 21.10.2019.
//  Copyright © 2019 yusuf demirkoparan. All rights reserved.
//
//http://api.mizactemelliegitim.com/school/6EA5716D-5B92-4D12-87EB-E27C8140A580/classrooms
import Moya

enum DrsAPI {
    case login(userName: String, password: String)
    case createTest(token: String, userId: String)
    case classRoomData(token: String, roleId: String)
    case fetchStudentsOfTheClass(classRoomID: String, roleID: String, token: String)
}

extension DrsAPI: TargetType {
    var baseURL: URL {
        return URL(string: "http://api.mizactemelliegitim.com")!
        
    }
    
    var path: String {
        switch self {
        case .login:
            return "/auth/login"
            
        case .createTest:
            return "/surveys/temperament/create"
            
        case .classRoomData(let roleId):
            return "school/\(roleId)/classrooms"
            
        case .fetchStudentsOfTheClass(let classRoomID, let roleID, _):
            return "school/\(roleID)/classrooms/\(classRoomID)"
            
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .login:
            return .post
            
        case .createTest:
            return .post
            
        case .classRoomData:
            return .get
            
        case .fetchStudentsOfTheClass:
            return .get
        }
    }
    
    var sampleData: Data {
        return Data()
        
    }
    
    var task: Task {
        switch self {
        case let .login(userName, password):
            return .requestParameters(parameters: ["username": userName, "password": password], encoding: URLEncoding.default)
            
        case let .createTest(token, userId):
            return .requestParameters(parameters: ["Token": token, "user": userId], encoding: URLEncoding.default )
            
        case let .classRoomData(token, _):
            return .requestParameters(parameters: ["Authorization": "Bearer \(token)"], encoding: URLEncoding.default )
            
        case let .fetchStudentsOfTheClass(_, _, token):
            return .requestParameters(parameters: ["Authorization": "Bearer \(token)"], encoding: URLEncoding.default )
            
        }
    }
    
    var headers: [String: String]? {
        return nil
        
    }
}
