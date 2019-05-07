//
//  LoginRouter.swift
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

@objc protocol LoginRoutingLogic
{
  func routeToRegister(segue: UIStoryboardSegue?)
}

protocol LoginDataPassing
{
  var dataStore: LoginDataStore? { get }
}

class LoginRouter: NSObject, LoginRoutingLogic, LoginDataPassing
{
    func routeToRegister(segue: UIStoryboardSegue?) {
        if let segue = segue{
            let destinationVC = segue.destination as! RegisterViewController
            _ = destinationVC.router!.dataStore!
        }else{
            let storyboard = UIStoryboard(name: "Main", bundle: nil);
            let destinationVC = storyboard.instantiateViewController(withIdentifier: "RegistrationViewController") as! RegisterViewController
            
            var destinationDS = destinationVC.router!.dataStore!
                passDataToRegister(source: dataStore!, destination: &destinationDS)
                navigateToRegister(source: viewController!, destination: destinationVC)
        }
    }
    
  weak var viewController: LoginViewController?
  var dataStore: LoginDataStore?
  

  // MARK: Navigation
  
  func navigateToRegister(source: LoginViewController, destination: RegisterViewController)
  {
    source.show(destination, sender: nil)
  }
  
  // MARK: Passing data
  
  func passDataToRegister(source: LoginDataStore, destination: inout RegisterDataStore)
  {
    destination.name = source.name
  }
}
