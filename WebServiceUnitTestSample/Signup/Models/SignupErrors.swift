//
//  SignupErrors.swift
//  WebServiceUnitTestSample
//
//  Created by Jithesh Xavier on 09/06/23.
//

import Foundation

enum SignupErrors: LocalizedError, Equatable {
    case responseModelParsingError
    case invalidURLString
    case failedRequest(description: String)
    
    var errorDescription: String? {
        switch self {
        case .failedRequest(let description):
            return description
        case .responseModelParsingError, .invalidURLString:
            return ""
        }
    }
}
