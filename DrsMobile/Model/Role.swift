//
//  Role.swift
//  DrsMobile
//
//  Created by yusuf demirkoparan on 28.10.2019.
//  Copyright © 2019 yusuf demirkoparan. All rights reserved.
//

import Foundation

struct Role: Equatable {
    let uid: String
    let slug: String?
    let name: String?
    let school: String?
    let schoolName: String?
    let unit: String?
    let unitName: String?
    
}

extension Role {
    init(data: Roles) {
        self.name = data.name
        self.school = data.school
        self.schoolName = data.schoolName
        self.slug = data.slug
        self.uid = data.uid
        self.unit = data.unit
        self.unitName = data.unitName
        
    }
}
