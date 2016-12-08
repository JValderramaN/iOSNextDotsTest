//
//  RouterHome.swift
//  Nextdots iOS
//
//  Created by José Valderrama on 12/7/16.
//  Copyright © 2016 José Valderrama. All rights reserved.
//

import UIKit

extension PreviewsLodgingTableViewController{
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let lodging = self.lodgingSelected , segue.identifier == self.goToLodgingDetailSegueIdentifier{
            let detailLodgingVC = segue.destination as! DetailLodgingTableViewController
            detailLodgingVC.lodging = lodging
        }
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        return identifier == self.goToLodgingDetailSegueIdentifier
    }
}

extension DetailLodgingTableViewController{
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == self.showLodgingPicturesSegueIdentifier{
            let lodgingPicturesVC = segue.destination as! LodgingPictuesCollectionViewController
            lodgingPicturesVC.lodging = self.lodging
        }
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        return identifier == self.showLodgingPicturesSegueIdentifier
    }
}
