//
//  StringExtensions.swift
//  DrsMobile
//
//  Created by yusuf demirkoparan on 18.11.2019.
//  Copyright © 2019 yusuf demirkoparan. All rights reserved.
//

import UIKit
// when i calculate a dynamic label text height
extension String {
    func heightWithConstrainedWidth(width: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
        let boundingBox = self.boundingRect(with: constraintRect,
                                            options: [.usesLineFragmentOrigin, .usesFontLeading],
                                            attributes: [NSAttributedString.Key.font: font],
                                            context: nil)
        return boundingBox.height
    }
}

// İt gives user temperament on two cell
extension String {
    static func parseTemperamentString(_ temperamentString: String?) -> String? {
        let item = temperamentString?.components(separatedBy: " ")
        if let strongItem = item {
            return strongItem[2] + " " + strongItem[0] + strongItem[1] + "\n" + strongItem[5] + " " + strongItem[3] + strongItem[4]
        } else {
            return nil
        }
    }
}
