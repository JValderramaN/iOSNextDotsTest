//
//  InteratorPreviewsLodgingTableViewController.swift
//  Nextdots iOS
//
//  Created by José Valderrama on 12/6/16.
//  Copyright © 2016 José Valderrama. All rights reserved.
//

protocol InteratorPreviewsLodgingTableViewControllerDelegate : class {
    func loadLodgings(lodgings : [Lodging]?)
}

class InteratorPreviewsLodgingTableViewController : DataManagerDelegate {
    
    var delegate: InteratorPreviewsLodgingTableViewControllerDelegate?
    let dataManager = DataManagerHome()
    
    func prepareData(favorites : Bool) {
        dataManager.delegate = self
        dataManager.fetchLodgings(favorites: favorites)
    }
    
    func responseDataManager <T>(response: T) {
        delegate?.loadLodgings(lodgings: response as? [Lodging])
    }
}
