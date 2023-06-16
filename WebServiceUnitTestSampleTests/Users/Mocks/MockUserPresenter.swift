//
//  MockUserPresenter.swift
//  WebServiceUnitTestSampleTests
//
//  Created by Jithesh Xavier on 17/06/23.
//

import Foundation
@testable import WebServiceUnitTestSample

class MockUserPresenter: UserPresenterProtocol {
    
    var processGetUserDetailsCalled: Bool = false
    
    required init(userModelValidator: WebServiceUnitTestSample.UserModelValidatorProtocol, webService: WebServiceUnitTestSample.UserWebServiceProtocol, delegate: WebServiceUnitTestSample.UserViewDelegateProtocol) {
        
    }
    
    func processGetUserDetails(withUserId userId: String) {
        processGetUserDetailsCalled = true
    }
}
