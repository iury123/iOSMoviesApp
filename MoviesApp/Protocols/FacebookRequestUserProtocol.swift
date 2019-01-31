//
//  FacebookRequestUserProtocol.swift
//  MoviesApp
//
//  Created by Iury Miguel on 31/01/19.
//  Copyright © 2019 Iury Miguel. All rights reserved.
//

import UIKit
import FacebookCore

protocol FacebookRequestUserProtocol: class {
    func onSuccessRequestUser(response: MyProfileRequest.Response)
    func onErrorRequestUser(error: Error)
}
