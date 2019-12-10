//
//  IntroViewModel.swift
//  DrsMobile
//
//  Created by yusuf demirkoparan on 23.10.2019.
//  Copyright © 2019 yusuf demirkoparan. All rights reserved.
//

import Foundation

protocol IntroVMDelegate: AnyObject {
    var delegate: IntroVMOutputDelegate? { get set }
    func load()
    func router()
    
}

enum IntroVMOutputs {
    case isloading(Bool)
    case introData([Intro])
}

protocol IntroVMOutputDelegate: AnyObject {
    func handleViewModelOutput(_ viewModelOutputs: IntroVMOutputs)
    
}
// MARK: -
final class IntroViewModel: IntroVMDelegate {
    // MARK: - Properties
    weak var delegate: IntroVMOutputDelegate?
    weak var coordinator: IntroCoordinator?
    
    var introData: [Intro] = {
        var data = [Intro]()
        data.append(Intro(imageName: "Intro0", title: "DRS Nedir?", description: "Yenilenen bir sayfa içeriğinin okuyucunun dikkatini dağıttığı bilnen bir gerçektir"))
        data.append(Intro(imageName: "Intro1", title: "Kimler Kullanır?", description: "Yenilenen bir sayfa içeriğinin okuyucunun dikkatini dağıttığı bilnen bir gerçektir"))
        data.append(Intro(imageName: "Intro2", title: "Neler Yapılabilir?", description: "Yenilenen bir sayfa içeriğinin okuyucunun dikkatini dağıttığı bilnen bir gerçektir"))
        data.append(Intro(imageName: "Intro3", title: "Mizaç Testi Nedir?", description: "Yenilenen bir sayfa içeriğinin okuyucunun dikkatini dağıttığı bilnen bir gerçektir"))
        data.append(Intro(imageName: "Intro4", title: "Kişilik Anketi Nedir?", description: "Yenilenen bir sayfa içeriğinin okuyucunun dikkatini dağıttığı bilnen bir gerçektir"))
        data.append(Intro(imageName: "Intro5", title: "Sonuçta Ne Elde Edilir?", description: "Yenilenen bir sayfa içeriğinin okuyucunun dikkatini dağıttığı bilnen bir gerçektir"))
        return data
    }()
    
    init() {}
    
    func load() {
        notify(.isloading(true))
        notify(.introData(introData))
        notify(.isloading(false))
    }
    
    func router() {
        coordinator?.routeToLogin()
    }
    
    func notify(_ outputs: IntroVMOutputs) {
        self.delegate?.handleViewModelOutput(outputs)
    }
}
