//
//  Home.swift
//  DrsMobile
//
//  Created by yusuf demirkoparan on 26.11.2019.
//  Copyright © 2019 yusuf demirkoparan. All rights reserved.
//

import Foundation

struct HomeUIData {
    let homeHideUI: [HomeHideUIModel]
    let homeShowUI: [HomeShowUIModel]
}

struct HomeHideUIModel {
    let title: String
    let cardTitle: String
    let iconName: String
    let description: String
    let backgroundColor: String
    
}

struct HomeShowUIModel {
    let title: String
    let cardTitle: String
    let iconName: String
    let lognDescription: String?
    let shortDescription: String?
    let shortDescription2: String?
    let buttonText: String?
    let backgroundColor: String
    
}
