//
//  RouterProfile.swift
//  Nextdots iOS
//
//  Created by José Valderrama on 12/12/16.
//  Copyright © 2016 José Valderrama. All rights reserved.
//

import UIKit
import FacebookLogin
import FacebookCore

extension ProfileViewController{
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let segueIdentifier = segue.identifier{
            switch segueIdentifier {
            case self.goToFavoritesSegueIdentifier:
                let favoritesVC = segue.destination as! PreviewsLodgingTableViewController
                favoritesVC.isFavorites = true
            default : break
            }
        }
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        return identifier == self.goToFavoritesSegueIdentifier
    }
    
    func logout(){
        let loginManager = LoginManager()
        loginManager.logOut()
        let loginVC = UIStoryboard.init(name: "Login", bundle: nil).instantiateViewController(withIdentifier: "LoginViewController")
        self.present(loginVC, animated: true, completion: nil)
    }
}
