//
//  SignupWebServiceTests.swift
//  WebServiceUnitTestSampleTests
//
//  Created by Jithesh Xavier on 08/06/23.
//

import XCTest
@testable import WebServiceUnitTestSample

final class SignupWebServiceTests: XCTestCase {
    
    var sut: SignupWebService!
    var signupFormRequestModel: SignupFormRequestModel!

    override func setUpWithError() throws {
        
        let config = URLSessionConfiguration.ephemeral
        config.protocolClasses = [MockURLProtocol.self]
        let urlSession = URLSession(configuration: config)
        sut = SignupWebService(urlString: SignupConstants.signupURLString, urlSession: urlSession)
        
        signupFormRequestModel = SignupFormRequestModel(
            firstName: "Jithesh",
            lastName: "Xavier",
            email: "jitheshxavier@gmail.com",
            password: "123456"
        )
    }

    override func tearDownWithError() throws {
        sut = nil
        signupFormRequestModel = nil
        MockURLProtocol.stubResponseData = nil
    }

 
    func testSignupWebService_WhenGivenSuccessfullResponse_ReturnSuccess() {
        
        //Arrange
        let jsonString = "{\"status\":\"ok\"}"
        MockURLProtocol.stubResponseData = jsonString.data(using: .utf8)
        
        let expectation = self.expectation(description: "Signup WebService Response Expectation")
        //Act
        sut.signup(withForm: signupFormRequestModel) { (signupResponseModel, error) in
            
            //Assert
            XCTAssertEqual(signupResponseModel?.status, "ok")
            expectation.fulfill()
        }
        self.wait(for: [expectation], timeout: 5)
    }

    func testSignupWebService_WhenReceivedDifferentJSONResponse_ErrorTookPlace() {
        
        //Arrange
        let jsonString = "{\"path\":\"/users\", \"error\":\"Internal Server Error\"}"
        MockURLProtocol.stubResponseData = jsonString.data(using: .utf8)
        
        let expectation = self.expectation(description: "Signup WebService Response Expectation")
        //Act
        sut.signup(withForm: signupFormRequestModel) { (signupResponseModel, error) in
            
            //Assert
            XCTAssertNil(signupResponseModel, "The response model for a request containing unknown JSON response, should have been nil")
            XCTAssertEqual(error, SignupErrors.responseModelParsingError, "The signup() method did not return expected error")
            expectation.fulfill()
        }
        self.wait(for: [expectation], timeout: 5)
    }
    
    func testSignupWebService_WhenEmptyURLStringProvided_ReturnError() {
        
        //Arrange
        let expectation = self.expectation(description: "An empty request URL string expectation")
        sut = SignupWebService(urlString: "")
        
        //Act
        sut.signup(withForm: signupFormRequestModel) { (signupResponseModel, error) in
        
            //Assert
            XCTAssertEqual(error, SignupErrors.invalidURLString, "The signup() method did not return an expected error for invalid request string error")
            XCTAssertNil(signupResponseModel, "When an invalid request string provided, the response model must be nil")
            expectation.fulfill()
        }
        self.wait(for: [expectation], timeout: 5)
    }
    
    func testSignupWebService_WhenURLRequestFails_ReturnErrorMessageDescription() {
        
        //Arrange
        let expectation = self.expectation(description: "A failed request expectation")
        let errorDescription = "The operation couldn’t be completed. (WebServiceUnitTestSample.SignupErrors error 0.)"
        MockURLProtocol.error = SignupErrors.failedRequest(description: errorDescription)
        
        //Act
        sut.signup(withForm: signupFormRequestModel) { (signupResponseModel, error) in
            XCTAssertEqual(error, SignupErrors.failedRequest(description: errorDescription))
            expectation.fulfill()
        }
        
        //Assert
        self.wait(for: [expectation], timeout: 5)
    }
}
