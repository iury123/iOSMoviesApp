//
//  LoginViewController.swift
//  MoviesApp
//
//  Created by Iury Miguel on 30/01/19.
//  Copyright © 2019 Iury Miguel. All rights reserved.
//

import UIKit
import FacebookCore

class LoginViewController: UIViewController, Injectable, FacebookRequestUserProtocol {
   
    var facebookUserRequester: FacebookUserRequester!
    
    @IBOutlet weak var facebookButton: FacebookButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        checkIfUserIsLoggedByFacebook()
    }

    private func checkIfUserIsLoggedByFacebook() {
        if(AccessToken.current != nil) {
            facebookUserRequester.requestProfile(callback: self)
        } else {
            facebookButton.setOnFacebookLoginResultCallback(callback: { result in
                self.facebookUserRequester.requestProfile(callback: self)
            })
        }
    }
    
    func onSuccessRequestUser(response: MyProfileRequest.Response) {
        print("Custom Graph Request Succeeded: \(response)")
    }
    
    func onErrorRequestUser(error: Error) {
        print("Custom Graph Request Failed: \(error)")
    }
}

