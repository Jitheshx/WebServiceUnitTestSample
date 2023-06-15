//
//  UserWebServiceProtocol.swift
//  WebServiceUnitTestSample
//
//  Created by Jithesh Xavier on 14/06/23.
//

import Foundation

protocol UserWebServiceProtocol {
    func userListing(completionHandler: @escaping (UserResponseModel?, UserErrors?) -> Void)
}
