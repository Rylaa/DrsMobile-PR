//
//  Networkable.swift
//  DrsMobile
//
//  Created by yusuf demirkoparan on 22.10.2019.
//  Copyright © 2019 yusuf demirkoparan. All rights reserved.
//

import Moya

protocol Networkable: AnyObject {
    var client: MoyaProvider<DrsAPI>! { get set }
    func defaultLoginPageConfigurer(userName: String, password: String, completion: @escaping(Result<Login, Error>) -> Void)
    func fetchTemperamentTestQuestions(userId: String, token: String, completion: @escaping(Result<Question, Error>) -> Void)
    func sendTestAnswer(userId: String, token: String, userAnswers: Any?, completion: @escaping(Result<Question, Error>) -> Void)
    func fetchClassList(roleID: String, token: String, completion: @escaping(Result<ClassData, Error>) -> Void)
    func fetchStudentsOfTheClass(roleID: String, classRoomId: String, token: String, completion: @escaping(Result<StudentsOfTheClass, Error>) -> Void)
    // Todo Implement
}
