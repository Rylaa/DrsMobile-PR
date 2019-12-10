//
//  Validation.swift
//  DrsMobile
//
//  Created by yusuf demirkoparan on 28.10.2019.
//  Copyright © 2019 yusuf demirkoparan. All rights reserved.
//

import Foundation

///for failure and success results
enum ValidAlert {
    case success
    case failure
    case error
    
}

///for success or failure of validation with alert message
enum Valid {
    case success
    case failure(ValidAlert, AlertMessages)
    
}

enum ValidationType {
    case email
    case phoneNo
    case alphabeticString
    case password
    
}

enum RegEx: String {
    case email = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}" // Email
    case password = "^.{4,15}$" // Password length 4-15
    case alphabeticStringWithSpace = "^[a-zA-Z]*$" // e.g. hello asdsad
    case alphabeticStringFirstLetterCaps = "^[A-Z]+[a-zA-Z]*$" // SandsHell
    case phoneNo = "[0-9]{10,14}" // PhoneNo 10-14 Digits        //Change RegEx according to your Requirement
    
}

enum AlertMessages: String {
     case inValidEmail = "InvalidEmail"
     case invalidFirstLetterCaps = "First Letter should be capital"
     case inValidPhone = "Invalid Phone"
     case invalidAlphabeticString = "Invalid String"
     case inValidPSW = "Bu bilgiler kayıtlarımızla eşleşmiyor."
        
     case emptyPhone = "Empty Phone"
     case emptyEmail = "Empty Email"
     case emptyFirstLetterCaps = "Empty Name"
     case emptyAlphabeticString = "Empty String"
     case emptyPSW = "Empty Password"
    
     func localized() -> String {
        return NSLocalizedString(self.rawValue, comment: "")
        
     }
    
}

class Validation: NSObject {
    
    public static let shared = Validation()
    
    func validate(values: (type: ValidationType, inputValue: String)...) -> Valid {
        for valueToBeChecked in values {
            switch valueToBeChecked.type {
                
            case .email:
                if let tempValue = isValidString((valueToBeChecked.inputValue, .email), (.emptyEmail, .inValidEmail)) {
                    return tempValue
                }
                
            case .phoneNo:
                if let tempValue = isValidString((valueToBeChecked.inputValue, .phoneNo), (.emptyPhone, .inValidPhone)) {
                    return tempValue
                    
                }
                
            case .alphabeticString:
                if let tempValue = isValidString((valueToBeChecked.inputValue, .alphabeticStringWithSpace), (.emptyAlphabeticString, .invalidAlphabeticString)) {
                    return tempValue
                    
                }
                
            case .password:
                if let tempValue = isValidString((valueToBeChecked.inputValue, .password), (.emptyPSW, .inValidPSW)) {
                    return tempValue
                    
                }
                
            }
        }
        
        return .success
    }
    
    func isValidString(_ input: (text: String, regex: RegEx), _ alertInput: (emptyAlert: AlertMessages, invalidAlert: AlertMessages)) -> Valid? {
        if input.text.isEmpty {
            return .failure(.error, alertInput.emptyAlert)
            
        } else if isValidRegEx(input.text, input.regex) != true {
            return .failure(.error, alertInput.invalidAlert)
            
        }
        return nil
    }
    
    func isValidRegEx(_ testStr: String, _ regex: RegEx) -> Bool {
        let stringTest = NSPredicate(format: "SELF MATCHES %@", regex.rawValue)
        let result = stringTest.evaluate(with: testStr)
        return result
        
    }
}
