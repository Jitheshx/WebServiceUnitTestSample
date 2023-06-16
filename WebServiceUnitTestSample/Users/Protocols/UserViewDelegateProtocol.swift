//
//  UserViewDelegateProtocol.swift
//  WebServiceUnitTestSample
//
//  Created by Jithesh Xavier on 14/06/23.
//

import Foundation

protocol UserViewDelegateProtocol: AnyObject {
    
    func userDetailsFetched()
    func errorHandler(error: UserErrors?)
}
