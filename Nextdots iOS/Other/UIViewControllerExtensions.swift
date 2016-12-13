//
//  UIViewControllerExtensions.swift
//  Nextdots iOS
//
//  Created by José Valderrama on 12/13/16.
//  Copyright © 2016 José Valderrama. All rights reserved.
//

import UIKit

extension UIViewController {
    func showAlert(withTitle title: String?, message: String?) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
}
