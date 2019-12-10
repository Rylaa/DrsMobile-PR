//
//  ProfileTemplatePresentation.swift
//  DrsMobile
//
//  Created by yusuf demirkoparan on 9.12.2019.
//  Copyright © 2019 yusuf demirkoparan. All rights reserved.
//

import Foundation

struct ProfilePresentation {
    let userName: String
    let userDetail: String
    let rowData: [ProfileDetailPresentation]?
    
}

struct ProfileDetailPresentation {
    let title: String?
    let description: String?
    
}
