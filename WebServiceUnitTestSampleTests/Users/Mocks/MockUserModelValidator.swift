//
//  MockUserModelValidator.swift
//  WebServiceUnitTestSampleTests
//
//  Created by Jithesh Xavier on 14/06/23.
//

import Foundation
@testable import WebServiceUnitTestSample

class MockUserModelValidator: UserModelValidatorProtocol {
    
    var isUserIdValid: Bool = false
    
    func isUserIdValid(userId: String) -> Bool {
        isUserIdValid = true
        return isUserIdValid
    }
}
