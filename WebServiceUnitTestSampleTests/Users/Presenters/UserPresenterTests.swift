//
//  UserPresenterTests.swift
//  WebServiceUnitTestSampleTests
//
//  Created by Jithesh Xavier on 14/06/23.
//

import XCTest
@testable import WebServiceUnitTestSample

final class UserPresenterTests: XCTestCase {
    
    var sut: UserPresenter!
    var mockUserModelValidator: MockUserModelValidator!
    var userWebService: MockUserWebService!
    var delegate: MockUserDelegate!
    var userId: String = ""

    override func setUpWithError() throws {
        
        mockUserModelValidator = MockUserModelValidator()
        userWebService = MockUserWebService()
        delegate = MockUserDelegate()
        userId = "2"
        sut = UserPresenter(userModelValidator: mockUserModelValidator, webService: userWebService, delegate: delegate)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testUserPresenter_WhenValidUserIdProvided_ShouldValidate() {
        //Arrange

        //Act
        sut.processGetUserDetails(withUserId: userId)
        
        //Assert
        XCTAssertTrue(mockUserModelValidator.isUserIdValid)
    }
    
    func testUserPresenter_WhenValidUserIdProvided_ShouldCallUserListingMethod() {
        
        //Act
        sut.processGetUserDetails(withUserId: userId)
        XCTAssertTrue(userWebService.isUserWebServiceMethodCalled)
    }
    
    func testUserPresenter_WhenUserListingOperationSuccessfull_CallSuccessonViewDelegate() {
        
        let expectation = expectation(description: "When successfull userlisting completed call success view delegate")
        
        delegate.expectation = expectation
        sut.processGetUserDetails(withUserId: userId)
        
        
        self.wait(for: [expectation], timeout: 5)
        
    }
    
    func testUserPresenter_WhenUserListingOperationFailed_CallErrorHandlerOnViewDelegate() {
        
        let expectation = expectation(description: "When failure happens in userlisting completed call Error handler in view delegate")
        
        delegate.expectation = expectation
        userWebService.shouldReturnError = true
        sut.processGetUserDetails(withUserId: userId)
        
        self.wait(for: [expectation], timeout: 5)
        
        //Assert
        XCTAssertNotNil(delegate.error)
    }

}
