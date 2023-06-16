//
//  UsersViewControllerTests.swift
//  WebServiceUnitTestSampleTests
//
//  Created by Jithesh Xavier on 17/06/23.
//

import XCTest
@testable import WebServiceUnitTestSample

final class UsersViewControllerTests: XCTestCase {

    var storyboard: UIStoryboard!
    var sut: UsersViewController!
    
    override func setUpWithError() throws {
        storyboard = UIStoryboard(name: "Main", bundle: nil)
        sut = storyboard.instantiateViewController(withIdentifier: "UsersViewController") as? UsersViewController
        sut.loadViewIfNeeded()
    }

    override func tearDownWithError() throws {
        sut = nil
        storyboard = nil
    }
    
    func testUsersViewController_WhenCreated_HasRequiredTextFieldsEmpty() throws {
        
        let userIdTextField = try XCTUnwrap(sut.userIDTextField, "User Id textfield is not connected to an outlet")
        
        XCTAssertEqual(userIdTextField.text, "", "User id text field was not empty when the users view controller initially loaded")
    }
    
    func testUsersViewController_WhenCreated_HasSubmitButtonAndAction() throws {
        
        let submitButton: UIButton = try XCTUnwrap(sut.submitButton, "Submit button does not have referencing outlet")
        
        let submitButtonActions = submitButton.actions(forTarget: sut, forControlEvent: .touchUpInside)
        
        XCTAssertEqual(submitButtonActions?.count, 1, "Submit action not assigned to the button")
        XCTAssertTrue(((submitButtonActions?.contains("submitAction:")) != nil), "Submit action is not added")
    }
    
    func testUsersViewController_WhenSubmitButtonTapped_InvokeProcessGetUserDetails() {
        
        //Arrange
        let mockUserModelValidator = MockUserModelValidator()
        let mockWebService = MockUserWebService()
        let mockUserViewModelDelegate = MockUserDelegate()
        
        let mockUserPresenter = MockUserPresenter(
            userModelValidator: mockUserModelValidator,
            webService: mockWebService,
            delegate: mockUserViewModelDelegate)
        
        sut.userPresenter = mockUserPresenter
        //Act
        
        sut.submitButton.sendActions(for: .touchUpInside)
        
        
        //Assert
        XCTAssertTrue(mockUserPresenter.processGetUserDetailsCalled, "The process get user details function does not called when submit button was tapped")
    }
}
