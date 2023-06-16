//
//  UsersViewController.swift
//  WebServiceUnitTestSample
//
//  Created by Jithesh Xavier on 09/06/23.
//

import UIKit

class UsersViewController: UIViewController {

    @IBOutlet weak var userIDTextField: UITextField!
    @IBOutlet weak var submitButton: UIButton!
    var userPresenter: UserPresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let modelValidator = UserModelValidator()
        let webService = UsersWebService(urlString: UsersConstants.listUserURLString)

        if userPresenter == nil {
            userPresenter = UserPresenter(userModelValidator: modelValidator, webService: webService, delegate: self)
        }
    }
    
    @IBAction func submitAction(_ sender: UIButton) {
        if let userId = userIDTextField.text, userId != "" {
            userPresenter.processGetUserDetails(withUserId: userId)
        }
    }
}

extension UsersViewController: UserViewDelegateProtocol {
    
    func userDetailsFetched() {
        print("userDetailsFetched")
    }
    
    func errorHandler(error: UserErrors?) {
        print("errorHandler")
    }
}
