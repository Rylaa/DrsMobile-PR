//
//  LoginRoleTemplete.swift
//  DrsMobile
//
//  Created by yusuf demirkoparan on 28.10.2019.
//  Copyright © 2019 yusuf demirkoparan. All rights reserved.
//

import UIKit

class LoginRoleTemplete: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        createTemplete()
        handleKeyboard()
    }
    
    @objc func keyboard(notification: Notification) {
        guard let keyboardReact = (notification.userInfo? [UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else {
            return
            
        }
        
        if notification.name == UIResponder.keyboardWillShowNotification ||  notification.name == UIResponder.keyboardWillChangeFrameNotification {
            self.view.frame.origin.y = -keyboardReact.height
            
        } else {
            self.view.frame.origin.y = 0
            
        }
    }
}

extension LoginRoleTemplete {
    func createTemplete() {
        view.backgroundColor = UIColor.mainColor
     
        let logo: UIImageView = {
            let img = UIImageView()
            img.image = UIImage(named: "loginLogo")
            img.contentMode = .scaleAspectFit
            return img
        }()
        
        view.addSubview(logo)
        logo.width(UIScreen.main.bounds.width*0.5)
        logo.height(UIScreen.main.bounds.height*0.15)
        logo.top(to: view, offset: UIScreen.main.bounds.height*0.12)
        logo.centerX(to: view)
        
    }
}
// Todo genel hale getirilecek
extension LoginRoleTemplete {
    func handleKeyboard() {
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboard(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboard(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboard(notification:)), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
        
    }   
}
