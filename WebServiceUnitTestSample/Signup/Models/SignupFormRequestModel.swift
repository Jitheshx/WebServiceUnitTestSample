//
//  SignupFormRequestModel.swift
//  WebServiceUnitTestSample
//
//  Created by Jithesh Xavier on 08/06/23.
//

import Foundation

struct SignupFormRequestModel: Encodable {
    
    var firstName: String
    var lastName: String
    var email: String
    var password: String
}
