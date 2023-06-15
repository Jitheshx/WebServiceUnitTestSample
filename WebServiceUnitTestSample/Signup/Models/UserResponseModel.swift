//
//  UserResponseModel.swift
//  WebServiceUnitTestSample
//
//  Created by Jithesh Xavier on 09/06/23.
//

import Foundation


struct UserResponseModel: Codable {
    let data: UserResponseDataClass?
    let support: UserResponseSupport?
}

// MARK: - DataClass
struct UserResponseDataClass: Codable {
    let id: Int?
    let email, firstName, lastName: String?
    let avatar: String?

    enum CodingKeys: String, CodingKey {
        case id, email
        case firstName = "first_name"
        case lastName = "last_name"
        case avatar
    }
}

// MARK: - Support
struct UserResponseSupport: Codable {
    let url: String?
    let text: String?
}
