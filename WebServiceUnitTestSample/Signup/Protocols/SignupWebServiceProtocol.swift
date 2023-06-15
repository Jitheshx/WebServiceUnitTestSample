//
//  SignupWebServiceProtocol.swift
//  WebServiceUnitTestSample
//
//  Created by Jithesh Xavier on 12/06/23.
//

import Foundation

protocol SignupWebServiceProtocol {
    func signup(withForm formModel: SignupFormRequestModel, completionHandler: @escaping(SignupResponseModel?, SignupErrors?) -> Void)
}
