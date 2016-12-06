//
//  Lodging.swift
//  Nextdots iOS
//
//  Created by José Valderrama on 12/6/16.
//  Copyright © 2016 José Valderrama. All rights reserved.
//

import Foundation
import ObjectMapper
import RealmSwift

class Lodging: Object {
    
    dynamic var id: Int = 0
    dynamic var name: String = ""
    dynamic var pictureURL: String = ""
    dynamic var nightlyPrice: float = 0.0
    dynamic var listingCurrency: String = ""
    dynamic var propertyType: String = ""
    dynamic var roomType: String = ""
    dynamic var publicAddress: String = ""
    dynamic var shortescription: String = ""
    dynamic var guests: Int = 0
    dynamic var bathrooms: Int = 0
    dynamic var bedrooms: Int = 0
    dynamic var beds: Int = 0
    dynamic var lat: Float = 0.0
    dynamic var latitude: Float = 0.0
    dynamic var longitude: Float = 0.0
    dynamic var starRating: Int = 0
    dynamic var scrimColor: String = ""
    dynamic var city: String = ""
    
    dynamic var pictureURL1: String = ""
    dynamic var pictureURL2: String = ""
    dynamic var pictureURL3: String = ""
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    override static func primaryKey() -> String? {
        return "id"
    }
}

extension Lodging : Mappable {
    func mapping(map: Map) {
        id <- map["listing.id"]
        id <- map["listing.name"]
    }
}
