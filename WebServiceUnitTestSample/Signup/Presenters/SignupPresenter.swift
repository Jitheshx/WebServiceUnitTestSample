//
//  SignupPresenter.swift
//  WebServiceUnitTestSample
//
//  Created by Jithesh Xavier on 12/06/23.
//

import Foundation

class SignupPresenter {
    
    private var formModelValidator: SignupModelValidatorProtocol
    private var webService: SignupWebServiceProtocol
    private weak var delegate: SignupViewDelegateProtocol?
    
    init(formModelValidator: SignupModelValidatorProtocol,
         webService: SignupWebServiceProtocol,
         delegate: SignupViewDelegateProtocol) {
        self.formModelValidator = formModelValidator
        self.webService = webService
        self.delegate = delegate
    }
    
    func processUserSignup(formModel: SignupFormModel) {
        
        if !formModelValidator.isFirstNameValid(firstName: formModel.firstName) {
            return
        }
        
        if !formModelValidator.isLastNameValid(lastName: formModel.lastName) {
            return
        }
        if !formModelValidator.isValidEmailFormat(email: formModel.email) {
            return
        }
        if !formModelValidator.isPasswordValid(password: formModel.password) {
            return
        }
        if !formModelValidator.doPasswordsMatch(password: formModel.password, repeatPassword: formModel.repeatPassword) {
            return
        }

        let requestModel = SignupFormRequestModel(
            firstName: formModel.firstName,
            lastName: formModel.lastName,
            email: formModel.email,
            password: formModel.password
        )
        webService.signup(withForm: requestModel) { (responseModel, error) in
            
            if let error = error {
                self.delegate?.errorHandler(error: error)
                return
            }
            
            if let _ = responseModel {
                self.delegate?.successfullSignup()
                return
            }
        }
    }
}
