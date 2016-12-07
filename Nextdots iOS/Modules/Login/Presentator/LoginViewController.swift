//
//  LoginViewController.swift
//  Nextdots iOS
//
//  Created by José Valderrama on 12/4/16.
//  Copyright © 2016 José Valderrama. All rights reserved.
//

import UIKit
import FacebookLogin
import FacebookCore
import MBProgressHUD

class LoginViewController: UIViewController {
    
    let goToHomeSegueIdentifier = "goToHome"

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func loginWithFacebookButtonTapped(_ sender: UIButton) {
        let loginManager = LoginManager()
        loginManager.logIn([ .publicProfile ], viewController: self) { loginResult in
            switch loginResult {
            case .failed(let error):
                print(error)
            case .cancelled:
                print("User cancelled login.")
            case .success(let grantedPermissions, let declinedPermissions, let accessToken):
                print("Logged in!", grantedPermissions, declinedPermissions, accessToken)
               
                self.loadCurrentUser()
            }
        }
    }
    
    func loadCurrentUser(){
        MBProgressHUD.showAdded(to: self.view, animated: true)
        UserProfile.loadCurrent({ (FetchResult) in
            print("user", UserProfile.current?.fullName)
            
            if let _ = UserProfile.current {
                MBProgressHUD.hide(for: self.view, animated: true)
                self.performSegue(withIdentifier: self.goToHomeSegueIdentifier, sender: self)
            }
        })
    }

    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        return identifier == self.goToHomeSegueIdentifier
    }
}

