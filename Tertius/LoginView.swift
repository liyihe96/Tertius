//
//  LoginView.swift
//  Tertius
//
//  Created by mac on 9/19/15.
//  Copyright (c) 2015 Ryan Li. All rights reserved.
//

import Foundation
import UIKit
import Parse

class LoginView: UIViewController {
    
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    func login(username: String, password: String) {
        
        var error: NSErrorPointer?
        
        if let user = PFUser.logInWithUsername(username, password: password, error: error!) {
            print(user)
        } else {
            print(error)
        }
    }
    
    func signup(username: String, password: String, email: String) {
        var user = PFUser()
        user.username = username
        user.password = password
        user.email = email
        user.signUpInBackgroundWithBlock { (succeeded: Bool, error: NSError?) -> Void in
            if succeeded {
                print("Sign up successfully with \(user.username)")
            } else {
                print("An error occured with: \(error)")
            }
        }
    }
    
    
    
    
    
}
