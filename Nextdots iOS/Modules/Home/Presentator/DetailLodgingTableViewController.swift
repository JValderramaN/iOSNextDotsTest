//
//  DetailLodgingTableViewController.swift
//  Nextdots iOS
//
//  Created by José Valderrama on 12/7/16.
//  Copyright © 2016 José Valderrama. All rights reserved.
//

import UIKit

private let kIdentifierPicturesGalleryCell = "kIdentifierPicturesGalleryCell"

class DetailLodgingTableViewController: UITableViewController {
    
    let showLodgingPicturesSegueIdentifier = "showLodgingPictures"
    var lodging : Lodging!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.register(UINib(nibName: String(describing: DetailLodgingTableViewCell.self), bundle: nil), forCellReuseIdentifier: kIdentifierDetailLodgingTableViewCell)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: kIdentifierDetailLodgingTableViewCell, for: indexPath) as! DetailLodgingTableViewCell
        
        cell.setData(lodging: lodging)
        print("5...")
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return indexPath.row == 0 ? kDetailLodgingTableViewCellHeight : 0
    }
}
