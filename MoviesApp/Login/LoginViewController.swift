//
//  LoginViewController.swift
//  MoviesApp
//
//  Created by Iury Miguel on 30/01/19.
//  Copyright © 2019 Iury Miguel. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var facebookButton: FacebookButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        checkIfUserIsLoggedByFacebook()
        
        facebookButton.setOnFacebookLoginResult(callback: { result in
            let c = result
        })
    }


    private func checkIfUserIsLoggedByFacebook() {
        
    }
}

