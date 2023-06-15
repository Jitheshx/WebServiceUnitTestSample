//
//  UserWebServiceTests.swift
//  WebServiceUnitTestSampleTests
//
//  Created by Jithesh Xavier on 14/06/23.
//

import XCTest
@testable import WebServiceUnitTestSample

final class UserWebServiceTests: XCTestCase {

    var sut: UsersWebService!
    var urlSession: URLSession!

    override func setUpWithError() throws {
        let config = URLSessionConfiguration.ephemeral
        config.protocolClasses = [MockURLProtocol.self]
        urlSession = URLSession(configuration: config)
        sut = UsersWebService(
            urlString: String(format: UsersConstants.listUserURLString, UsersConstants.userId),
            urlSession: urlSession
        )
    }

    override func tearDownWithError() throws {
        sut = nil
        MockURLProtocol.stubResponseData = nil
    }
    
    func testUserWebService_WhenGivenSuccessfullResponse_ReturnSuccess() {
        
        //Arrange
        MockURLProtocol.stubResponseData = UsersConstants.listUserJSONStringResponse.data(using: .utf8)
        
        let expectation = self.expectation(description: "User Listing WebService Response Expectation")
        //Act
        sut.userListing { (userResponseModel, error) in
            
            //Assert
            XCTAssertEqual(userResponseModel?.data?.firstName, "Janet")
            XCTAssertEqual(userResponseModel?.data?.lastName, "Weaver")
            expectation.fulfill()
        }
        
        self.wait(for: [expectation], timeout: 5)
    }
    
    func testUserWebService_WhenReceivedDifferentJSONResponse_ErrorTookPlace() {
        
        //Arrange
        let jsonString = "{}"
        MockURLProtocol.stubResponseData = jsonString.data(using: .utf8)
        
        let expectation = self.expectation(description: "Users WebService Response Expectation")
        //Act
        sut.userListing { (userResponseModel, error) in
            //Assert
            XCTAssertNil(userResponseModel, "The response model for a request containing unknown JSON response, should have been nil")
            XCTAssertEqual(error, UserErrors.responseModelParsingError, "The userListing() method did not return expected error")
            expectation.fulfill()
        }
        self.wait(for: [expectation], timeout: 5)
    }
    
    func testUserWebService_WhenInvalidURLProvided_ShouldReturnFalse() {
        
        //Arrange
        let myExpectation = expectation(description: "When invalid URL provided should return false")
        sut = UsersWebService(urlString: "", urlSession: urlSession)
        
        //Act
        sut.userListing { (userResponseModel, error) in
            
            //Assert
            XCTAssertEqual(error, UserErrors.invalidURLString)
            XCTAssertNil(userResponseModel)
            myExpectation.fulfill()
        }
        
        self.wait(for: [myExpectation], timeout: 5)
    }
}
