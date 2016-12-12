//
//  RouterMap.swift
//  Nextdots iOS
//
//  Created by José Valderrama on 12/12/16.
//  Copyright © 2016 José Valderrama. All rights reserved.
//

import UIKit

extension MapViewController{
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let lodging = self.lodgingSelected , segue.identifier == self.goToMapLodgingDetailSegueIdentifier{            
            let detailLodgingVC = segue.destination as! DetailLodgingTableViewController
            detailLodgingVC.lodging = lodging
        }
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        return identifier == self.goToMapLodgingDetailSegueIdentifier
    }
}
