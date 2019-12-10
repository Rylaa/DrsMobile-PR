//
//  Profile.swift
//  DrsMobile
//
//  Created by yusuf demirkoparan on 8.11.2019.
//  Copyright © 2019 yusuf demirkoparan. All rights reserved.
//

import Foundation

struct Profile {
    let tcNo: String
    let email: String
    let gender: String
    let birthdate: String
    let name: String
    let temperamnet: String?
    let motivation: String?
    let userId: String?
    let token: String
    
}

extension Profile {
    init(data: LoginData) {
        self.temperamnet = data.temperament?.name
        self.tcNo = data.tcno
        self.email = data.email
        self.gender = data.gender
        self.birthdate = data.birthdate
        self.name = data.name
        self.motivation = data.temperament?.motivation
        self.userId = data.uid
        self.token = data.token
        
    }
}
