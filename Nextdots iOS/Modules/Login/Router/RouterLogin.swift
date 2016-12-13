//
//  RouterLogin.swift
//  Nextdots iOS
//
//  Created by José Valderrama on 12/12/16.
//  Copyright © 2016 José Valderrama. All rights reserved.
//

import UIKit

extension LoginViewController{
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        return identifier == self.goToHomeSegueIdentifier
    }
}
