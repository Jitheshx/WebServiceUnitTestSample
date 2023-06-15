//
//  SignupPresenterTest.swift
//  WebServiceUnitTestSampleTests
//
//  Created by Jithesh Xavier on 12/06/23.
//

import XCTest
@testable import WebServiceUnitTestSample

final class SignupPresenterTest: XCTestCase {
    
    var signupFormModel: SignupFormModel!
    var mockSignupModelValidator: MockSignupModelValidator!
    var mockSignupWebService: MockSignupWebService!
    var sut: SignupPresenter!
    var mockSignupViewDelegate: MockSignupViewDelegate!
    
    override func setUpWithError() throws {
        signupFormModel = SignupFormModel(
            firstName: "Jithesh",
            lastName: "Xavier",
            email: "jitheshxavier@gmail.com",
            password: "123456",
            repeatPassword: "123456")
        
        mockSignupModelValidator = MockSignupModelValidator()
        mockSignupWebService = MockSignupWebService()
        mockSignupViewDelegate = MockSignupViewDelegate()
        sut = SignupPresenter(
            formModelValidator: mockSignupModelValidator,
            webService: mockSignupWebService,
            delegate: mockSignupViewDelegate)
    }

    override func tearDownWithError() throws {
        signupFormModel = nil
        mockSignupModelValidator = nil
        mockSignupWebService = nil
        sut = nil
        mockSignupViewDelegate = nil
    }
    
    func testSignupPresenter_WhenInformationProvided_WillValidateEachProperty() {
        
        //Arrage
        
        //Act
        sut.processUserSignup(formModel: signupFormModel)
        
        //Assert
        XCTAssertTrue(mockSignupModelValidator.isFirstNameValidated)
        XCTAssertTrue(mockSignupModelValidator.isLastNameValidated)
        XCTAssertTrue(mockSignupModelValidator.isEmailValidated)
        XCTAssertTrue(mockSignupModelValidator.isPasswordValidated)
        XCTAssertTrue(mockSignupModelValidator.doPasswordsMatch)
    }
    
    func testSignupPresenter_WhenGivenValidFormModel_ShouldCallSignupMethod() {
        
        //Arrange

        //Act
        sut.processUserSignup(formModel: signupFormModel)

        //Assert
        XCTAssertTrue(mockSignupWebService.isSignupMethodCalled)
    }
    
    func testSignupPresenter_WhenSignupOperationSuccessfull_CallsSuccessOnViewDelegate() {
        
        //Arrange
        let myExpectation = expectation(description: "Expected the successMethod() to be called")
        
        mockSignupViewDelegate.expectation = myExpectation
        
        //Act
        sut.processUserSignup(formModel: signupFormModel)
        self.wait(for: [myExpectation], timeout: 5)
        
        //Assert
        XCTAssertEqual(mockSignupViewDelegate.successfullSignupCounter, 1)
    }
    
    func testSignupPresenter_WhenSignupOperationFails_ShouldCallErrorOnDelegate() {
        //Arrange
        let errorHandlerExpectation = expectation(description: "Error handler to the called when error occurs")
        mockSignupViewDelegate.expectation = errorHandlerExpectation
        mockSignupWebService.shouldReturnError = true
        
        //Act
        sut.processUserSignup(formModel: signupFormModel)
        self.wait(for: [errorHandlerExpectation], timeout: 5)
        
        //Assert
        XCTAssertNotNil(mockSignupViewDelegate.error)
    }
}
