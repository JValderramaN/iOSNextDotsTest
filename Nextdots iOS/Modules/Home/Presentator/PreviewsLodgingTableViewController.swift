//
//  PreviewsLodgingTableViewController.swift
//  Nextdots iOS
//
//  Created by José Valderrama on 12/6/16.
//  Copyright © 2016 José Valderrama. All rights reserved.
//

import UIKit
import RealmSwift

class PreviewsLodgingTableViewController: UITableViewController {
    
    let goToLodgingDetailSegueIdentifier = "goToLodgingDetail"
    let interator = InteratorPreviewsLodgingTableViewController()
    var lodgings : [Lodging]?
    
    var lodgingSelected : Lodging?
    
    var isFavorites : Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.register(UINib(nibName: String(describing: PreviewLodgingTableViewCell.self), bundle: nil), forCellReuseIdentifier: kIdentifierPreviewLodgingTableViewCell)
        
        self.title = isFavorites ? "Favorites" : "Home"
        
        interator.delegate = self
        interator.prepareData(favorites : isFavorites)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = isFavorites
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
        return lodgings?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: kIdentifierPreviewLodgingTableViewCell, for: indexPath) as! PreviewLodgingTableViewCell

        cell.setData(lodging: lodgings![indexPath.row])

        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return lodgings!.count > 0 ? kPreviewLodgingTableViewCellHeight : 0
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! PreviewLodgingTableViewCell
        lodgingSelected = cell.lodging
        self.performSegue(withIdentifier: self.goToLodgingDetailSegueIdentifier, sender: self)
    }
}

extension PreviewsLodgingTableViewController : InteratorPreviewsLodgingTableViewControllerDelegate{
    func loadLodgings(lodgings : [Lodging]?){
        self.lodgings = lodgings
        self.tableView.reloadData()
    }
}
