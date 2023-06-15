//
//  UserModelValidatorProtocol.swift
//  WebServiceUnitTestSample
//
//  Created by Jithesh Xavier on 14/06/23.
//

import Foundation

protocol UserModelValidatorProtocol: AnyObject {
    func isUserIdValid(userId: String) -> Bool
}
