//
//  MockSignupViewDelegate.swift
//  WebServiceUnitTestSampleTests
//
//  Created by Jithesh Xavier on 12/06/23.
//

import Foundation
import XCTest
@testable import WebServiceUnitTestSample

class MockSignupViewDelegate: SignupViewDelegateProtocol {
    
    var expectation: XCTestExpectation?
    var error: SignupErrors?
    var successfullSignupCounter = 0

    func successfullSignup() {
        expectation?.fulfill()
        successfullSignupCounter += 1
    }
    
    func errorHandler(error: SignupErrors) {
        expectation?.fulfill()
        self.error = error
    }
    
}
