//
//  FacebookUserRequester.swift
//  MoviesApp
//
//  Created by Iury Miguel on 31/01/19.
//  Copyright © 2019 Iury Miguel. All rights reserved.
//

import Foundation
import FacebookCore

struct MyProfileRequest: GraphRequestProtocol {
    struct Response: GraphResponseProtocol {
        
        private let rawResponse: Any?
        
        public var dictionaryValue: [String : Any]? {
            return rawResponse as? [String : Any]
        }
        
        init(rawResponse: Any?) {
            self.rawResponse = rawResponse
        }
    }
    var graphPath = "/me"
    var parameters: [String : Any]? = ["fields": "id, name"]
    var accessToken: AccessToken? = AccessToken.current
    var httpMethod: GraphRequestHTTPMethod = .GET
    var apiVersion: GraphAPIVersion = .defaultVersion
}

class FacebookUserRequester {
    
    private let connection = GraphRequestConnection()
 
    func requestProfile(callback: FacebookRequestUserProtocol) {
        connection.add(MyProfileRequest()) { response, result in
            switch result {
            case .success(let response):
                callback.onSuccessRequestUser(response: response)
            case .failed(let error):
                callback.onErrorRequestUser(error: error)
            }
        }
        connection.start()
    }
    
}
