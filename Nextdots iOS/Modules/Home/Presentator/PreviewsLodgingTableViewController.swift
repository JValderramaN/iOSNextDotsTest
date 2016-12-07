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
    
    let interator = InteratorPreviewsLodgingTableViewController()
    var lodgings : [Lodging]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.estimatedRowHeight = 80
//        self.tableView.register(PrototypePreviewLodgingTableViewCell.self, forCellReuseIdentifier: IdentifierPrototypePreviewLodgingTableViewCell)
        
        self.tableView.register(UINib(nibName: String(describing: PrototypePreviewLodgingTableViewCell.self), bundle: nil), forCellReuseIdentifier: IdentifierPrototypePreviewLodgingTableViewCell)
        
        interator.delegate = self
        interator.prepareData()
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
        let cell = tableView.dequeueReusableCell(withIdentifier: IdentifierPrototypePreviewLodgingTableViewCell, for: indexPath) as! PrototypePreviewLodgingTableViewCell

        cell.setData(lodging: lodgings![indexPath.row])

        return cell
    }
}

extension PreviewsLodgingTableViewController : InteratorPreviewsLodgingTableViewControllerDelegate{
    func loadLodgings(lodgings : [Lodging]?){
        self.lodgings = lodgings
        self.tableView.reloadData()
    }
}
