//
//  UserPresenterProtocol.swift
//  WebServiceUnitTestSample
//
//  Created by Jithesh Xavier on 17/06/23.
//

import Foundation

protocol UserPresenterProtocol: AnyObject {
    
    init(userModelValidator: UserModelValidatorProtocol, webService: UserWebServiceProtocol, delegate: UserViewDelegateProtocol)
    func processGetUserDetails(withUserId userId: String)
}
