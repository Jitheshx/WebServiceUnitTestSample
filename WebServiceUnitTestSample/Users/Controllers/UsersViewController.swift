//
//  UsersViewController.swift
//  WebServiceUnitTestSample
//
//  Created by Jithesh Xavier on 09/06/23.
//

import UIKit

class UsersViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let modelValidator = UserModelValidator()
        let url = String(format: UsersConstants.listUserURLString, "1")
        let webService = UsersWebService(urlString: url)

        let userPresenter = UserPresenter(userModelValidator: modelValidator, webService: webService, delegate: self)
        
        userPresenter.processGetUserDetails(withUserId: "2")
    }
}

extension UsersViewController: UserViewDelegateProtocol {
    
    func successfullSignup() {
        print("successfullSignup")
    }
    
    func errorHandler(error: UserErrors?) {
        print("errorHandler")
    }
}
