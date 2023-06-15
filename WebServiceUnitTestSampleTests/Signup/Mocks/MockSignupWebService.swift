//
//  MockSignupWebService.swift
//  WebServiceUnitTestSampleTests
//
//  Created by Jithesh Xavier on 12/06/23.
//

import Foundation
@testable import WebServiceUnitTestSample

class MockSignupWebService: SignupWebServiceProtocol {
    
    var isSignupMethodCalled: Bool = false
    var shouldReturnError: Bool = false
    
    func signup(withForm formModel: SignupFormRequestModel, completionHandler: @escaping (SignupResponseModel?, SignupErrors?) -> Void) {
        
        isSignupMethodCalled = true
        
        if shouldReturnError {
            completionHandler(nil, SignupErrors.failedRequest(description: "Signup request was not successfull"))
        } else {
            let responseModel = SignupResponseModel(status: "ok")
            completionHandler(responseModel, nil)
        }
    }

}
