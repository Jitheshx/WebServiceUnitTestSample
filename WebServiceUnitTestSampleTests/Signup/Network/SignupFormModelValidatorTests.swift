//
//  SignupFormModelValidatorTests.swift
//  WebServiceUnitTestSampleTests
//
//  Created by Jithesh Xavier on 14/06/23.
//

import XCTest
@testable import WebServiceUnitTestSample

final class SignupFormModelValidatorTests: XCTestCase {

    var sut: SignupFormModelValidator!

    override func setUpWithError() throws {
        sut = SignupFormModelValidator()
        
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    func test_SignupFormModelValidator_WhenValidFirstNameProvided_ShouldReturnTrue() {
        
        let isFirstNameValid = sut.isFirstNameValid(firstName: "Jithesh")
        XCTAssertEqual(isFirstNameValid, true, "When firstname is not empty it returns true")
    }
    
    func test_SignupFormModelValidator_WhenTooShortFirstNameProvided_ShouldReturnFalse() {
        
        let isFirstNameValid = sut.isFirstNameValid(firstName: "j")
        XCTAssertFalse(isFirstNameValid, "When too short firstname is provided it returns true")
    }
    
    func test_SignupFormModelValidator_WhenTooLongFirstNameProvided_ShouldReturnFalse() {
        
        let isFirstNameValid = sut.isFirstNameValid(firstName: "JitheshXavier")
        XCTAssertFalse(isFirstNameValid,"When Too Long first Name is provided should return false")
    }
    
    func test_SignupFormModelValidator_WhenValidLastNameProvided_ShouldReturnTrue() {
        
        let isLastNameValid = sut.isLastNameValid(lastName: "Xavier")
        XCTAssertEqual(isLastNameValid, true, "When LastNameValid is not empty it returns true")
    }
    
    func test_SignupFormModelValidator_WhenTooShortLastNameProvided_ShouldReturnFalse() {
        
        let isLastNameValid = sut.isLastNameValid(lastName: "j")
        XCTAssertFalse(isLastNameValid, "When too short lastName is provided it returns true")
    }
    
    func test_SignupFormModelValidator_WhenTooLongLastNameProvided_ShouldReturnFalse() {
        
        let isLastNameValid = sut.isLastNameValid(lastName: "XavierPalluruthy")
        XCTAssertFalse(isLastNameValid,"When Too Long last Name is provided should return false")
    }

    func test_SignupFormModelValidator_WhenValidEmailProvided_ShouldReturnTrue() {
        
        let isEmailValid = sut.isValidEmailFormat(email: "jithehshxavier@gmail.com")
        XCTAssertEqual(isEmailValid, true, "When email is valid returns true")
    }

    func test_SignupFormModelValidator_WhenValidPasswordProvided_ShouldReturnTrue() {
        
        let isPasswordValid = sut.isPasswordValid(password: "1234567890")
        XCTAssertEqual(isPasswordValid, true, "When password is valid returns true")
    }

    func test_SignupFormModelValidator_WhenMatchingPasswordProvided_ShouldReturnTrue() {
        
        let doPasswordsMatch = sut.doPasswordsMatch(password: "1234567890", repeatPassword: "1234567890")
        XCTAssertEqual(doPasswordsMatch, true, "When password is valid returns true")
    }

}
