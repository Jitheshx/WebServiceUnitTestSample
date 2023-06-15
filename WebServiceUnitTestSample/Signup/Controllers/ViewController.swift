//
//  ViewController.swift
//  WebServiceUnitTestSample
//
//  Created by Jithesh Xavier on 08/06/23.
//

import UIKit

class ViewController: UIViewController {
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let webService = SignupWebService(urlString: SignupConstants.signupURLString)
        let validator = SignupFormModelValidator()

        let test = SignupPresenter(formModelValidator: validator, webService: webService, delegate: self)

        let signupFormModel = SignupFormModel(
            firstName: "Jithesh",
            lastName: "Xavier",
            email: "jitheshxavier@gmail.com",
            password: "123456",
            repeatPassword: "123456")
        
        test.processUserSignup(formModel: signupFormModel)
    }
}

extension ViewController: SignupViewDelegateProtocol {
    
    func successfullSignup() {
        print("successfullSignup")
    }
    
    func errorHandler(error: SignupErrors) {
        print("errorHandler")
    }
}
