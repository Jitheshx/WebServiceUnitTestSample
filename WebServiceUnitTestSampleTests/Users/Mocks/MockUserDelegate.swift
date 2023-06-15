//
//  MockUserDelegate.swift
//  WebServiceUnitTestSampleTests
//
//  Created by Jithesh Xavier on 14/06/23.
//

import Foundation
@testable import WebServiceUnitTestSample
import XCTest

class MockUserDelegate: UserViewDelegateProtocol {
    
    var expectation: XCTestExpectation?
    var error: UserErrors?

    func successfullSignup() {
        expectation?.fulfill()
    }
    
    func errorHandler(error: UserErrors?) {
        expectation?.fulfill()
        self.error = error
    }
}
