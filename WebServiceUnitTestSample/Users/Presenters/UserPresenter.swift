//
//  UserPresenter.swift
//  WebServiceUnitTestSample
//
//  Created by Jithesh Xavier on 14/06/23.
//

import Foundation

class UserPresenter {
    
    private var userModelValidator: UserModelValidatorProtocol
    private var webService: UserWebServiceProtocol
    private weak var delegate: UserViewDelegateProtocol?
    
    init(userModelValidator: UserModelValidatorProtocol, webService: UserWebServiceProtocol, delegate: UserViewDelegateProtocol) {
        self.userModelValidator = userModelValidator
        self.webService = webService
        self.delegate = delegate
    }

    func processGetUserDetails(withUserId userId: String) {
        
        if !userModelValidator.isUserIdValid(userId: userId) {
            return
        }
        
        webService.userListing { (responseModel, error) in
            
            if let error = error {
                self.delegate?.errorHandler(error: error)
                return
            }
            
            if let responseModel = responseModel {
                print(responseModel)
                self.delegate?.successfullSignup()
                return
            }
        }
    }
}
