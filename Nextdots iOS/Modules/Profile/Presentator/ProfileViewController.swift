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
    let goToFavoritesSegueIdentifier = "goToFavorites"

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.showUserInfo()
    }

    func showUserInfo(){
        self.nameLabel.text = UserProfile.current?.fullName
        let url = UserProfile.current?.imageURLWith(.square, size: self.profileImage.bounds.size)
        print("url", url)
        self.profileImage.layer.cornerRadius = self.profileImage.bounds.size.height / 2
        self.profileImage.kf.setImage(with: url)
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        return identifier == self.goToFavoritesSegueIdentifier
    }
}

// MARK: - UITableViewDataSource
extension ProfileViewController : UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCell(withIdentifier: identifierFavoritesCell)!
    }
    
}

// MARK: - UITableViewDelegate
extension ProfileViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: self.goToFavoritesSegueIdentifier, sender: self)
    }
}
