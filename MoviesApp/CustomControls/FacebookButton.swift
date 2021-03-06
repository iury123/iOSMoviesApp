//
//  FacebookButton.swift
//  MoviesApp
//
//  Created by Iury Miguel on 30/01/19.
//  Copyright © 2019 Iury Miguel. All rights reserved.
//

import UIKit
import FacebookLogin
import FacebookCore

@IBDesignable class FacebookButton: UIStackView, LoginButtonDelegate {
    
    private var onFacebookLoginResultCallback: ((LoginResult) -> Void)? = nil
    
    private let facebookLoginButton: LoginButton = LoginButton(readPermissions: [ .publicProfile, .email ])
    
    @IBInspectable var facebookButtonSize: CGSize = CGSize(width: 44.0, height: 44.0) {
        didSet {
            setupFacebookLoginButton()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupFacebookLoginButton()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        setupFacebookLoginButton()
    }
    
    private func setupFacebookLoginButton() {
        removeArrangedSubview(facebookLoginButton)
        facebookLoginButton.removeFromSuperview()
        facebookLoginButton.delegate = self
        facebookLoginButton.loginBehavior = .web
        facebookLoginButton.translatesAutoresizingMaskIntoConstraints = false
        facebookLoginButton.heightAnchor.constraint(equalToConstant: facebookButtonSize.height).isActive = true
        facebookLoginButton.widthAnchor.constraint(equalToConstant: facebookButtonSize.width).isActive = true
        addArrangedSubview(facebookLoginButton)
    }
    
    func setOnFacebookLoginResultCallback(callback: ((LoginResult) -> Void)?) {
        onFacebookLoginResultCallback = callback
    }
    
    func loginButtonDidCompleteLogin(_ loginButton: LoginButton, result: LoginResult) {
        if onFacebookLoginResultCallback != nil {
             onFacebookLoginResultCallback!(result)
        }
    }
    
    func loginButtonDidLogOut(_ loginButton: LoginButton) {
        
    }
}
