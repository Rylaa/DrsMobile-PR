//
//  UIColorExtensions.swift
//  DrsMobile
//
//  Created by yusuf demirkoparan on 23.10.2019.
//  Copyright © 2019 yusuf demirkoparan. All rights reserved.
//

import UIKit

extension UIColor {
    static var mainColor = UIColor(red: 77.0 / 255.0, green: 84.0 / 255.0, blue: 226.0 / 255.0, alpha: 1.0)
    static var IntroDescriptionColor = UIColor(red: 77.0 / 255.0, green: 84.0 / 255.0, blue: 226.0 / 255.0, alpha: 0.7)
    static var brownishGrey =  UIColor(white: 112.0 / 255.0, alpha: 1.0)
    static var lightbrownishGrey = UIColor(white: 112.0 / 255.0, alpha: 0.5)
    static var dustyOrange = UIColor(red: 1.0, green: 142.0 / 255.0, blue: 53.0 / 255.0, alpha: 1.0)
    static var brightLightBlue = UIColor(red: 65.0 / 255.0, green: 213.0 / 255.0, blue: 225.0 / 255.0, alpha: 1.0)
    static var paleGrey = UIColor(red: 239.0 / 255.0, green: 239.0 / 255.0, blue: 244.0 / 255.0, alpha: 1.0)
    static var coral = UIColor(red: 239.0 / 255.0, green: 83.0 / 255.0, blue: 80.0 / 255.0, alpha: 1.0)
    static var aquaBlue = UIColor(red: 38.0 / 255.0, green: 198.0 / 255.0, blue: 218.0 / 255.0, alpha: 1.0)
    static var mango = UIColor(red: 1.0, green: 167.0 / 255.0, blue: 38.0 / 255.0, alpha: 1.0)
    static var surveyBlue = #colorLiteral(red: 0.0862745098, green: 0.6039215686, blue: 0.9019607843, alpha: 1)
    static var paleGrayTwo = UIColor(red: 234.0 / 255.0, green: 234.0 / 255.0, blue: 249.0 / 255.0, alpha: 1.0)
    
}
// Darkmode

//extension UIColor {
//    static func myColor() -> UIColor {
//        if #available(iOS 13, *) {
//            return UIColor.init { (trait) -> UIColor in
//                // the color can be from your own color config struct as well.
//                return trait.userInterfaceStyle == .dark ? UIColor.darkGray : UIColor.orange
//            }
//        }
//        else { return UIColor.orange }
//    }
//}

func hexStringToUIColor (hex: String) -> UIColor {
    var cString: String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

    if (cString.hasPrefix("#")) {
        cString.remove(at: cString.startIndex)
    }

    if ((cString.count) != 6) {
        return UIColor.gray
    }

    var rgbValue: UInt64 = 0
    Scanner(string: cString).scanHexInt64(&rgbValue)

    return UIColor(
        red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
        green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
        blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
        alpha: CGFloat(1.0)
    )
}
