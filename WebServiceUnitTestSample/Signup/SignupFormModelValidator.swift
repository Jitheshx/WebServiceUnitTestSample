//
//  SignupFormModelValidator.swift
//  WebServiceUnitTestSample
//
//  Created by Jithesh Xavier on 14/06/23.
//

import Foundation

class SignupFormModelValidator: SignupModelValidatorProtocol {
    
    
    func isFirstNameValid(firstName: String) -> Bool {
        if firstName.count < 3 || firstName.count > 7 {
            return false
        }
        return true
    }
    
    func isLastNameValid(lastName: String) -> Bool {
        if lastName.count < 3 || lastName.count > 6 {
            return false
        }
        return true
    }
    
    func isValidEmailFormat(email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        let result = emailPred.evaluate(with: email)
        return result
    }

    func isPasswordValid(password: String) -> Bool {
        if password.count < 3 || password.count > 10 {
            return false
        }
        return true
    }
    
    func doPasswordsMatch(password: String, repeatPassword: String) -> Bool {
        return password == repeatPassword
    }

}
