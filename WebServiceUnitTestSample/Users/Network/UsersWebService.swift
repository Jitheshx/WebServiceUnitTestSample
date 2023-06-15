//
//  UsersWebService.swift
//  WebServiceUnitTestSample
//
//  Created by Jithesh Xavier on 09/06/23.
//

import Foundation

class UsersWebService: UserWebServiceProtocol {
    
    private var urlString: String
    private var urlSession: URLSession
    
    init(urlString: String, urlSession: URLSession = .shared) {
        self.urlString = urlString
        self.urlSession = urlSession
    }

    func userListing(completionHandler: @escaping (UserResponseModel?, UserErrors?) -> Void) {
        
        guard let url = URL(string: urlString) else {
            completionHandler(nil, UserErrors.invalidURLString)
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        
        
        let dataTask = self.urlSession.dataTask(with: request) { (data, response, error) in
            
            if let _ = error {
                completionHandler(nil, UserErrors.invalidRequest)
                return
            }
            
            if let data = data,
               let userResponseModel = try? JSONDecoder().decode(UserResponseModel.self, from: data),
               let _ = userResponseModel.data {
                completionHandler(userResponseModel, nil)
            } else {
                completionHandler(nil, UserErrors.responseModelParsingError)
            }
        }
        
        dataTask.resume()
    }
}
