//
//  MockSignupModelValidator.swift
//  WebServiceUnitTestSampleTests
//
//  Created by Jithesh Xavier on 12/06/23.
//

import Foundation
@testable import WebServiceUnitTestSample

class MockSignupModelValidator: SignupModelValidatorProtocol {
    
    var isFirstNameValidated: Bool = false
    var isLastNameValidated: Bool = false
    var isEmailValidated: Bool = false
    var isPasswordValidated: Bool = false
    var doPasswordsMatch: Bool = false
    
    func isFirstNameValid(firstName: String) -> Bool {
        isFirstNameValidated = true
        return isFirstNameValidated
    }
    
    func isLastNameValid(lastName: String) -> Bool {
        isLastNameValidated = true
        return isLastNameValidated
    }
    
    func isValidEmailFormat(email: String) -> Bool {
        isEmailValidated = true
        return isEmailValidated
    }
    
    func isPasswordValid(password: String) -> Bool {
        isPasswordValidated = true
        return isPasswordValidated
    }
    
    func doPasswordsMatch(password: String, repeatPassword: String) -> Bool {
        doPasswordsMatch = password == repeatPassword
        return doPasswordsMatch
    }
}
