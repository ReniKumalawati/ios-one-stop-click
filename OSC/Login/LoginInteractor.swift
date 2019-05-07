//
//  LoginInteractor.swift
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
import Alamofire

protocol LoginBusinessLogic
{
    func doLogin(request: Login.User.Request)
}

protocol LoginDataStore
{
    var name: String { get set }
}

class LoginInteractor: LoginBusinessLogic, LoginDataStore
{
    var presenter: LoginPresentationLogic?
    var worker: LoginWorker?
    var name: String = ""
    
    // MARK: Do something
    
    func doLogin(request: Login.User.Request)
    {
        var message: String = ""
        var error: Bool = false
        if request.email.isEmpty{
            error = true
            message = "Please input your email"
        }else if request.password.isEmpty{
            error = true
            message = "Please input your password"
        }
        
        if(error){
            presenter?.presentFailedLogin(title: "Login Failed", message: message)
        }else{
            
            let parameters = [
                "username": request.email,
                "password": request.password
            ]
            
            Alamofire.request(Config().endpoint + "auth/token", method: .post, parameters: parameters, encoding: URLEncoding.default).responseJSON{ response in
                do{
                    let loginStruct = try JSONDecoder().decode(Login.User.LoginResponse.self, from: response.data!)
                    self.presenter?.presentSuccessLogin()
                }catch _{
                    self.presenter?.presentFailedLogin(title: "Login Failed", message: "Please check your email or password")
                }
            }
        }
    }
}