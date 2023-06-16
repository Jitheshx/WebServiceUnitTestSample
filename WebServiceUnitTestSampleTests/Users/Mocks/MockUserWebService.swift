//
//  MockUserWebService.swift
//  WebServiceUnitTestSampleTests
//
//  Created by Jithesh Xavier on 14/06/23.
//

import Foundation
@testable import WebServiceUnitTestSample

class MockUserWebService: UserWebServiceProtocol {
    
    var isUserWebServiceMethodCalled: Bool = false
    var shouldReturnError: Bool = false

    func userListing(userID: String, completionHandler: @escaping (UserResponseModel?, UserErrors?) -> Void) {
     
        isUserWebServiceMethodCalled = true
        
        if shouldReturnError {
            completionHandler(nil, UserErrors.invalidRequest)
        } else {
            let userResponseModel = UserResponseModel(
                data: UserResponseDataClass(
                    id: 1,
                    email: "jitheshxavier@gmail.com",
                    firstName: "Jithesh",
                    lastName: "Xavier",
                    avatar: "https://reqres.in/img/faces/1-image.jpg"),
                support: UserResponseSupport(
                    url: "https://reqres.in/#support-heading",
                    text: "To keep ReqRes free, contributions towards server costs are appreciated!")
            )
            completionHandler(userResponseModel, nil)
        }
    }
}
