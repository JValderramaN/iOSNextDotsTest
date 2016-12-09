//
//  LodgingMapPin.swift
//  Nextdots iOS
//
//  Created by José Valderrama on 12/8/16.
//  Copyright © 2016 José Valderrama. All rights reserved.
//

import MapKit

class LodgingMapPin: NSObject, MKAnnotation {
    let coordinate: CLLocationCoordinate2D
    let title: String?
    
    init(title: String, coordinate: CLLocationCoordinate2D) {
        self.coordinate = coordinate
        self.title = title
        super.init()
    }
}
