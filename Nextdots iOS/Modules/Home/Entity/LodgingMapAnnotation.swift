//
//  LodgingMapAnnotation.swift
//  Nextdots iOS
//
//  Created by José Valderrama on 12/8/16.
//  Copyright © 2016 José Valderrama. All rights reserved.
//

import MapKit

class LodgingMapAnnotation: NSObject, MKAnnotation {
    let coordinate: CLLocationCoordinate2D
    var title: String? {
        get {
            return "\(self.lodging.listingCurrency) \(self.lodging.nightlyPrice)"
        }
    }
    
    var canShowDetail : Bool
    var lodging : Lodging
    
    init(lodging : Lodging, canShowDetail : Bool = true, coordinate: CLLocationCoordinate2D) {
        self.coordinate = coordinate
        self.lodging = lodging
        self.canShowDetail = canShowDetail
        super.init()
    }
}
