//
//  ProfileViewController.swift
//  Nextdots iOS
//
//  Created by José Valderrama on 12/4/16.
//  Copyright © 2016 José Valderrama. All rights reserved.
//

import UIKit
import FacebookCore
import Kingfisher

class ProfileViewController: UIViewController {
    
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var actionsTable: UITableView!
    
    let identifierFavoritesCell = "FavoritesCell"
    let identifierLogoutCell = "LogoutCell"
    let goToFavoritesSegueIdentifier = "goToFavorites"

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = false
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.showUserInfo()
    }

    func showUserInfo(){
        self.nameLabel.text = UserProfile.current?.fullName
        let url = UserProfile.current?.imageURLWith(.square, size: self.profileImage.bounds.size)
        self.profileImage.layer.borderWidth = 2
        self.profileImage.layer.borderColor = UIColor.lightGray.cgColor
        self.profileImage.layer.cornerRadius = self.profileImage.bounds.size.height / 2
        self.profileImage.kf.setImage(with: url)
    }
}

// MARK: - UITableViewDataSource
extension ProfileViewController : UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            return tableView.dequeueReusableCell(withIdentifier: identifierFavoritesCell)!
        default:
            return tableView.dequeueReusableCell(withIdentifier: identifierLogoutCell)!
        }
    }
}

// MARK: - UITableViewDelegate
extension ProfileViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            self.performSegue(withIdentifier: self.goToFavoritesSegueIdentifier, sender: self)
        default:
            self.logout()
        }
    }
}
