//
//  SignupViewDelegateProtocol.swift
//  WebServiceUnitTestSample
//
//  Created by Jithesh Xavier on 12/06/23.
//

import Foundation

protocol SignupViewDelegateProtocol: AnyObject {
    func successfullSignup()
    func errorHandler(error: SignupErrors)
}
