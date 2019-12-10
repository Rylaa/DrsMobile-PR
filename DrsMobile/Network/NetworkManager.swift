//
//  NetworkManager.swift
//  DrsMobile
//
//  Created by yusuf demirkoparan on 22.10.2019.
//  Copyright © 2019 yusuf demirkoparan. All rights reserved.
//
import Moya
class NetworkManager: Networkable {
    var client: MoyaProvider<DrsAPI>!
    /// this function doing fetch endpoints and parse
    func configure<T: Codable>(_ targetAPI: DrsAPI, model: T.Type, completion: @escaping(Result<T, Error>) -> Void ) {
        client.request(targetAPI) { (response) in
            switch response {
            case .failure(let error):
                /// Handle Error
                completion(.failure(error))
                
            case .success(let data):
                let decoder = JSONDecoder()
                
                do {
                    /// When i  get response is between 200 and 300
                    let filteredResponse = try data.filterSuccessfulStatusCodes()
                    /// Parse the generic class
                    let result = try decoder.decode(T.self, from: filteredResponse.data)
                    completion(.success(result))
                    
                } catch {
                    /// Handle Error
                    completion(.failure(error))
                    
                }
            }
        }
    }
    
    /// User login
    func defaultLoginPageConfigurer(userName: String, password: String, completion: @escaping (Result<Login, Error>) -> Void) {
        configure(.login(userName: userName, password: password), model: Login.self) { completion($0) }
        
    }
    /// Create temperament test
    func fetchTemperamentTestQuestions(userId: String, token: String, completion: @escaping (Result<Question, Error>) -> Void) {
        configure(.createTest(token: token, userId: userId), model: Question.self) { completion($0) }
        
    }
    /// Send main question user answers
    func sendTestAnswer(userId: String, token: String, userAnswers: Any?, completion: @escaping (Result<Question, Error>) -> Void) {
        print("TODO")
    }
    /// Fetch Class list
    func fetchClassList(roleID: String, token: String, completion: @escaping (Result<ClassData, Error>) -> Void) {
        configure(.classRoomData(token: token, roleId: roleID), model: ClassData.self) { completion($0) }
        
    }
    /// Fetch Student
    func fetchStudentsOfTheClass(roleID: String, classRoomId: String, token: String, completion: @escaping (Result<StudentsOfTheClass, Error>) -> Void) {
        configure(.fetchStudentsOfTheClass(classRoomID: classRoomId, roleID: roleID, token: token), model: StudentsOfTheClass.self) { completion($0) }
        
     }
}
