//
//  LoginPresenter.swift
//  OSC
//
//  Created by Dyan Galih on 07/05/19.
//  Copyright (c) 2019 Dyan Galih. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol LoginPresentationLogic
{
    func presentFailedLogin(title: String, message: String)
    func presentSuccessLogin()
}

class LoginPresenter: LoginPresentationLogic
{
 
    weak var viewController: LoginDisplayLogic?
    
    func presentFailedLogin(title: String, message: String) {
        viewController?.showLoginAlert(tilte: title, message: message)
    }
    
    func presentSuccessLogin() {
        viewController?.showSuccessLogin()
    }

    // MARK: Do something
}
